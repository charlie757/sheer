import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/welcome_screen.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_text.dart';
import 'package:sheero/providers/onboarding_provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final myProvider = context.watch<OnboardingProvider>();
    return Scaffold(
      body: PageView.builder(
        physics:const NeverScrollableScrollPhysics(),
        itemCount: myProvider.onboardingList.length,
        onPageChanged: (val){
          myProvider.updateValues(val);
        },
        itemBuilder: (context,index){
        return Column(
        children: [
          Image.asset(
              myProvider.onboardingList[myProvider.currentIndex]['img'],
              ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CustomText(
              title: myProvider.onboardingList[myProvider.currentIndex]
                  ['title'],
              fontsize: 22,
              fontFamily: FontfamilyHelper.interMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CustomText(
              title: myProvider.onboardingList[myProvider.currentIndex]
                  ['des'],
              fontsize: 13,
              fontFamily: FontfamilyHelper.interRegular,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(myProvider.onboardingList.length,
                  (index) {
                return myProvider.currentIndex == index
                    ? indicator(false)
                    : indicator(true);
              })),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
            child: myProvider.currentIndex==2?
            CustomButton(title: getTranslated('getStarted', context)!,
            onTap: () {
              myProvider.checkValidation();
            },
            ):
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    RoutesHelper.pushCupertinoNavigation(const WelcomeScreen());
                  },
                  child: CustomText(title: getTranslated('skip', context)!,
                  color: ColorHelper.pinkColor,fontsize: 18,fontFamily: FontfamilyHelper.interMedium,
                  ),
                ),
                InkWell(
                  onTap: (){
                    myProvider.checkValidation();
                  },
                  child: CustomText(title: getTranslated('next', context)!,
                  color: ColorHelper.pinkColor,fontsize: 18,fontFamily: FontfamilyHelper.interMedium,
                  ),
                ),
              ],
            ),
          )
        ],
              );
      }),
    );
  }

  
  Widget indicator(bool isActive) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: !isActive
              ? ColorHelper.pinkColor
              : ColorHelper.whiteColor,
        ),
      ),
    );
  }

}