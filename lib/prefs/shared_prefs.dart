import 'package:shared_preferences/shared_preferences.dart';

class Cache {

  static late SharedPreferences prefs ;

 static Future initPrefs ()async{
    prefs = await SharedPreferences.getInstance();
  }

  static Future <bool> saveTokenInCache({required String key , required String value})async{
    return await prefs.setString(key, value);
  }

  static String? getTokenInCache ({required String key}){
    return prefs.getString(key);
  }

  static Future <bool> removeTokenFromCache ({required String key})async{
    return await prefs.remove(key);
  }
}