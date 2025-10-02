part of 'fetch_task_cubit.dart';

abstract class FetchTaskState {}

class FetchTaskInitial extends FetchTaskState {}

class FetchTaskLoading extends FetchTaskState {}
class FetchTaskEmpty extends FetchTaskState {}

class FetchTaskSuccess extends FetchTaskState {
  final List<TaskModel> tasksList;

  FetchTaskSuccess(this.tasksList);
}

class FetchTaskFailure extends FetchTaskState {
  final String errMessage;

  FetchTaskFailure(this.errMessage);
}

class FetchTaskNoInternet extends FetchTaskState {}
