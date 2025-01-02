import 'package:tasky_app/core/services/auth_services.dart';
import 'package:tasky_app/feature/auth/data/model/user_info_model.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthServices authServices;

  AuthRepoImpl({required this.authServices});
  @override
  Future<void> register({required UserInfoModel userInfoModelInput}) async {

    UserInfoModel userInfoModelOutput =
        await authServices.register(userInfoModelInput: userInfoModelInput);
    // save to shared preferences    
  }
}
