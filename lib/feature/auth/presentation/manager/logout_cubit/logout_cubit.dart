

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/auth/data/repos/auth_repo.dart';

import '../../../../../core/errors/failure.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.authRepoImpl) : super(LogoutInitial());
  final AuthRepo authRepoImpl ;
  Future <void > logout () async {
    emit(LogoutLoading());
    Either<void, Failure> result = await authRepoImpl.logout();
    result.fold(
      (ok) => emit(LogoutSuccess()),
      (fail) => emit(LogoutFailure(fail.errMessage)),
    );
  }
}
