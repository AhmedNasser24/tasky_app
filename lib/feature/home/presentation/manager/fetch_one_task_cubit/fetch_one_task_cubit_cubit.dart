import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/home/domain/user_cases/fetch_one_task_user_case.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/task_entity.dart';

part 'fetch_one_task_cubit_state.dart';

class FetchOneTaskCubit extends Cubit<FetchOneTaskCubitState> {
  FetchOneTaskCubit({required this.fetchOneTaskUserCase}) : super(FetchOneTaskCubitInitial());
  final FetchOneTaskUserCase fetchOneTaskUserCase;
  bool __isSuccess = false;
  Future<void> fetchOneTask({required String qrData}) async {
    if (__isSuccess) {
      return;
    }
    emit(FetchOneTaskCubitLoading());
    Either<TaskEntity, Failure> result =
        await fetchOneTaskUserCase(qrData: qrData);
    result.fold(
      (taskModel) {
        if (__isDataCorrect(taskModel)) {
          __isSuccess = true;
          emit(FetchOneTaskCubitSuccess(taskModel));
        } else {
          emit(FetchOneTaskCubitFailure("QR code is not correct"));
        }
      },
      (fail) => emit(FetchOneTaskCubitFailure(fail.errMessage)),
    );
  }

  bool __isDataCorrect(TaskEntity taskModel) {
    return taskModel.desc != null &&
        taskModel.title != null &&
        taskModel.taskId != null &&
        taskModel.image != null &&
        taskModel.status != null &&
        taskModel.priority != null;
  }
}
