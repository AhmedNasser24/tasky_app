import 'package:tasky_app/core/services/api_services.dart';
import 'package:tasky_app/feature/auth/data/model/login_model.dart';

import '../../feature/auth/data/model/user_info_model.dart';

class AuthServices {
  final ApiServices apiServices;

  AuthServices({required this.apiServices});

  Future<LoginModel> login({required LoginModel loginModelInput}) async {
    String loginEndPoint = "auth/login";
    Map<String, dynamic> data = await apiServices.post(
        endPoint: loginEndPoint, data: loginModelInput.toJson());
    LoginModel loginModelOutput = LoginModel.fromJson(data);
    return loginModelOutput;
  }

  Future<UserInfoModel> register(
      {required UserInfoModel userInfoModelInput}) async {
    String registerEndPoint = "auth/register";
    Map<String, dynamic> data = await apiServices.post(
        endPoint: registerEndPoint, data: userInfoModelInput.toJson());
    UserInfoModel userInfoModelOutput = UserInfoModel.fromJson(data);
    return userInfoModelOutput;
  }
}
