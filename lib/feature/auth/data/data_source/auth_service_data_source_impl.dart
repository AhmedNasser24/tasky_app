import '../model/user_info_model.dart';

import '../../../../core/api/api_consumer.dart';
import 'auth_services_data_source.dart';

import '../../../../core/api/end_point.dart';

class AuthServicesDataSourceImpl extends AuthServicesDataSource {
  final ApiConsumer apiConsumer;

  AuthServicesDataSourceImpl({required this.apiConsumer});

  @override
  Future<UserInfoModel> login({required UserInfoModel loginModelInput}) async {
    Map<String, dynamic> data = await apiConsumer.post(
      endPoint: EndPoint.login,
      data: loginModelInput.loginToJson(),
    );

    UserInfoModel loginModelOutput = UserInfoModel.authFromJson(data);

    return loginModelOutput;
  }

  @override
  Future<UserInfoModel> register(
      {required UserInfoModel userInfoModelInput}) async {
    Map<String, dynamic> data = await apiConsumer.post(
      endPoint: EndPoint.register,
      data: userInfoModelInput.toJson(),
    );

    UserInfoModel registerOutput = UserInfoModel.authFromJson(data);
    return registerOutput;
  }

  @override
  Future<void> logout() async {
    await apiConsumer.post(endPoint: EndPoint.logout);
  }

  @override
  Future<UserInfoModel> getProfile() async {
    Map<String, dynamic> data =
        await apiConsumer.get(endPoint: EndPoint.profile);
    UserInfoModel profileInfo = UserInfoModel.profileFromJson(data);
    return profileInfo;
  }
}
