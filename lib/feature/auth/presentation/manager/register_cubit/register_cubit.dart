import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/model/user_info_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.authRepoImpl}) : super(RegisterInitial());
  final AuthRepo authRepoImpl;
  Future<void> register({required UserInfoModel userInfoModelInput}) async {
    emit(RegisterLoading());
    Either<void, Failure> result =
        await authRepoImpl.register(userInfoModelInput: userInfoModelInput);
    result.fold(
      (ok) => emit(RegisterSuccess()),
      (fail) => emit(RegisterFailure(fail.errMessage)),
    );
  }
}
