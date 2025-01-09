import '../../../../core/helper/api_keys.dart';

class UserInfoModel {
  String? phone, userName, address, password;
  String?  experienceLevel;
  int? yearsOfExperience ;
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

  Map<String, dynamic> loginToJson() {
    return {ApiKeys.phone: phone, ApiKeys.password: password};
  }

  factory UserInfoModel.authFromJson(Map<String, dynamic> json) => UserInfoModel(
        userId: json[ApiKeys.userId],
        accessToken: json[ApiKeys.accessToken],
        refreshToken: json[ApiKeys.refreshToken],
      );
    
  factory UserInfoModel.profileFromJson(Map<String, dynamic> json) => UserInfoModel(
    userName: json[ApiKeys.displayName],
    phone: json["username"] ,          // in api username is phone for profile
    address: json[ApiKeys.address],
    yearsOfExperience: json[ApiKeys.experienceYears],
    experienceLevel: json[ApiKeys.level],        
  ) ;   
}
