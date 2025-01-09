import 'package:tasky_app/core/helper/api_keys.dart';
import 'package:tasky_app/core/services/api_services.dart';

import '../../feature/auth/data/model/user_info_model.dart';
import '../secrets/end_point.dart';

class AuthServices {
  final ApiServices apiServices;

  AuthServices({required this.apiServices});

  Future<UserInfoModel> login({required UserInfoModel loginModelInput}) async {
    Map<String, dynamic> data = await apiServices.post(
        endPoint: EndPoint.login, data: loginModelInput.loginToJson());
    UserInfoModel loginModelOutput = UserInfoModel.authFromJson(data);
    return loginModelOutput;
  }

  Future<UserInfoModel> register(
      {required UserInfoModel userInfoModelInput}) async {
    Map<String, dynamic> data = await apiServices.post(
        endPoint: EndPoint.register, data: userInfoModelInput.toJson());
    UserInfoModel registerOutput = UserInfoModel.authFromJson(data);
    return registerOutput;
  }

  Future<void> logout({required accessToken}) async {
    await apiServices.post(endPoint: EndPoint.logout , authorization: accessToken);
  }

  Future<String> refreshToken({required String refreshToken}) async {
    Map<String, dynamic> data = await apiServices.get(
        endPoint: "${EndPoint.refreshToken}$refreshToken");
    String newAccessToken = data[ApiKeys.accessToken];
    return newAccessToken;
  }

  Future < UserInfoModel > getProfile({required String accessToken}) async {
    Map < String , dynamic > data = await apiServices.get(endPoint: EndPoint.profile, authorization: accessToken);
    UserInfoModel profileInfo = UserInfoModel.profileFromJson(data);
    return profileInfo;
  }
}
