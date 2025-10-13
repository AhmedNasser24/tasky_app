import 'package:tasky_app/feature/auth/data/model/user_info_model.dart';

import '../../../../core/services/api_services.dart';
import 'auth_services_data_source.dart';

import '../../../../core/secrets/end_point.dart';

class AuthServicesDataSourceImpl extends AuthServicesDataSource {
  final ApiServices apiServices;

  AuthServicesDataSourceImpl({required this.apiServices});

  @override
  Future<UserInfoModel> login({required UserInfoModel loginModelInput}) async {
    Map<String, dynamic> data = await apiServices.post(
      endPoint: EndPoint.login,
      data: loginModelInput.loginToJson(),
      isAuth: true
    );

    UserInfoModel loginModelOutput = UserInfoModel.authFromJson(data);

    return loginModelOutput;
  }

  @override
  Future<UserInfoModel> register(
      {required UserInfoModel userInfoModelInput}) async {
    Map<String, dynamic> data = await apiServices.post(
      endPoint: EndPoint.register,
      data: userInfoModelInput.toJson(),
      isAuth: true,
    );

    UserInfoModel registerOutput = UserInfoModel.authFromJson(data);
    return registerOutput;
  }

  @override
  Future<void> logout() async {
    await apiServices.post(endPoint: EndPoint.logout);
  }

  @override
  Future<UserInfoModel> getProfile() async {
    Map<String, dynamic> data =
        await apiServices.get(endPoint: EndPoint.profile);
    UserInfoModel profileInfo = UserInfoModel.profileFromJson(data);
    return profileInfo;
  }
}
