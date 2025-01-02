import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/model/login_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepoImpl}) : super(LoginInitial());
  final AuthRepo authRepoImpl;
  Future<void> login({required LoginModel loginModelInput}) async {
    emit(LoginLoading());
    Either<void, Failure> result =
        await authRepoImpl.login(loginModelInput: loginModelInput);
    result.fold(
      (ok) => emit(LoginSuccess()),
      (fail) => emit(LoginFailure(fail.errMessage)),
    );
  }
}
