import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences ? sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future putString({required String key , required String value}) async {
    await sharedPreferences?.setString(key , value);
  }

  static String? getString({required String key}){
    return sharedPreferences?.getString(key);
  }

  static Future remove({required String key }) async {
    await sharedPreferences?.remove(key );
  }

}