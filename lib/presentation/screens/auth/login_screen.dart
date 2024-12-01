import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/auth/forgot_password_screen.dart';
import 'package:sheero/presentation/screens/auth/signup_screen.dart';
import 'package:sheero/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_text.dart';
import 'package:sheero/presentation/widget/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30,left: 25,right: 25),
          child: Align(
            alignment: Alignment.center,
            child: Column(
            children: [
              Image.asset(ImageHelper.loginImage,height: 220,),
           Padding(padding:const EdgeInsets.only(top: 30),
           child:  CustomTextfield(
              hintText: getTranslated('enterYourEmail', context)!,
            ),
           ),
            Padding(padding:const EdgeInsets.only(top: 40),
            child: CustomTextfield(
              hintText: getTranslated('enterYourPassword', context)!,
              suffixWidget:const Icon(Icons.visibility_outlined,color: ColorHelper.whiteColor,),
            ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(padding:const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: (){
                  RoutesHelper.pushCupertinoNavigation(const ForgotPasswordScreen());
                },
                child: CustomText(title: getTranslated('forgotPassword', context)!)),),
            ),
            ],
           ),
          ),
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 37,right: 37,bottom: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(title: getTranslated('log_In', context)!,
              onTap: (){
                RoutesHelper.pushCupertinoNavigation(const DashboardScreen());
              },
              ),
              Padding(padding:const EdgeInsets.only(top: 25),
              child:   Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                    text: "${getTranslated('dontHaveAccount', context)!} ",
                    style:const TextStyle(
                      fontSize: 13,fontFamily: FontfamilyHelper.interRegular,
                      color: ColorHelper.whiteColor
                    ),children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap=(){
                          RoutesHelper.pushCupertinoNavigation(const SignupScreen());
                        },
                        text: getTranslated('sign_up', context),                  
                          style:const TextStyle(
                            decorationColor: ColorHelper.pinkColor,
                      fontSize: 13,fontFamily: FontfamilyHelper.interRegular,
                      color: ColorHelper.pinkColor
                    ),
                      )
                    ]
                   )),
              )
            ],
          ),
        ),
    );
  }
}