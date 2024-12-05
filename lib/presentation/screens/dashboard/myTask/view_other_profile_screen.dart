import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/widget/custom_text.dart';
import 'package:sheero/presentation/widget/task_widget.dart';

class ViewOtherProfileScreen extends StatefulWidget {
  const ViewOtherProfileScreen({super.key});

  @override
  State<ViewOtherProfileScreen> createState() => _ViewOtherProfileScreenState();
}

class _ViewOtherProfileScreenState extends State<ViewOtherProfileScreen> {
  bool isAdd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileWidget(),
            const Padding(
              padding: EdgeInsets.only(top: 35),
              child: Divider(
                color: ColorHelper.whiteColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: CustomText(
                title: getTranslated('taskList', context)!,
                fontsize: 18,
                fontFamily: FontfamilyHelper.interSemiBold,
              ),
            ),
            ListView.separated(
                separatorBuilder: (context, sp) {
                  return ScreenSize.height(30);
                },
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                itemBuilder: (context, index) {
                  return const TaskWidget();
                })
          ],
        ),
      )),
    );
  }

  profileWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Image.asset('assets/dummy/Mask group girl.png'),
          ScreenSize.height(20),
          CustomText(
            title: 'Amelia Allen',
            fontsize: 20,
            fontFamily: FontfamilyHelper.interMedium,
          ),
          ScreenSize.height(12),
          CustomText(
            title:
                'Lorem ipsum dolor sit amet consectetur adipiscing  elit, sed do eiusmod tempor',
            fontsize: 12,
            color: ColorHelper.whiteColor.withOpacity(.8),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child:!isAdd? btn(
                title: getTranslated('add', context)!,
                onTap: () {
                  isAdd = true;
                  setState(() {});
                }):
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    btn(title: getTranslated('friends', context)!,color: ColorHelper.gray98Color),
                    ScreenSize.width(28),
                    btn(title: getTranslated('message', context)!,color: ColorHelper.gray98Color)
                  ],
                ),
          ),
        ],
      ),
    );
  }

  Widget btn(
      {required String title,
      Color color = ColorHelper.pinkColor,
      Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 34,
        width: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16)),
        child: CustomText(
          title: title,
          fontsize: 12,
          fontFamily: FontfamilyHelper.interRegular,
        ),
      ),
    );
  }
}
