import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/widget/appbar.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

class TaskRequestScreen extends StatefulWidget {
  const TaskRequestScreen({super.key});

  @override
  State<TaskRequestScreen> createState() => _TaskRequestScreenState();
}

class _TaskRequestScreenState extends State<TaskRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          context: context,
          title: getTranslated('taskRequest', context)!,
          ),
      body: ListView.separated(
        separatorBuilder: (context, sp) {
          return ScreenSize.height(40);
        },
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: ColorHelper.pinkColor),
                  alignment: Alignment.center,
                  child: Image.asset('assets/dummy/Mask group girl.png')),
              ScreenSize.width(10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: 'New Task received by Isabella',
                    fontsize: 14,
                    fontFamily: FontfamilyHelper.interBold,
                  ),
                  ScreenSize.height(5),
                  CustomText(
                    title: 'You have to volunteer Virtually',
                    fontsize: 11,
                    color: ColorHelper.whiteColor.withOpacity(.8),
                    fontFamily: FontfamilyHelper.interRegular,
                  ),
                  ScreenSize.height(15),
                  Row(
                    children: [
                      btn(
                        title: getTranslated('accept', context)!,
                      ),
                      ScreenSize.width(15),
                      btn(
                          title: getTranslated('remove', context)!,
                          color: ColorHelper.whiteColor),
                    ],
                  )
                ],
              )),
              CustomText(
                title: '15 min',
                fontsize: 9,
                fontFamily: FontfamilyHelper.interSemiBold,
              )
            ],
          );
        },
      ),
    );
  }

  btn({
    Color color = ColorHelper.pinkColor,
    required String title,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 30,
        width: 75,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: CustomText(
          title: title,
          color: color == ColorHelper.whiteColor
              ? ColorHelper.appTheme
              : ColorHelper.whiteColor,
          fontsize: 11,
          fontFamily: FontfamilyHelper.interSemiBold,
        ),
      ),
    );
  }
}
