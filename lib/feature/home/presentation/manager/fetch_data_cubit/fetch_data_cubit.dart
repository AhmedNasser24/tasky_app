import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/errors/failure.dart';
import 'package:tasky_app/feature/home/data/models/task_model.dart';
import 'package:tasky_app/feature/home/data/repo/data_repo.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit(this.dataRepoImpl) : super(FetchDataInitial());
  final DataRepo dataRepoImpl;
  int __pageNum = 1;
  final int __maxItemPerPage = 20;
  bool __isThereMoreItems = true;
  bool __isFirstLoading = true;
  List<TaskModel>? __tasksList;
  Future<void> fetchData() async {
    if (__isThereMoreItems == false) {
      return;
    }
    if (__isFirstLoading) {
      emit(FetchDataLoading());
      __isFirstLoading = false;
    }
    Either<List<TaskModel>, Failure> result =
        await dataRepoImpl.fetchData(pageNum: __pageNum);
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
        log("page num : $__pageNum");
        emit(FetchDataSuccess(tasksList));
      },
      (fail) => emit(FetchDataFailure(fail.errMessage)),
    );
  }

  Future<void> refresh() async {
    __pageNum = 1;
    __isThereMoreItems = true;
    __isFirstLoading = true;
    __tasksList = null;
    fetchData();
  }

  get isThereMoreItems => __isThereMoreItems;

  get tasksList => __tasksList;
}
