import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/core/errors/failure.dart';
import 'package:tasky_app/core/models/task_model.dart';
import 'package:tasky_app/feature/home/data/repo/home_repo.dart';

part 'fetch_task_state.dart';

class FetchTaskCubit extends Cubit<FetchTaskState> {
  FetchTaskCubit(this.homeRepoImpl) : super(FetchTaskInitial());
  final HomeRepo homeRepoImpl;
  int __pageNum = 1;
  final int __maxItemPerPage = 20;
  bool __isThereMoreItems = true;
  bool __isFirstLoading = true;
  List<TaskModel>? __tasksList;
  String __currFilter = kAll;
  StreamSubscription<List<ConnectivityResult>>? __connectivityStreamSubscription;
  bool __isNetworkConnected = true;
  Future<void> fetchData() async {
    if (__isThereMoreItems == false) {
      return;
    }

    if (!__isNetworkConnected) {
      return ;
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

  void checkConnectevity() {
    __connectivityStreamSubscription = Connectivity().onConnectivityChanged.listen(
      (connectivityResult) {
        if (__isFirstLoading){
          if (connectivityResult.contains(ConnectivityResult.none)) {
            __isNetworkConnected = false;
            emit(FetchTaskNoInternet());        // to show image at first
          }else if ( connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.mobile)) {
            __isNetworkConnected = true;
            fetchData();
          }
        }else {
          if (connectivityResult.contains(ConnectivityResult.none)) {
            __isNetworkConnected = false;
          }else if ( connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.mobile)) {
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
