import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/widget/appbar.dart';
import 'package:sheero/presentation/widget/custom_button.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

class CreateChallengeScreen extends StatefulWidget {
  const CreateChallengeScreen({super.key});

  @override
  State<CreateChallengeScreen> createState() => _CreateChallengeScreenState();
}

class _CreateChallengeScreenState extends State<CreateChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: getTranslated('createChallenge', context)!,isLeading: false),
      body: Container(
        margin:const EdgeInsets.only(top: 20),
        height: double.infinity,
        decoration:const BoxDecoration(
          color: ColorHelper.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
          )
        ),
        padding:const EdgeInsets.only(top: 28),
        child: Column(
          children: [
            CustomText(title: getTranslated('friends', context)!,
            color: ColorHelper.appTheme,fontsize: 17,fontFamily: FontfamilyHelper.interBold,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context,sp){
                  return ScreenSize.height(20);
                },
                itemCount: 20,
                shrinkWrap: true,
                padding:const EdgeInsets.only(left: 20,right: 20,top: 40,bottom: 40),
                itemBuilder: (context,index){
                  return Row(
                    children: [
                      Image.asset('assets/dummy/Mask group girl.png',height: 36,),
                      ScreenSize.width(15),
                      Expanded(
                        child: CustomText(title: "Emily Johnson",fontsize: 16,color: ColorHelper.appTheme,
                        fontFamily: FontfamilyHelper.interSemiBold,fontWeight: FontWeight.w600,
                        maxLines: 1,
                        ),
                      ),
                        SizedBox(
                          height: 20,width: 20,
                          child: Checkbox(value: true,
                          visualDensity: VisualDensity.compact,
                          checkColor: ColorHelper.whiteColor,
                          activeColor: ColorHelper.pinkColor,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          side:const BorderSide(color: ColorHelper.pinkColor),
                           onChanged: (val){
                            // myProvider.updateCheckBox(val!);
                          }),
                        ),
                    ],
                  );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left:37,right: 38,bottom: 25),
              child: CustomButton(title: getTranslated('done', context)!,
              
              ),
            )
          ],
        ),
      ),
    );
  }
}