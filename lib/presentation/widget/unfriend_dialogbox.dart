
import 'package:flutter/material.dart';
import 'package:sheero/core/constants/app_constants.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

void unfriendDialogBox(BuildContext context
    ) {
  showGeneralDialog(
    context: navigatorKey.currentContext!,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
              color: ColorHelper.appTheme, borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              height: 200,
              padding:const EdgeInsets.only(left: 30,right: 30,bottom: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              CustomText(title: "${getTranslated("doYouWantToUnfriend", context)!} Henry",
              fontsize: 14,fontFamily: FontfamilyHelper.interMedium,
              ),
              const Spacer(),
              Row(
                children: [
                 Expanded(child: CustomButton(title: getTranslated("no", context)!,
                 color: ColorHelper.whiteColor,height: 40,
                 )),
                 ScreenSize.width(20),
                 Expanded(child: CustomButton(title: getTranslated("yes", context)!,
                 height: 40,              
                 )),
                ],
              )
            ],
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
       Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
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
