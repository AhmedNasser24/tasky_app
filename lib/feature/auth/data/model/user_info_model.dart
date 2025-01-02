import '../../../../core/helper/api_keys.dart';

class UserInfoModel {
  String? phone, userName, address, password;
  String? yearsOfExperience, experienceLevel;
  String? userId, accessToken, refreshToken;
  UserInfoModel(
      {this.phone,
      this.userName,
      this.address,
      this.password,
      this.yearsOfExperience,
      this.experienceLevel,
      this.userId,
      this.accessToken,
      this.refreshToken});

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.phone: phone,
      ApiKeys.displayName: userName,
      ApiKeys.address: address,
      ApiKeys.password: password,
      ApiKeys.experienceYears: yearsOfExperience,
      ApiKeys.level: experienceLevel
    };
  }

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        userId: json[ApiKeys.userId],
        accessToken: json[ApiKeys.accessToken],
        refreshToken: json[ApiKeys.refreshToken],
        userName: json[ApiKeys.displayName],
      );
}
