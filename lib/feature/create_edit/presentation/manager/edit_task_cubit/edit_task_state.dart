part of 'edit_task_cubit.dart';

abstract class EditTaskState {}

class EditTaskInitial extends EditTaskState {}

class EditTaskLoading extends EditTaskState {}

class EditTaskSuccess extends EditTaskState {}

class EditTaskFailure extends EditTaskState {
  final String errmessage;
  EditTaskFailure( this.errmessage);
}
