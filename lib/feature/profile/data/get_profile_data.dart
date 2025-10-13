import '../../../core/helper/api_keys.dart';
import '../../../core/utils/shared_preference_singleton.dart';
import '../../auth/domain/entities/user_info_entity.dart';

UserInfoEntity getProfileData() {
  return UserInfoEntity(
    phone: SharedPreferenceSingleton.getString(ApiKeys.phone),
    userName: SharedPreferenceSingleton.getString(ApiKeys.displayName),
    address: SharedPreferenceSingleton.getString(ApiKeys.address),
    experienceLevel: SharedPreferenceSingleton.getString(ApiKeys.level),
    yearsOfExperience:
        SharedPreferenceSingleton.getInt(ApiKeys.experienceYears),
  );
}
