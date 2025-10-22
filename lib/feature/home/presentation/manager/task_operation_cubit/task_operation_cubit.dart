import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/home/domain/user_cases/create_task_user_case.dart';
import 'package:tasky_app/feature/home/domain/user_cases/delete_task_user_case.dart';
import 'package:tasky_app/feature/home/domain/user_cases/edit_task_user_case.dart';
import 'package:tasky_app/feature/home/domain/user_cases/fetch_all_task_user_case.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/task_entity.dart';

part 'task_operation_state.dart';

class TaskOperationCubit extends Cubit<TaskOperationState> {
  TaskOperationCubit({
    required this.fetchAllTaskUserCase,
    required this.createTaskUserCase,
    required this.editTaskUserCase,
    required this.deleteTaskUserCase,
  }) : super(InitialState());
  final FetchAllTaskUserCase fetchAllTaskUserCase;
  final CreateTaskUserCase createTaskUserCase;
  final EditTaskUserCase editTaskUserCase;
  final DeleteTaskUserCase deleteTaskUserCase;


  int __pageNum = 1;
  final int __maxItemPerPage = 20;
  bool __isThereMoreItems = true;
  bool __isFirstTaskOperation = true;
  List<TaskEntity>? __tasksList;
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
    emit(InitialState());
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
    Either<List<TaskEntity>, Failure> result =
        await fetchAllTaskUserCase(pageNum: __pageNum);
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

  List<TaskEntity>? get tasksList => __tasksList;

  void changeFilter(String value) {
    __currFilter = value;
    if (__isFirstTaskOperation) return;
    if (tasksList?.isEmpty ?? true) return;
    emit(FetchTaskSuccess(tasksList));
  }

  String get currFilter => __currFilter;
  bool get isFirstTaskOperation => __isFirstTaskOperation;
  Future<void> editTask({required TaskEntity taskEntity}) async {
    if (!__isNetworkConnected) {
      emit(NoInternetConnection());
      return;
    }
    emit(EditTaskLoading());
    Either<void, Failure> result =
        await editTaskUserCase(taskEntity: taskEntity);
    result.fold(
      (ok) {
        int index = taskEntity.currIndex!;
        __tasksList!.replaceRange(index, index + 1, [taskEntity]);
        emit(EditTaskSuccess());
        emit(FetchTaskSuccess(__tasksList!)); // to display task in bloc builder
      },
      (fail) => emit(EditTaskFailure(fail.errMessage)),
    );
  }

  Future<void> createTask({required TaskEntity taskEntity}) async {
    if (!__isNetworkConnected) {
      emit(NoInternetConnection());
      return;
    }
    emit(CreateTaskLoading());
    Either<TaskEntity, Failure> result =
        await createTaskUserCase(taskEntity: taskEntity);
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

  void deleteTask({required TaskEntity taskModel}) async {
    if (!__isNetworkConnected) {
      emit(NoInternetConnection());
      return;
    }
    emit(DeleteTaskLoading());
    String taskId = taskModel.taskId!;
    var result = await deleteTaskUserCase(taskId: taskId);
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
            if (!__isNetworkConnected) {
              emit(InternetConnectionReturned());
            } // to not display at first when app is already have connection to internet
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
