import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/dashboard/myTask/view_other_profile_screen.dart';
import 'package:sheero/presentation/widget/appbar.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: getTranslated('comment', context)!),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context,sp){
                return ScreenSize.height(40);
              },
              itemCount: 5,
              padding:const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 40),
              shrinkWrap: true,
              itemBuilder: (context,index){
                return commentWidget();
            }),
          ),
          Padding(padding:const EdgeInsets.only(left: 20,right: 20,bottom: 20),
          child: commentBoxWidget(),
          )
        ],
      ),
    );
  }

  commentBoxWidget(){
    return TextFormField(
      style:const TextStyle(
        color: ColorHelper.whiteColor,fontSize: 13
      ),
      decoration: InputDecoration(
        hintText: "Write your comment",
        prefixIcon: Container(
          width: 5,
        ),
        prefixIconConstraints:const BoxConstraints(minWidth: 25),
        hintStyle:const TextStyle(
          color: ColorHelper.whiteColor,fontSize: 11,
          fontFamily: FontfamilyHelper.interRegular
        ),
        fillColor:const Color(0xff777F91),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        ), 
        suffixIcon: Container(
          height: 46,width: 46,
          decoration: BoxDecoration(
            color: ColorHelper.whiteColor,
            borderRadius: BorderRadius.circular(40)
          ),
          alignment: Alignment.center,
          child: Image.asset(ImageHelper.chatShareIcon,height: 20,),
        )
      ),
    );
  }

  commentWidget(){
    return InkWell(
      onTap: (){
        RoutesHelper.pushCupertinoNavigation(const ViewOtherProfileScreen());
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/dummy/Mask group.png',height: 54,),
          ScreenSize.width(15),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
               CustomText(title: 'Benjamin Taylor',fontsize: 18,fontFamily: FontfamilyHelper.interSemiBold,),
                ScreenSize.width(15),
                CustomText(title: '15min',fontsize: 10,),
                  ],
                ),
                // ScreenSize.height(12),
               const Text.rich(TextSpan(
                  text: "@ elizabeth ",
                  style: TextStyle(
                    fontSize: 15,color: ColorHelper.lightGrayColor
                  ),
                  children: [
                    TextSpan(
                      text: 'Lorem ipsum dolor sit amet, cons adipiscing elit, sed do eiusmod tempor. 👍 🙂 ☺️',
                      style: TextStyle(
                        fontSize: 10,color:ColorHelper.whiteColor
                      )
                    )
                  ]
                )),
                Padding(padding:const EdgeInsets.only(top: 10),
                child: CustomText(title: "Reply",fontsize: 10,color: ColorHelper.lightGrayColor,),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}