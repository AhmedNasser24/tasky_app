import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/core/errors/failure.dart';
import 'package:tasky_app/core/models/task_model.dart';
import 'package:tasky_app/feature/create_edit/data/repo/task_operation_repo.dart';

part 'task_operation_state.dart';

class TaskOperationCubit extends Cubit<TaskOperationState> {
  TaskOperationCubit({required this.taskOperationRepoImpl})
      : super(FetchTaskInitial());
  final TaskOperationRepo taskOperationRepoImpl;
  int __pageNum = 1;
  final int __maxItemPerPage = 20;
  bool __isThereMoreItems = true;
  bool __isFirstTaskOperation = true;
  List<TaskModel>? __tasksList;
  String __currFilter = kAll;
  StreamSubscription<List<ConnectivityResult>>?
      __connectivityStreamSubscription;
  bool __isNetworkConnected = true;
  bool isLoading = false;

  void initAllDataOfCubit() {
    __pageNum = 1;
    __isThereMoreItems = true;
    __isFirstTaskOperation = true;
    __tasksList = null;
    __currFilter = kAll;
    __isNetworkConnected = true;
    __connectivityStreamSubscription?.cancel();
    __connectivityStreamSubscription = null;
  }

  Future<void> fetchData() async {
    if (__isThereMoreItems == false) {
      return;
    }
    if (!__isNetworkConnected) {
      emit(NoInternetConnection());
      return;
    }
    isLoading = true;
    if (__isFirstTaskOperation) {
      emit(FetchTaskLoading());
    }
    Either<List<TaskModel>, Failure> result =
        await taskOperationRepoImpl.fetchAllTasks(pageNum: __pageNum);
    result.fold(
      (tasksList) {
        if (__tasksList != null) {
          {
            for (var task in tasksList) {
              __tasksList!.add(task);
            }
          }
        } else {
          __tasksList = tasksList;
        }
        if (tasksList.length < __maxItemPerPage) {
          __isThereMoreItems = false;
        } else {
          __pageNum++;
        }

        __isFirstTaskOperation = false;
        emit(FetchTaskSuccess(__tasksList!));
      },
      (fail) {
        emit(FetchTaskFailure(fail.errMessage));
      },
    );
    isLoading = false;
  }

  Future<void> refresh() async {
    if (!__isNetworkConnected) {
      emit(NoInternetConnection());
      return;
    }
    __pageNum = 1;
    __isThereMoreItems = true;
    __isFirstTaskOperation = true;
    __tasksList = null;
    await fetchData();
  }

  bool get isThereMoreItems => __isThereMoreItems;

  List<TaskModel>? get tasksList => __tasksList;

  void changeFilter(String value) {
    __currFilter = value;
    if (__isFirstTaskOperation) return;
    if (tasksList?.isEmpty ?? true) return;
    emit(FetchTaskSuccess(tasksList));
  }

  String get currFilter => __currFilter;
  bool get isFirstTaskOperation => __isFirstTaskOperation;
  Future<void> editTask({required TaskModel taskModel}) async {
    if (!__isNetworkConnected) {
      emit(NoInternetConnection());
      return;
    }
    emit(EditTaskLoading());
    Either<void, Failure> result =
        await taskOperationRepoImpl.editTask(taskModel: taskModel);
    result.fold(
      (ok) {
        int index = taskModel.currIndex!;
        __tasksList!.replaceRange(index, index + 1, [taskModel]);
        emit(EditTaskSuccess());
        emit(FetchTaskSuccess(__tasksList!)); // to display task in bloc builder
      },
      (fail) => emit(EditTaskFailure(fail.errMessage)),
    );
  }

  Future<void> createTask({required TaskModel taskModel}) async {
    if (!__isNetworkConnected) {
      emit(NoInternetConnection());
      return;
    }
    emit(CreateTaskLoading());
    Either<TaskModel, Failure> result =
        await taskOperationRepoImpl.createTask(taskModel: taskModel);
    result.fold(
      (createdTask) {
        __tasksList == null
            ? __tasksList = [createdTask]
            : __tasksList!.add(createdTask);
        emit(CreateTaskSuccess());
        emit(FetchTaskSuccess(__tasksList!)); // to display task in bloc builder
      },
      (fail) => emit(CreateTaskFailure(fail.errMessage)),
    );
  }

  void deleteTask({required TaskModel taskModel}) async {
    if (!__isNetworkConnected) {
      emit(NoInternetConnection());
      return;
    }
    emit(DeleteTaskLoading());
    String taskId = taskModel.taskId!;
    var result = await taskOperationRepoImpl.deleteTask(taskId: taskId);
    result.fold(
      (ok) {
        int index = taskModel.currIndex!;
        __tasksList!.removeAt(index);
        emit(DeleteTaskSuccess());
        emit(FetchTaskSuccess(__tasksList!)); // to display task in bloc builder
      },
      (fail) => emit(DeleteTaskFailure(fail.errMessage)),
    );
  }

  void checkConnectevity() {
    __connectivityStreamSubscription =
        Connectivity().onConnectivityChanged.listen(
      (connectivityResult) {
        if (__isFirstTaskOperation) {
          if (connectivityResult.contains(ConnectivityResult.none)) {
            __isNetworkConnected = false;
            emit(NoInternetConnection()); // to show image at first
          } else if (connectivityResult.contains(ConnectivityResult.wifi) ||
              connectivityResult.contains(ConnectivityResult.mobile)) {
            if (!__isNetworkConnected)
              emit(
                  InternetConnectionReturned()); // to not display at first when app is already have connection to internet
            __isNetworkConnected = true;
            fetchData();
          }
        } else {
          if (connectivityResult.contains(ConnectivityResult.none)) {
            __isNetworkConnected = false;
            emit(
                NoInternetConnection()); // use this with isFirstTaskOperation to show snackbar with old tasks
          } else if (connectivityResult.contains(ConnectivityResult.wifi) ||
              connectivityResult.contains(ConnectivityResult.mobile)) {
            __isNetworkConnected = true;
            emit(InternetConnectionReturned());
          }
        }
      },
    );
  }

  Future<void> cancelConnectivityStream() async {
    __connectivityStreamSubscription = null;
  }

  @override
  Future<void> close() {
    __connectivityStreamSubscription?.cancel();
    return super.close();
  }
}
