import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/user_info_model.dart';

abstract class AuthRepo {
  Future<Either < void , Failure >> register({required UserInfoModel userInfoModelInput});
}