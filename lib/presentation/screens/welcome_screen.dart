import 'package:flutter/material.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/auth/login_screen.dart';
import 'package:sheero/presentation/screens/auth/signup_screen.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  int selectedType = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(bottom:80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(ImageHelper.logo,height: 84,),
              const Spacer(),
              CustomText(title: getTranslated('letGetIn', context)!,
              fontsize: 22,fontFamily: FontfamilyHelper.interMedium,
              ),
              Padding(padding:const EdgeInsets.only(top: 65,left: 37,right: 37),
              child: CustomButton(title: getTranslated('log_In', context)!,
              isBorder:selectedType==0?false:true,
              onTap: (){
                selectedType=0;
                RoutesHelper.pushCupertinoNavigation(const LoginScreen());
                setState(() {
                });
              },
              ),
              ),
              Padding(padding:const EdgeInsets.only(top: 20,left: 37,right: 37,),
              child: CustomButton(title: getTranslated('register', context)!,isBorder:selectedType==1?false:true,
              onTap: (){
                selectedType=1;
                RoutesHelper.pushCupertinoNavigation(const SignupScreen());
                setState(() {
                });
              },
              ),
              ),
            ],
          ),
        ),
      ),
    
    );
  }
}