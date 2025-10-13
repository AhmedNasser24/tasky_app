part of 'fetch_one_task_cubit_cubit.dart';

abstract class FetchOneTaskCubitState {}

class FetchOneTaskCubitInitial extends FetchOneTaskCubitState {}

class FetchOneTaskCubitLoading extends FetchOneTaskCubitState {}

class FetchOneTaskCubitSuccess extends FetchOneTaskCubitState {
  final TaskEntity taskEntity;
  FetchOneTaskCubitSuccess(this.taskEntity);
}

class FetchOneTaskCubitFailure extends FetchOneTaskCubitState {
  final String errMessage;
  FetchOneTaskCubitFailure(this.errMessage);
}
