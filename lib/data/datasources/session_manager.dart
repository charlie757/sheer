// import 'package:patient/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheero/core/constants/app_constants.dart';

class SessionManager {
  static late final SharedPreferences sharedPrefs;
  static final SessionManager _instance = SessionManager._internal();
  factory SessionManager() => _instance;
  SessionManager._internal();

  Future<void> init() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }
  // static String get token => sharedPrefs.getString(AppConstants.TOKEN) ?? "";
  // static set setToken(String value) {
  //   sharedPrefs.setString(AppConstants.TOKEN, value);
  // }


  static String get languageCode =>
      sharedPrefs.getString(AppConstants.LANGUAGE_CODE) ?? "";
  static set setLanguageCode(String value) {
    sharedPrefs.setString(AppConstants.LANGUAGE_CODE, value);
  }
  
  static String get countryCode =>
      sharedPrefs.getString(AppConstants.COUNTRY_CODE) ?? "";
  static set setCountryCode(String value) {
    sharedPrefs.setString(AppConstants.COUNTRY_CODE, value);
  }



  // static String get authKey => sharedPrefs.getString(AppConstants.AUTH_KEY) ?? "";
  // static set setAuthKey(String value) {
  //   sharedPrefs.setString(AppConstants.AUTH_KEY, value);
  // }

  // static String get username => sharedPrefs.getString(AppConstants.USERNAME) ?? "";
  // static set setUsername(String value) {
  //   sharedPrefs.setString(AppConstants.USERNAME, value);
  // }

  // static String get password => sharedPrefs.getString(AppConstants.PASSWORD) ?? "";
  // static set setPassword(String value) {
  //   sharedPrefs.setString(AppConstants.PASSWORD, value);
  // }

  // static bool get rememberMe => sharedPrefs.getBool(AppConstants.IS_REMEMBER_ME) ?? false;
  // static set setRememberMe(bool value) {
  //   sharedPrefs.setBool(AppConstants.IS_REMEMBER_ME, value);
  // }
}
