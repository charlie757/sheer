import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/dashboard/home/notification_screen.dart';
import 'package:sheero/presentation/screens/dashboard/settings/my_profile_screen.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int selectedIndex =-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorHelper.appTheme,
        elevation: 0,scrolledUnderElevation: 0.0,
        title: Row(
          children: [
            Image.asset('assets/dummy/Mask group.png',height: 50,),
            ScreenSize.width(15),
            CustomText(title: 'Alexandra',
            fontsize: 20,fontFamily: FontfamilyHelper.interBold,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            settingTypesWidget(title: getTranslated('myAccount', context)!,index: 0),
            settingTypesWidget(title: getTranslated('changeLanguage', context)!,index: 1),
            settingTypesWidget(title: getTranslated('imprint', context)!,index: 2),
            settingTypesWidget(title: getTranslated('contactUs', context)!,index: 3),
            settingTypesWidget(title: getTranslated('termsCondition', context)!,index: 4),
            settingTypesWidget(title: getTranslated('calendar', context)!,index: 5),
            settingTypesWidget(title: getTranslated('logout', context)!,index: 6),

          ],
        ),
      ),
    );
  }

  settingTypesWidget({required String title, required int index}){
    return InkWell(
      onTap: (){
        selectedIndex=index;
        navigate();
        setState(() {
        });
      },
      child: Container(
        width: double.infinity,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:selectedIndex==index? ColorHelper.pinkColor:ColorHelper.appTheme
        ),
        child: CustomText(title: title,fontsize: 18,
        fontFamily: FontfamilyHelper.interBold,
        ),
      ),
    );
  }

  navigate(){
    switch (selectedIndex) {
      case 0:
        RoutesHelper.pushCupertinoNavigation(const MyProfileScreen());
        break;
        case 1:
        RoutesHelper.pushCupertinoNavigation(const NotificationScreen());
      default:
    }
  }
}