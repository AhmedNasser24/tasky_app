
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/home_repo.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit(this.homeRepoimpl) : super(DeleteTaskInitial());

  final HomeRepo homeRepoimpl;
  void deleteTask ({required String taskId}) async {
    emit(DeleteTaskLoading());
    var result = await homeRepoimpl.deleteTask(taskId: taskId);
    result.fold(
      (ok) => emit(DeleteTaskSuccess()),
      (fail) => emit(DeleteTaskFailure(errMessage: fail.errMessage))
    );
  }
}
