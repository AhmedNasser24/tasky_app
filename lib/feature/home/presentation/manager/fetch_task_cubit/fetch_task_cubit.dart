import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/core/errors/failure.dart';
import 'package:tasky_app/core/models/task_model.dart';
import 'package:tasky_app/feature/home/data/repo/data_repo.dart';

part 'fetch_task_state.dart';

class FetchTaskCubit extends Cubit<FetchTaskState> {
  FetchTaskCubit(this.dataRepoImpl) : super(FetchTaskInitial());
  final DataRepo dataRepoImpl;
  int __pageNum = 1;
  final int __maxItemPerPage = 20;
  bool __isThereMoreItems = true;
  bool __isFirstLoading = true;
  List<TaskModel>? __tasksList;
  String __currFilter = kAll;

  Future<void> fetchData() async {
    if (__isThereMoreItems == false) {
      return;
    }
    if (__isFirstLoading) {
      emit(FetchTaskLoading());
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

  get currFilter => __currFilter;
}
