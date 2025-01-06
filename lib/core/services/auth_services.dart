import 'package:tasky_app/core/helper/api_keys.dart';
import 'package:tasky_app/core/services/api_services.dart';
import 'package:tasky_app/feature/auth/data/model/login_model.dart';

import '../../feature/auth/data/model/user_info_model.dart';
import '../secrets/end_point.dart';

class AuthServices {
  final ApiServices apiServices;

  AuthServices({required this.apiServices});

  Future<LoginModel> login({required LoginModel loginModelInput}) async {
    Map<String, dynamic> data = await apiServices.post(
        endPoint: EndPoint.login, data: loginModelInput.toJson());
    LoginModel loginModelOutput = LoginModel.fromJson(data);
    return loginModelOutput;
  }

  Future<UserInfoModel> register(
      {required UserInfoModel userInfoModelInput}) async {
    Map<String, dynamic> data = await apiServices.post(
        endPoint: EndPoint.register, data: userInfoModelInput.toJson());
    UserInfoModel userInfoModelOutput = UserInfoModel.fromJson(data);
    return userInfoModelOutput;
  }

  Future<void> logout({required accessToken}) async {
    await apiServices.get(endPoint: "auth/logout" , authorization: accessToken);
  }

  Future<String> refreshToken({required String refreshToken}) async {
    Map<String, dynamic> data = await apiServices.get(
        endPoint: "${EndPoint.refreshToken}$refreshToken");
    String newAccessToken = data[ApiKeys.accessToken];
    return newAccessToken;
  }
}
