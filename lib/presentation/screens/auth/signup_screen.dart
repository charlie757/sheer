import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/core/utils/validation_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_text.dart';
import 'package:sheero/presentation/widget/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'package:sheero/providers/signup_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => SignupProvider(),
        child: Scaffold(
          body: Consumer<SignupProvider>(builder: (context, myProvider, child) {
            return SafeArea(
                child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                  top: 30, left: 25, right: 25, bottom: 40),
              child: Align(
                alignment: Alignment.center,
                child: Form(
                  key: myProvider.formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        ImageHelper.signupImage,
                        height: 220,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: CustomTextfield(
                          hintText: getTranslated('firstName', context)!,
                          controller: myProvider.firstNameController,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                                RegExp(ValidationHelper.regexToRemoveEmoji)),
                          ],
                          validator: (val) {
                            if (val.isEmpty) {
                              return getTranslated('enterFirstName', context);
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: CustomTextfield(
                          hintText: getTranslated('lastName', context)!,
                          controller: myProvider.lastNameController,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                                RegExp(ValidationHelper.regexToRemoveEmoji)),
                          ],
                          validator: (val) {
                            if (val.isEmpty) {
                              return getTranslated('enterLastName', context);
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: CustomTextfield(
                          hintText: getTranslated('phoneNo', context)!,
                          controller: myProvider.phoneController,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.deny(
                                RegExp(ValidationHelper.regexToRemoveEmoji)),
                            LengthLimitingTextInputFormatter(10)
                          ],
                          validator: (val) {
                            if (val.isEmpty) {
                              return getTranslated('enterPhoneNumber', context);
                            } else if (val.length < 10) {
                              return getTranslated('validPhoneNumber', context);
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: CustomTextfield(
                          hintText: getTranslated('emailAddress', context)!,
                          controller: myProvider.emailController,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                                RegExp(ValidationHelper.regexToRemoveEmoji)),
                            FilteringTextInputFormatter.deny(
                                RegExp(ValidationHelper.whiteSpace)),
                          ],
                          validator: (val) {
                            RegExp regExp =
                                RegExp(ValidationHelper.emailPattern);
                            if (val.isEmpty) {
                              return getTranslated('enterYourEmail', context);
                            } else if (!regExp.hasMatch(val)) {
                              return getTranslated(
                                  'enterValidEmailId', context);
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: CustomTextfield(
                          hintText: getTranslated('password', context)!,
                          controller: myProvider.passwordController,
                          textInputAction: TextInputAction.next,
                          isObscureText: myProvider.isPasswordVisible,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                                RegExp(ValidationHelper.regexToRemoveEmoji)),
                            FilteringTextInputFormatter.deny(
                                RegExp(ValidationHelper.whiteSpace)),
                          ],
                          validator: (val) {
                            if (val.isEmpty) {
                              return getTranslated(
                                  'enterYourPassword', context);
                            } else if (val.length < 6) {
                              return getTranslated(
                                  'passwordMustAtLeast', context);
                            } else if (val !=
                                myProvider.confirmPasswordController.text) {
                              return getTranslated('passwordNotMatch', context);
                            }
                          },
                          suffixWidget: InkWell(
                              onTap: () {
                                if (myProvider.isPasswordVisible) {
                                  myProvider.updatePasswordVisible(false);
                                } else {
                                  myProvider.updatePasswordVisible(true);
                                }
                              },
                              child: Icon(
                                myProvider.isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: ColorHelper.whiteColor,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: CustomTextfield(
                            hintText:
                                getTranslated('confirmPassword', context)!,
                            controller: myProvider.confirmPasswordController,
                            textInputAction: TextInputAction.done,
                            isObscureText: myProvider.isConfirmPasswordVisible,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(ValidationHelper.regexToRemoveEmoji)),
                              FilteringTextInputFormatter.deny(
                                  RegExp(ValidationHelper.whiteSpace)),
                            ],
                            validator: (val) {
                              if (val.isEmpty) {
                                return getTranslated(
                                    'enterConfirmPassword', context);
                              } else if (val.length < 6) {
                                return getTranslated(
                                    'passwordMustAtLeast', context);
                              } else if (val !=
                                  myProvider.passwordController.text) {
                                return getTranslated(
                                    'passwordNotMatch', context);
                              }
                            },
                            suffixWidget: InkWell(
                                onTap: () {
                                  if (myProvider.isConfirmPasswordVisible) {
                                    myProvider
                                        .updateConfirmPasswordVisible(false);
                                  } else {
                                    myProvider
                                        .updateConfirmPasswordVisible(true);
                                  }
                                },
                                child: Icon(
                                  myProvider.isConfirmPasswordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: ColorHelper.whiteColor,
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Checkbox(
                                value: myProvider.isCheckBox,
                                visualDensity: VisualDensity.compact,
                                checkColor: ColorHelper.blackColor,
                                activeColor: ColorHelper.whiteColor,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                side: const BorderSide(
                                    color: ColorHelper.whiteColor),
                                onChanged: (val) {
                                  myProvider.updateCheckBox(val!);
                                }),
                          ),
                          ScreenSize.width(15),
                          CustomText(
                            title: getTranslated('termsCondition', context)!,
                            fontsize: 12,
                            fontFamily: FontfamilyHelper.interMedium,
                          ),
                        ]),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 60, left: 12, right: 12),
                        child: CustomButton(
                            title: getTranslated('singUp', context)!,
                            onTap: (){
                              myProvider.checkValidation(context);
                            },
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                                text:
                                    "${getTranslated('alreadyHaveAnAccount', context)!} ",
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: FontfamilyHelper.interRegular,
                                    color: ColorHelper.whiteColor),
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pop(context);
                                      },
                                    text: getTranslated('login', context),
                                    style: const TextStyle(
                                        decorationColor: ColorHelper.pinkColor,
                                        fontSize: 13,
                                        fontFamily:
                                            FontfamilyHelper.interRegular,
                                        color: ColorHelper.pinkColor),
                                  )
                                ])),
                      )
                    ],
                  ),
                ),
              ),
            ));
          }),
        ));
  }
}
