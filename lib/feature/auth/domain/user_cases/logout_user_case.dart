import 'package:dartz/dartz.dart';
import '../repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class LogoutUserCase {
  final AuthRepo authRepo;
  LogoutUserCase({required this.authRepo});

  Future<Either<void, Failure>> call() async => await authRepo.logout();
}
