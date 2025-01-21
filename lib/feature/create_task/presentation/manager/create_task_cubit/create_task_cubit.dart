
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/create_task/data/repo/create_task_repo.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/task_model.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  CreateTaskCubit(this.__createTaskRepoImpl) : super(CreateTaskInitial());
  final CreateTaskRepo __createTaskRepoImpl ;
  Future <void> createTask ({required TaskModel taskModel}) async {
    emit(CreateTaskLoading());
    Either < void , Failure > result = await __createTaskRepoImpl.createTask(taskModel: taskModel);
    result.fold(
      (ok) => emit(CreateTaskSuccess()),
      (fail) => emit(CreateTaskFailure(fail.errMessage)),
    );
  }
}
