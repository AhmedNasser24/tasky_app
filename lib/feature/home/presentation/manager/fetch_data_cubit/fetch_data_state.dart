part of 'fetch_data_cubit.dart';

abstract class FetchDataState {}

class FetchDataInitial extends FetchDataState {}

class FetchDataLoading extends FetchDataState {}

class FetchDataSuccess extends FetchDataState {
  final List<TaskModel> dataList;

  FetchDataSuccess(this.dataList);
}

class FetchDataFailure extends FetchDataState {
  final String errMessage;

  FetchDataFailure(this.errMessage);
}
