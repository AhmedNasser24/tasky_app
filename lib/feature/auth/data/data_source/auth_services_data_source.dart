
import '../model/user_info_model.dart';


abstract class AuthServicesDataSource {
  Future<UserInfoModel> login({required UserInfoModel loginModelInput});

  Future<UserInfoModel> register({required UserInfoModel userInfoModelInput});

  Future<void> logout();

  Future<UserInfoModel> getProfile();
}
