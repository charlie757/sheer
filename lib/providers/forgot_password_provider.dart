import 'package:flutter/material.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/presentation/screens/auth/otp_screen.dart';

class ForgotPasswordProvider extends ChangeNotifier{
  final formKey = GlobalKey<FormState>();
   final TextEditingController _emailController = TextEditingController();
   TextEditingController get emailController => _emailController;

   checkValidation(){
    if(formKey.currentState!.validate()){
    RoutesHelper.pushCupertinoNavigation(const OtpScreen());
    }
  }
}