import 'package:tasky_app/core/services/api_services.dart';

import '../../feature/auth/data/model/user_info_model.dart';

class AuthServices {
  final ApiServices apiServices;

  AuthServices({required this.apiServices});

  Future < UserInfoModel > register({required UserInfoModel userInfoModelInput}) async {
    String registerEndPoint = "auth/register";
    Map<String , dynamic> data = await apiServices.post(endPoint: registerEndPoint, data: userInfoModelInput.toJson());
    UserInfoModel userInfoModelOutput = UserInfoModel.fromJson(data);
    return userInfoModelOutput;
  }
}
