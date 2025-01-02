import '../../../../core/helper/api_keys.dart';

class LoginModel {
  String? phone , password ;

  LoginModel({this.phone , this.password});

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.phone: phone,
      ApiKeys.password: password
    };
  }
}