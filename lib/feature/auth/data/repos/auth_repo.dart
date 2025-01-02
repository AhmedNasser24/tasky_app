import '../model/user_info_model.dart';

abstract class AuthRepo {
  Future<void> register({required UserInfoModel userInfoModelInput});
}