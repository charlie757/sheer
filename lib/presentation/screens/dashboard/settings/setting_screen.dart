import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/dashboard/settings/friend_request_screen.dart';
import 'package:sheero/presentation/screens/dashboard/settings/my_profile_screen.dart';
import 'package:sheero/presentation/screens/dashboard/settings/task_request_screen.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorHelper.appTheme,
        elevation: 0,
        scrolledUnderElevation: 0.0,
        title: Row(
          children: [
            Image.asset(
              'assets/dummy/Mask group.png',
              height: 50,
            ),
            ScreenSize.width(15),
            CustomText(
              title: 'Alexandra',
              fontsize: 20,
              fontFamily: FontfamilyHelper.interBold,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: [
            settingTypesWidget(
                title: getTranslated('myAccount', context)!, index: 0),
            settingTypesWidget(
                title: getTranslated('changeLanguage', context)!, index: 1),
            settingTypesWidget(
                title: getTranslated('calendar', context)!, index: 2),
            settingTypesWidget(
                title: getTranslated('taskRequest', context)!, index: 3),
            settingTypesWidget(
                title: getTranslated('friendRequest', context)!, index: 4),
            settingTypesWidget(
                title: getTranslated('contactUs', context)!, index: 5),
            settingTypesWidget(
                title: getTranslated('termsCondition', context)!, index: 6),
            settingTypesWidget(
                title: getTranslated('imprint', context)!, index: 7),
            settingTypesWidget(
                title: getTranslated('logout', context)!, index: 8),
          ],
        ),
      ),
    );
  }

  settingTypesWidget({required String title, required int index}) {
    return InkWell(
      onTap: () {
        selectedIndex = index;
        navigate();
        setState(() {});
      },
      child: Container(
        width: double.infinity,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: selectedIndex == index
                ? ColorHelper.pinkColor
                : ColorHelper.appTheme),
        child: CustomText(
          title: title,
          fontsize: 18,
          fontFamily: FontfamilyHelper.interBold,
        ),
      ),
    );
  }

  navigate() {
    switch (selectedIndex) {
      case 0:
        RoutesHelper.pushCupertinoNavigation(const MyProfileScreen());
        break;
      case 1:
        // RoutesHelp5er.pushCupertinoNavigation(const NotificationScreen());
        break;
      case 3:
        RoutesHelper.pushCupertinoNavigation(const TaskRequestScreen());
        break;
      case 4:
        RoutesHelper.pushCupertinoNavigation(const FriendRequestScreen());
        break;
      case 8:
        openDialogBox(
          );
      default:
    }
  }

  void openDialogBox(
      ) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 20, right: 20, bottom: 33),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: getTranslated('logout', context)!,
                  color: ColorHelper.appTheme,fontsize: 18,
                  ),
                  ScreenSize.height(30),
                  Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      title: getTranslated('youWantToLogout', context)!,
                      fontsize: 14,
                      fontFamily: FontfamilyHelper.interMedium,
                      color: ColorHelper.appTheme,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ScreenSize.height(37),
                  Row(
                    children: [
                      Flexible(
                        child: CustomButton(
                            title: getTranslated('no', context)!,
                            height: 50,
                            width: double.infinity,
                            isBorder: true,
                            onTap: (){
                              Navigator.pop(context);
                            }),
                      ),
                      ScreenSize.width(20),
                      Flexible(
                        child: CustomButton(
                            title: getTranslated('yes', context)!,
                            height: 50,
                            width: double.infinity,
                            onTap: (){
                              Navigator.pop(context);
                            }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
