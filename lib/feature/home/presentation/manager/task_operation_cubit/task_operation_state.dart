part of 'task_operation_cubit.dart';

abstract class TaskOperationState {}

class FetchTaskInitial extends TaskOperationState {}

class FetchTaskLoading extends TaskOperationState {}

class FetchTaskSuccess extends TaskOperationState {
  final List<TaskModel> tasksList;

  FetchTaskSuccess(this.tasksList);
}

class FetchTaskFailure extends TaskOperationState {
  final String errMessage;

  FetchTaskFailure(this.errMessage);
}

class NoInternetConnection extends TaskOperationState {
  final String message = "No Internet Connection";
}
class InternetConnectionReturned extends TaskOperationState {
  final String message = "Internet Connection Returned";
}

class EditTaskLoading extends TaskOperationState {}

class EditTaskSuccess extends TaskOperationState {}

class EditTaskFailure extends TaskOperationState {
  final String errmessage;
  EditTaskFailure( this.errmessage);
}

class CreateTaskLoading extends TaskOperationState {}

class CreateTaskSuccess extends TaskOperationState {}

class CreateTaskFailure extends TaskOperationState {
  final String errMessage;

  CreateTaskFailure(this.errMessage);
}

class DeleteTaskLoading extends TaskOperationState {}

class DeleteTaskSuccess extends TaskOperationState {}

class DeleteTaskFailure extends TaskOperationState {
  final String errMessage;
  DeleteTaskFailure(this.errMessage);
}