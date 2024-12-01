import 'package:flutter/material.dart';
import '../constants/app_constants.dart';



class ScreenSize {
  static final appBarHeight = AppBar().preferredSize.height;
  static final screenHeight =
      MediaQuery.sizeOf(navigatorKey.currentContext!).height;
      static final screenWidth =
      MediaQuery.sizeOf(navigatorKey.currentContext!).width;
      
  static final keyboardHeight =
      MediaQuery.of(navigatorKey.currentContext!).viewInsets.bottom;
 static MediaQueryData mediaQuery = MediaQuery.of(navigatorKey.currentContext!).copyWith(textScaleFactor: 1.0);
  
  static Widget height(double size) {
    return SizedBox(
      height: size,
    );
  }

  static Widget width(double size) {
    return SizedBox(
      width: size,
    );
  }
}
