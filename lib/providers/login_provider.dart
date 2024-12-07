import 'package:flutter/material.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/presentation/screens/dashboard/dashboard_screen.dart';

class LoginProvider extends ChangeNotifier{
  final formKey = GlobalKey<FormState>();
 bool isPasswordVisible = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;


updatePasswordVisible(bool value){
  isPasswordVisible =value;
  notifyListeners();
}

  checkValidation(){
    if(formKey.currentState!.validate()){
    RoutesHelper.pushCupertinoNavigation(const DashboardScreen());
    }
  }
}