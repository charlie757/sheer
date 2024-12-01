import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/widget/appbar.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_textfield.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          context: context,
          title: getTranslated('myProfile', context)!,
          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.edit,
                color: ColorHelper.whiteColor,
                size: 18,
              ),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              profileImageWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CustomTextfield(
                  hintText: 'Alexandra',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CustomTextfield(
                  hintText: getTranslated('description', context)!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CustomTextfield(
                  hintText: getTranslated('emailAddress', context)!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CustomTextfield(
                  hintText: getTranslated('phoneNo', context)!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CustomTextfield(
                  hintText: 'Berliner Allee 23, Germany',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CustomTextfield(
                  hintText: '12345654',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 12, right: 12),
                child: CustomButton(title: getTranslated('save', context)!),
              ),
            ],
          ),
        ),
      ),
    );
  }

  profileImageWidget() {
    return Stack(
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorHelper.pinkColor, width: 3)),
          child: Image.asset('assets/dummy/Mask group.png'),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: 27,
            width: 27,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: ColorHelper.whiteColor),
            child: const Icon(
              Icons.camera_alt,
              color: ColorHelper.pinkColor,
              size: 16,
            ),
          ),
        )
      ],
    );
  }
}
