import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/core/utils/validation_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/auth/forgot_password_screen.dart';
import 'package:sheero/presentation/screens/auth/signup_screen.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_text.dart';
import 'package:sheero/presentation/widget/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'package:sheero/providers/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
       create: (_) =>LoginProvider(),
      child: Consumer<LoginProvider>(
        builder: (context, myProvider,child) {
          return Scaffold(
            body: Form(
              key: myProvider.formKey,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 30,left: 25,right: 25),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                    children: [
                      Image.asset(ImageHelper.loginImage,height: 220,),
                   Padding(padding:const EdgeInsets.only(top: 30),
                   child:  CustomTextfield(
                      hintText: getTranslated('enterYourEmail', context)!,
                      controller: myProvider.emailController,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(ValidationHelper.regexToRemoveEmoji)),
                          FilteringTextInputFormatter.deny(RegExp(ValidationHelper.whiteSpace)),
                      ],
                      validator: (val){
                          RegExp regExp = RegExp(ValidationHelper.emailPattern);
                        if(val.isEmpty){
                         return getTranslated('enterYourEmail', context);
                         }
                         else if(!regExp.hasMatch(val)) {
                       return getTranslated('enterValidEmailId', context);
                }
                      },
                    ),
                   ),
                    Padding(padding:const EdgeInsets.only(top: 40),
                    child: CustomTextfield(
                      hintText: getTranslated('enterYourPassword', context)!,
                      controller: myProvider.passwordController,
                      isObscureText: myProvider.isPasswordVisible,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(ValidationHelper.regexToRemoveEmoji)),
                          FilteringTextInputFormatter.deny(RegExp(ValidationHelper.whiteSpace)),
                      ],
                       suffixWidget:InkWell(
                        onTap: (){
                          if(myProvider.isPasswordVisible){
                            myProvider.updatePasswordVisible(false);
                          }else{
                            myProvider.updatePasswordVisible(true);
                          }
                        },
                        child:  Icon(
                          myProvider.isPasswordVisible?
                          Icons.visibility_outlined:Icons.visibility_off_outlined,color: ColorHelper.whiteColor,)),
                          validator: (val){
                            if(val.isEmpty){
                              return getTranslated('enterYourPassword', context);
                            }
                             else if(val.length<6){
                            return getTranslated('passwordMustAtLeast', context);
                          }
                          },
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
            ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(left: 37,right: 37,bottom: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(title: getTranslated('log_In', context)!,
                    onTap: (){
                      myProvider.checkValidation();
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
      ),
    );
  }
}