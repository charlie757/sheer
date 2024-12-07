import 'package:flutter/material.dart';

class ChangePasswordProvider extends ChangeNotifier{
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController => _confirmPasswordController;
  
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  updatePasswordVisible(bool value){
  isPasswordVisible =value;
  notifyListeners();
  }

  updateConfirmPasswordVisible(bool value){
  isConfirmPasswordVisible =value;
  notifyListeners();
  }

  checkValidation(){
    if(formKey.currentState!.validate()){
      
    }
  }
}