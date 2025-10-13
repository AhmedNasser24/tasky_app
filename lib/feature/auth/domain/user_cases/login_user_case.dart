import 'package:dartz/dartz.dart';
import '../entities/user_info_entity.dart';
import '../repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class LoginUserCase {
  final AuthRepo authRepo;

  LoginUserCase({required this.authRepo});

  Future<Either<void, Failure>> call(
          {required UserInfoEntity loginEntityInput}) =>
      authRepo.login(loginEntityInput: loginEntityInput);
}
