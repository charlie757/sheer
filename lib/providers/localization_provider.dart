import 'package:flutter/material.dart';
import 'package:sheero/core/constants/app_constants.dart';
import 'package:sheero/data/datasources/session_manager.dart';

class LocalizationProvider extends ChangeNotifier {
  LocalizationProvider() {
    loadCurrentLanguage();
  }

  Locale _locale = Locale(
      AppConstants.languages[0].languageCode!, AppConstants.languages[0].countryCode);
  bool _isLtr = true;
  int? _languageIndex;

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  int? get languageIndex => _languageIndex;

  void setLanguage(Locale locale) {
    _locale = locale;
    _isLtr = _locale.languageCode != 'ar';
    // dioClient!.updateHeader(null, locale.countryCode);
    for (int index = 0; index < AppConstants.languages.length; index++) {
      if (AppConstants.languages[index].languageCode == locale.languageCode) {
        print("index${AppConstants.languages[index].languageCode}");
        _languageIndex = index;
        break;
      }
    }
    _saveLanguage(_locale);
    notifyListeners();
  }

  loadCurrentLanguage() async {
    _locale = Locale(
        SessionManager.languageCode.isEmpty
            ? AppConstants.languages[0].languageCode!
            : SessionManager.languageCode,
        SessionManager.countryCode.isEmpty
            ? AppConstants.languages[0].countryCode
            : SessionManager.countryCode);
    _isLtr = _locale.languageCode != 'ar';
    for (int index = 0; index < AppConstants.languages.length; index++) {
      if (AppConstants.languages[index].languageCode == locale.languageCode) {
        _languageIndex = index;
        break;
      }
    }
    // notifyListeners();
  }

  _saveLanguage(Locale locale) async {
    SessionManager.setLanguageCode = locale.languageCode;
    SessionManager.setCountryCode = locale.countryCode!;
  }
}
