import 'package:sheero/data/model/language_model.dart';
import 'package:flutter/material.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class AppConstants{
  static const String LANGUAGE_CODE = 'LANGUAGECODE';
  static const String COUNTRY_CODE = 'COUNTRYCODE';
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: '',
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: '',
        languageName: 'Spanish',
        countryCode: 'ES',
        languageCode: 'es'),
  ];

}