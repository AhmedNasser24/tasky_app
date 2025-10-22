import 'package:shared_preferences/shared_preferences.dart';

// WidgetsFlutterBinding.ensureInitialized();
//   await SharedPreferenceSingleton.init();
class SharedPreferenceSingleton {
  static late SharedPreferences _instance;
  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<void> setbool(String key, bool value) async {
    await _instance.setBool(key, value);
  }

  static bool getbool(String key) {
    return _instance.getBool(key) ?? false;
  }

  static Future<void> setString(String key, String value) async {
    await _instance.setString(key, value);
    
  }

  static String getString(String key) {
    return _instance.getString(key) ?? '';
  }

  static Future<void> setInt(String key, int value) async {
    await _instance.setInt(key, value);
    
  }

  static int getInt(String key) {
    return _instance.getInt(key) ?? 0;
  }


  static Future<void> remove(String key) async {
    await _instance.remove(key);
  }
}
