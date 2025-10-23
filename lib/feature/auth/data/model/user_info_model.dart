import '../../domain/entities/user_info_entity.dart';

import '../../../../core/utils/constants/api_keys.dart';

class UserInfoModel extends UserInfoEntity {
  UserInfoModel({
    super.userId,
    super.accessToken,
    super.refreshToken,
    super.userName,
    super.phone,
    super.address,
    super.yearsOfExperience,
    super.experienceLevel,
    super.password,
  });

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

  factory UserInfoModel.fromEntity(UserInfoEntity entity) => UserInfoModel(
        userId: entity.userId,
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
        userName: entity.userName,
        phone: entity.phone,
        address: entity.address,
        yearsOfExperience: entity.yearsOfExperience,
        experienceLevel: entity.experienceLevel,
        password: entity.password,
      );
  Map<String, dynamic> loginToJson() {
    return {ApiKeys.phone: phone, ApiKeys.password: password};
  }

  factory UserInfoModel.authFromJson(Map<String, dynamic> json) =>
      UserInfoModel(
        userId: json["_id"],
        accessToken: json[ApiKeys.accessToken],
        refreshToken: json[ApiKeys.refreshToken],
      );

  factory UserInfoModel.profileFromJson(Map<String, dynamic> json) =>
      UserInfoModel(
        userName: json[ApiKeys.displayName],
        phone: json["username"], // in api username is phone for profile
        address: json[ApiKeys.address],
        yearsOfExperience: json[ApiKeys.experienceYears],
        experienceLevel: json[ApiKeys.level],
      );
}
