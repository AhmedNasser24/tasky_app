import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/create_edit/data/repo/task_operation_repo.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/task_model.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit(this.__taskOperationRepoImpl) : super(EditTaskInitial());
  final TaskOperationRepo __taskOperationRepoImpl;
  Future<void> editTask({required TaskModel taskModel}) async {
    log("new task : ${taskModel.desc}");
    emit(EditTaskLoading());
    Either<void, Failure> result =
        await __taskOperationRepoImpl.editTask(taskModel: taskModel);
    result.fold(
      (ok) => emit(EditTaskSuccess()),
      (fail) => emit(EditTaskFailure(fail.errMessage)),
    );
  }
}
