import 'dart:async';

import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier{
 final otpController = TextEditingController();
 bool isLoading =false; 
  int counter = 30;
  Timer? timer;
  bool resend = false;
}