import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/message_helper.dart';
import 'package:sheero/localization/language_constraints.dart';

class SignupProvider extends ChangeNotifier{
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController => _confirmPasswordController;
  
  final formKey = GlobalKey<FormState>();
  bool isCheckBox = false;
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


updateCheckBox(value){
  isCheckBox =value;
  notifyListeners();
}

checkValidation(BuildContext context){
    if(formKey.currentState!.validate()){
      if(isCheckBox==false){
        MessageHelper.showErrorSnackBar(context, getTranslated('acceptTermsCondition', context)!,backgroundColor: ColorHelper.whiteColor);
      }
    }
  }
} 