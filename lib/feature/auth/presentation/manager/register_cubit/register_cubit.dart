import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/auth/domain/user_cases/register_user_case.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/user_info_entity.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUserCase}) : super(RegisterInitial());
  final RegisterUserCase registerUserCase ;
  Future<void> register({required UserInfoEntity userInfoModelInput}) async {
    emit(RegisterLoading());
    Either<void, Failure> result =
        await registerUserCase(userInfoEntityInput: userInfoModelInput);
    result.fold(
      (ok) => emit(RegisterSuccess()),
      (fail) => emit(RegisterFailure(fail.errMessage)),
    );
  }
}
