import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// save string
  static Future<bool> saveString({key, value}) async {
    return await sharedPreferences!.setString(key, value);
  }

  /// get string
  static String? getString({key}) {
    return sharedPreferences!.getString(key);
  }
}
