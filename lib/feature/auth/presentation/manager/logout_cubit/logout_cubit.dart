

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/auth/domain/user_cases/logout_user_case.dart';

import '../../../../../core/errors/failure.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit({required this.logoutUserCase}) : super(LogoutInitial());
  final LogoutUserCase logoutUserCase ;
  Future <void > logout () async {
    emit(LogoutLoading());
    Either<void, Failure> result = await logoutUserCase();
    result.fold(
      (ok) => emit(LogoutSuccess()),
      (fail) => emit(LogoutFailure(fail.errMessage)),
    );
  }
}
