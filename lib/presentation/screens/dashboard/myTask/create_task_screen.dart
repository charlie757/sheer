import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/dashboard/myTask/create_challenge_screen.dart';
import 'package:sheero/presentation/widget/appbar.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_text.dart';
import 'package:sheero/presentation/widget/custom_textfield.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          context: context, title: getTranslated('createTask', context)!),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30,bottom: 40),
        child: Column(
          children: [
            CustomTextfield(
              hintText: getTranslated('taskTitle', context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CustomTextfield(
                hintText: getTranslated('taskCategory', context),
                suffixWidget: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: ColorHelper.whiteColor,
                  size: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CustomTextfield(
                hintText: getTranslated('description', context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CustomTextfield(
                hintText: getTranslated('startDateOfTask', context),
                suffixWidget: const Icon(
                  Icons.calendar_month_outlined,
                  color: ColorHelper.whiteColor,
                  size: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CustomTextfield(
                hintText: getTranslated('endDateOfTask', context),
                suffixWidget: const Icon(
                  Icons.calendar_month_outlined,
                  color: ColorHelper.whiteColor,
                  size: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CustomTextfield(
                hintText: getTranslated('friends', context),
                suffixWidget: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: ColorHelper.whiteColor,
                  size: 15,
                ),
              ),
            ),
            ScreenSize.height(40),
            taskType(title: getTranslated('public', context)!,color: ColorHelper.lightBlueColor),
            ScreenSize.height(12),
            taskType(title: getTranslated('private', context)!),
            ScreenSize.height(12),
            taskType(title: getTranslated('friendOnly', context)!),
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
              child: CustomButton(title: getTranslated('submit', context)!,
              onTap: (){
                RoutesHelper.pushCupertinoNavigation(const CreateChallengeScreen());
              },
              ),
            ),
          ],
        ),
      ),
    );
  }

  taskType({required String title, Color color = ColorHelper.whiteColor}) {
    return Row(
      children: [
        Container(
          height: 22,
          width: 22,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 5)),
        ),
        ScreenSize.width(12),
        CustomText(
          title: title,
          fontsize: 18,
          fontFamily: FontfamilyHelper.interRegular,
        )
      ],
    );
  }
}
