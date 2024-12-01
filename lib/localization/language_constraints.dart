import 'package:flutter/material.dart';
import 'package:sheero/localization/app_locatlization.dart';

String? getTranslated(String? key, BuildContext context) {
  return AppLocalization.of(context)!.translate(key);
}
