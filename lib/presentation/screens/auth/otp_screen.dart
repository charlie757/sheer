import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/auth/change_password_screen.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/providers/otp_provider.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OtpProvider>(builder: (context, myProvider, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30,left: 25,right: 25),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset(
                    ImageHelper.verificationImage,
                    height: 220,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: otpField(context, myProvider),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                            text:
                                "${getTranslated('resendCodeIn', context)!} ",
                            style: const TextStyle(
                                fontSize: 13,
                                fontFamily: FontfamilyHelper.interRegular,
                                color: ColorHelper.whiteColor),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigator.pop(context);
                                  },
                                text: '00:58',
                                style: const TextStyle(
                                    decorationColor: ColorHelper.pinkColor,
                                    fontSize: 13,
                                    fontFamily: FontfamilyHelper.interRegular,
                                    color: ColorHelper.pinkColor),
                              )
                            ])),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(padding:const EdgeInsets.only(left: 30,right: 37,bottom: 40),
        child: CustomButton(title: getTranslated('verify', context)!,
        onTap: (){
          RoutesHelper.pushCupertinoNavigation(const ChangePasswordScreen());
        },
        
        ),
        ),
      );
    });
  }

  otpField(BuildContext context, OtpProvider provider) {
    return SizedBox(
      width: 220,
      child: PinCodeTextField(
        readOnly: provider.isLoading,
        controller: provider.otpController,
        cursorColor: ColorHelper.whiteColor,
        autovalidateMode: AutovalidateMode.disabled,
        cursorHeight: 20,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          activeColor: ColorHelper.pinkColor,
          disabledColor: ColorHelper.whiteColor,
          selectedColor: ColorHelper.whiteColor,
          inactiveColor: ColorHelper.whiteColor,
          fieldHeight: 48,
          fieldWidth: 48,
          inactiveFillColor: ColorHelper.whiteColor,
          selectedFillColor: Colors.white,
          activeFillColor: ColorHelper.whiteColor,
        ),
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        length: 4,
        animationDuration: const Duration(milliseconds: 300),
        appContext: context,
        keyboardType: TextInputType.number,
        textStyle: const TextStyle(
            color: ColorHelper.whiteColor,
            fontFamily: FontfamilyHelper.interRegular),
        onChanged: (val) {},
        onCompleted: (result) {},
        validator: (val) {
          if (val!.isEmpty) {
            return 'Enter otp';
          } else if (val.length < 4) {
            return 'Enter otp should be valid';
          }
          return null;
        },
      ),
    );
  }
}
