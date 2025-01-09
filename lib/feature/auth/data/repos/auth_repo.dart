import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/user_info_model.dart';

abstract class AuthRepo {
  Future<Either < void , Failure >> login ({required UserInfoModel loginModelInput});
  Future<Either < void , Failure >> register({required UserInfoModel userInfoModelInput});
  Future < String > refreshToken ();
  Future < Either < void , Failure >> logout ();
  Future < UserInfoModel > profile (String accessToken);
}