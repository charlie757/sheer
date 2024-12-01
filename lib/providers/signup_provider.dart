import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier{
bool isCheckBox = false;

updateCheckBox(value){
  isCheckBox =value;
  notifyListeners();
}
} 