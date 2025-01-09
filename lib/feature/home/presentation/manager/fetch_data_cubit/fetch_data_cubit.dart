
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/errors/failure.dart';
import 'package:tasky_app/feature/home/data/models/task_model.dart';
import 'package:tasky_app/feature/home/data/repo/data_repo.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit(this.dataRepoImpl) : super(FetchDataInitial());
  final DataRepo dataRepoImpl ;
  Future < void > fetchData () async {
    emit(FetchDataLoading());
    Either<List <TaskModel>, Failure> result = await dataRepoImpl.fetchData();
    result.fold(
      (tasksList) => emit(FetchDataSuccess(tasksList)),
      (fail) => emit(FetchDataFailure(fail.errMessage)),
    );
  }
}
