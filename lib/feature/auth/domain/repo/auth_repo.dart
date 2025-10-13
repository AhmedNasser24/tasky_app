import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_info_entity.dart';

abstract class AuthRepo {
  Future<Either < void , Failure >> login ({required UserInfoEntity loginEntityInput});
  Future<Either < void , Failure >> register({required UserInfoEntity userInfoEntityInput});
  Future < Either < void , Failure >> logout ();
  Future < UserInfoEntity > profile (String accessToken);
}