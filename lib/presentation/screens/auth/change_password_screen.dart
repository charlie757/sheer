import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/validation_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'package:sheero/providers/change_password_provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangePasswordProvider(),
      child: Consumer<ChangePasswordProvider>(
        builder: (context,myProvider,child) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      ImageHelper.resetPasswordImage,
                      height: 220,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: CustomTextfield(
                        hintText: getTranslated('enterNewPassword', context)!,
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
                                  'enterNewPassword', context);
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
                           hintText:  getTranslated('enterConfirmNewPassword', context)!,
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
                                    'enterConfirmNewPassword', context);
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
                                ))
                      ),
                    ),
                  ],
                ),
              ),
            )),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 30, right: 37, bottom: 40),
              child: CustomButton(
                title: getTranslated('save', context)!,
                onTap: () {
                  myProvider.checkValidation();
                },
              ),
            ),
          );
        }
      ),
    );
  }
}
