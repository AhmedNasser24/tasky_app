import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/core/errors/failure.dart';
import 'package:tasky_app/core/models/task_model.dart';
import 'package:tasky_app/feature/create_edit/data/repo/task_operation_repo.dart';
import 'package:tasky_app/feature/home/data/repo/home_repo.dart';

part 'fetch_task_state.dart';

class FetchTaskCubit extends Cubit<FetchTaskState> {
  FetchTaskCubit(
      {required this.homeRepoImpl, required this.taskOperationRepoImpl})
      : super(FetchTaskInitial());
  final HomeRepo homeRepoImpl;
  final TaskOperationRepo taskOperationRepoImpl;
  int __pageNum = 1;
  final int __maxItemPerPage = 20;
  bool __isThereMoreItems = true;
  bool __isFirstLoading = true;
  List<TaskModel>? __tasksList;
  String __currFilter = kAll;
  StreamSubscription<List<ConnectivityResult>>?
      __connectivityStreamSubscription;
  bool __isNetworkConnected = true;
  Future<void> fetchData() async {
    if (__isThereMoreItems == false) {
      return;
    }
    if (!__isNetworkConnected) {
      return;
    }
    if (__isFirstLoading) {
      emit(FetchTaskLoading());
    }
    Either<List<TaskModel>, Failure> result =
        await homeRepoImpl.fetchAllTasks(pageNum: __pageNum);
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
        if (__tasksList!.isEmpty) {
          emit(FetchTaskEmpty());
        } else {
          emit(FetchTaskSuccess(__tasksList!));
        }
      },
      (fail) {
        if (__isFirstLoading) emit(FetchTaskFailure(fail.errMessage));
      },
    );
    __isFirstLoading = false;
  }

  Future<void> refresh() async {
    __pageNum = 1;
    __isThereMoreItems = true;
    __isFirstLoading = true;
    __tasksList = null;
    fetchData();
  }

  bool get isThereMoreItems => __isThereMoreItems;

  List<TaskModel>? get tasksList => __tasksList;

  void changeFilter(String value) {
    __currFilter = value;
    if (__isFirstLoading) return;
    if (tasksList!.isEmpty) return;
    emit(FetchTaskSuccess(tasksList!));
  }

  String get currFilter => __currFilter;

  Future<void> editTask({required TaskModel taskModel}) async {
    if (!__isNetworkConnected) {
      emit(EditTaskFailure("No internet connection"));
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
      emit(CreateTaskFailure("No internet connection"));
      return;
    }
    emit(CreateTaskLoading());
    Either<TaskModel, Failure> result =
        await taskOperationRepoImpl.createTask(taskModel: taskModel);
    result.fold(
      (createdTask) {
        __tasksList == null ? __tasksList = [createdTask] : __tasksList!.add(createdTask);
        emit(CreateTaskSuccess());
        emit(FetchTaskSuccess(__tasksList!)); // to display task in bloc builder
      },
      (fail) => emit(CreateTaskFailure(fail.errMessage)),
    );
  }

  void deleteTask({required TaskModel taskModel}) async {
    if (!__isNetworkConnected) {
      emit(DeleteTaskFailure("No internet connection"));
      return;
    }
    emit(DeleteTaskLoading());
    String taskId = taskModel.taskId!;
    var result = await homeRepoImpl.deleteTask(taskId: taskId);
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
        if (__isFirstLoading) {
          if (connectivityResult.contains(ConnectivityResult.none)) {
            __isNetworkConnected = false;
            emit(FetchTaskNoInternet()); // to show image at first
          } else if (connectivityResult.contains(ConnectivityResult.wifi) ||
              connectivityResult.contains(ConnectivityResult.mobile)) {
            __isNetworkConnected = true;
            fetchData();
          }
        } else {
          if (connectivityResult.contains(ConnectivityResult.none)) {
            __isNetworkConnected = false;
          } else if (connectivityResult.contains(ConnectivityResult.wifi) ||
              connectivityResult.contains(ConnectivityResult.mobile)) {
            __isNetworkConnected = true;
          }
        }
      },
    );
  }

  @override
  Future<void> close() {
    __connectivityStreamSubscription?.cancel();
    return super.close();
  }
}
