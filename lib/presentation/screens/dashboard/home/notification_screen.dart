import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/widget/appbar.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: getTranslated('notification', context)!,
      ),  
      body: ListView.separated(
        separatorBuilder: (context,sp){
          return ScreenSize.height(40);
        },
        itemCount: 5,
        padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        itemBuilder: (context,index){
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration:const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorHelper.pinkColor
                ),
                alignment: Alignment.center,
                child: CustomText(title: "B",
                fontsize: 16,fontFamily: FontfamilyHelper.interBold,
                ),
              ),
              ScreenSize.width(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(title: index==4?
                    "Alex comment on your task":
                     "New Challange received by Melony",
                    fontsize: 14,fontFamily: FontfamilyHelper.interSemiBold,
                    maxLines: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: CustomText(title:index==4?"you need to perform 5 exercise today": "You have to volunteer Virtually",
                      fontsize: 11,fontFamily: FontfamilyHelper.interRegular,
                      ),
                    ),
                    index==0?
                    Padding(
                      padding:const EdgeInsets.only(top: 13),
                      child: Row(
                        children: [
                          btn(title: getTranslated('accept', context)!,
                          ),
                          ScreenSize.width(15),
                          btn(title: getTranslated('decline', context)!,
                          color: ColorHelper.whiteColor
                          ),
                        ],
                      ),
                    ):Container()
                  ],
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(top: 5),
                child: CustomText(title: "Today",
                fontsize: 8,fontFamily: FontfamilyHelper.interSemiBold,
                ),
              )
            ],
          );
      }),
    );
  }
  btn({ Color color=ColorHelper.pinkColor,required String title,}){
    return InkWell(
      onTap: (){
        dialogBox();
      },
      child: Container(
        height: 30,width: 75,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20)
        ),
        child: CustomText(title: title,
        color: color ==ColorHelper.whiteColor?ColorHelper.appTheme:ColorHelper.whiteColor,
        fontsize: 11,fontFamily: FontfamilyHelper.interSemiBold,
        ),
      ),
    );
  }

  dialogBox(){
    showDialog(context: context, builder: (context){
    return AlertDialog(
      backgroundColor: ColorHelper.whiteColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          taskType(title: getTranslated('public', context)!,),
          ScreenSize.height(19),
          taskType(title: getTranslated('private', context)!,),
          ScreenSize.height(19),
          taskType(title: getTranslated('friendOnly', context)!,),
        ],
      ),
    );
    });
  }


  taskType({required String title, Color color = ColorHelper.appTheme}) {
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
          color: ColorHelper.appTheme,
          fontFamily: FontfamilyHelper.interSemiBold,
        )
      ],
    );
  }

}
