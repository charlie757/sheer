import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_textfield.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding( padding: const EdgeInsets.only(top: 30,left: 25,right: 25),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
                    Image.asset(
                    ImageHelper.resetPasswordImage,
                    height: 220,
                  ),
              Padding(padding:const EdgeInsets.only(top: 30),
            child: CustomTextfield(
              hintText: getTranslated('enterCurrentPassword', context)!,
              suffixWidget:const Icon(Icons.visibility_outlined,color: ColorHelper.whiteColor,),
            ),
            ),
          
            Padding(padding:const EdgeInsets.only(top: 40),
            child: CustomTextfield(
              hintText: getTranslated('enterNewPassword', context)!,
              suffixWidget:const Icon(Icons.visibility_outlined,color: ColorHelper.whiteColor,),
            ),
            ),
            
            ],
          ),
        ),
        )),
         bottomNavigationBar: Padding(padding:const EdgeInsets.only(left: 30,right: 37,bottom: 40),
        child: CustomButton(title: getTranslated('save', context)!,
        onTap: (){
          // RoutesHelper.pushCupertinoNavigation(const ChangePasswordScreen());
        },
        
        ),
        ),
    );
  }
}