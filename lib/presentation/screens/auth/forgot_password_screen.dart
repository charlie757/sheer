import 'package:flutter/material.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/auth/otp_screen.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 25, right: 25,bottom: 40),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset(
                  ImageHelper.forgotPasswordImage,
                  height: 220,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CustomTextfield(
                    hintText: getTranslated('enterYourEmail', context)!,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 12, right: 12),
                  child: CustomButton(title: getTranslated('send', context)!,
                  onTap: (){
                    RoutesHelper.pushCupertinoNavigation(const OtpScreen());
                  },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
