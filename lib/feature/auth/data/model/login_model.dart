import '../../../../core/helper/api_keys.dart';

class LoginModel {
  String? phone, password;
  String? userId, accessToken, refreshToken;
  LoginModel(
      {this.phone,
      this.password,
      this.userId,
      this.accessToken,
      this.refreshToken});

  Map<String, dynamic> toJson() {
    return {ApiKeys.phone: phone, ApiKeys.password: password};
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        userId: json[ApiKeys.userId],
        accessToken: json[ApiKeys.accessToken],
        refreshToken: json[ApiKeys.refreshToken],
      );
}
