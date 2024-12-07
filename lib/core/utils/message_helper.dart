import 'package:flutter/material.dart';
import 'package:sheero/core/constants/app_constants.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MessageHelper{
   static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  static void showErrorSnackBar(BuildContext context, String message,{required,backgroundColor =ColorHelper.redColor,}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message,style: TextStyle(
        color:backgroundColor==ColorHelper.redColor? ColorHelper.whiteColor:ColorHelper.blackColor
      ),),
      backgroundColor: backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } 

  static void showInternetSnackBar() {
    const snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text("No internet connection",style: TextStyle(
        color: ColorHelper.blackColor
      ),),
      backgroundColor: ColorHelper.whiteColor,
    );
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  } 

 static showToast(String title,{ToastGravity gravity = ToastGravity.BOTTOM}){
   Fluttertoast.showToast(
       msg: title,
       toastLength: Toast.LENGTH_SHORT,
       gravity: gravity,
       textColor: Colors.white,
   );
 }


}