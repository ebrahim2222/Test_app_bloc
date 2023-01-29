import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/DI/d_injection.dart';

class SharedPrefrencesHelper {
  static SharedPreferences? sharedPreferences =
      DependencyInjection.getIt<SharedPreferences>();

  /// save string
  static Future<bool> saveString({key, value}) async {
    return await sharedPreferences!.setString(key, value);
  }

  /// get string
  static String? getString({key}) {
    return sharedPreferences!.getString(key);
  }
}
