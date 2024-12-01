import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sheero/core/constants/app_constants.dart';

class RoutesHelper {
  static Future pushCupertinoNavigation(
    route,
  ) {
    return Navigator.push(navigatorKey.currentContext!,
        CupertinoPageRoute(builder: (context) => route));
  }

  static pushMaterialNavigation(
    route,
  ) {
    Navigator.push(navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => route));
  }

  static pushReplacementNavigation(
    route,
  ) {
    Navigator.pushAndRemoveUntil(navigatorKey.currentContext!,
        CupertinoPageRoute(builder: (context) => route), (route) => false);
  }
}
