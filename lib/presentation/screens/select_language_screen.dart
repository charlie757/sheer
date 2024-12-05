import 'package:flutter/material.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/onboarding_screen.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {

int selectedLanguage = -1;


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
              CustomText(title: getTranslated('pickYourLanguage', context)!,
              fontsize: 22,fontFamily: FontfamilyHelper.interMedium,
              ),
              Padding(padding:const EdgeInsets.only(top: 65,left: 37,right: 37),
              child: CustomButton(title: getTranslated('english', context)!,img: ImageHelper.englishIcon,
              isBorder: selectedLanguage==0?false:true,
              onTap: (){
                selectedLanguage=0;
                RoutesHelper.pushCupertinoNavigation(const OnboardingScreen());
                setState(() {
                });
              },
              ),
              ),
              Padding(padding:const EdgeInsets.only(top: 20,left: 37,right: 37,),
              child: CustomButton(title: getTranslated('german', context)!,isBorder: selectedLanguage==1?false:true,
              img: ImageHelper.germanIcon,onTap: (){
                selectedLanguage=1;
                RoutesHelper.pushCupertinoNavigation(const OnboardingScreen());
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