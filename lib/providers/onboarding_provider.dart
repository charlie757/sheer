import 'package:flutter/material.dart';
import 'package:sheero/core/constants/app_constants.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/welcome_screen.dart';

class   OnboardingProvider extends ChangeNotifier{
  List onboardingList= [
    {
      'img':ImageHelper.onboarding1,
      'title':getTranslated('onboardingTitle1', navigatorKey.currentContext!)!,
      'des':getTranslated('onboardingDes1', navigatorKey.currentContext!)!,
    },
    {
      'img':ImageHelper.onboarding2,
      'title':getTranslated('onboardingTitle2', navigatorKey.currentContext!)!,
      'des':getTranslated('onboardingDes2', navigatorKey.currentContext!)!,
    },
    {
      'img':ImageHelper.onboarding3,
      'title':getTranslated('onboardingTitle3', navigatorKey.currentContext!)!,
      'des':getTranslated('onboardingDes3', navigatorKey.currentContext!)!,
    },
  ];

  int currentIndex = 0;

  updateValues(index) {
    currentIndex = index;
    notifyListeners();
  }

  checkValidation() {
    if (currentIndex < 2) {
      updateValues(currentIndex + 1);
    } else {
      RoutesHelper.pushCupertinoNavigation(const WelcomeScreen());
    }
  }
}