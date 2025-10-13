import 'package:dartz/dartz.dart';
import 'package:tasky_app/feature/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_info_entity.dart';

class RegisterUserCase {
  final AuthRepo authRepo;
  RegisterUserCase({required this.authRepo});

  Future<Either<void, Failure>> call(
          {required UserInfoEntity userInfoEntityInput}) =>
      authRepo.register(userInfoEntityInput: userInfoEntityInput);
}
