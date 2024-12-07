import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/validation_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'package:sheero/providers/forgot_password_provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordProvider(),
      child: Consumer<ForgotPasswordProvider>(
          builder: (context, myProvider, child) {
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: myProvider.formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 25, right: 25, bottom: 40),
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
                          controller: myProvider.emailController,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 37, right: 37, bottom: 40),
            child: CustomButton(
              title: getTranslated('send', context)!,
              onTap: () {
                myProvider.checkValidation();
              },
            ),
          ),
        );
      }),
    );
  }
}
