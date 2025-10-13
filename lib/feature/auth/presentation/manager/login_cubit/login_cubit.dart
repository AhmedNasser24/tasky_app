import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/auth/domain/user_cases/login_user_case.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/user_info_entity.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUserCase}) : super(LoginInitial());
  final LoginUserCase loginUserCase ;
  Future<void> login({required UserInfoEntity loginModelInput}) async {
    emit(LoginLoading());
    Either<void, Failure> result =
        await loginUserCase(loginEntityInput: loginModelInput);
    result.fold(
      (ok) => emit(LoginSuccess()),
      (fail) => emit(LoginFailure(fail.errMessage)),
    );
  }
}
