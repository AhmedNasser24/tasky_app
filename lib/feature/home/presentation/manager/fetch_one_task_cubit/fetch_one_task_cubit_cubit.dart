import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/task_model.dart';
import '../../../data/repo/home_repo.dart';

part 'fetch_one_task_cubit_state.dart';

class FetchOneTaskCubitCubit extends Cubit<FetchOneTaskCubitState> {
  FetchOneTaskCubitCubit(this.homeRepoImpl) : super(FetchOneTaskCubitInitial());
  final HomeRepo homeRepoImpl;
  Future<void> fetchOneTask({required String qrData}) async {
    emit(FetchOneTaskCubitLoading());
    Either<TaskModel, Failure> result =
        await homeRepoImpl.fetchOneTask(qrData: qrData);
    result.fold(
      (taskModel) {
        if (__isDataCorrect(taskModel)) {
          emit(FetchOneTaskCubitSuccess(taskModel));
        } else {
          emit(FetchOneTaskCubitFailure("QR code is not correct"));
        }
      },
      (fail) => emit(FetchOneTaskCubitFailure(fail.errMessage)),
    );
  }

  bool __isDataCorrect(TaskModel taskModel) {
    return taskModel.desc != null &&
        taskModel.title != null &&
        taskModel.taskId != null &&
        taskModel.image != null &&
        taskModel.status != null &&
        taskModel.priority != null;
  }
}
