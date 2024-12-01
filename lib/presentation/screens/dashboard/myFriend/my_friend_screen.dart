import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/dashboard/myFriend/chat_list_screen.dart';
import 'package:sheero/presentation/widget/custom_text.dart';
import 'package:sheero/presentation/widget/unfriend_dialogbox.dart';

class MyFriendScreen extends StatefulWidget {
  const MyFriendScreen({super.key});

  @override
  State<MyFriendScreen> createState() => _MyFriendScreenState();
}

class _MyFriendScreenState extends State<MyFriendScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            CustomText(title: getTranslated('myFriends', context)!,
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
                      Image.asset('assets/dummy/Mask group.png',height: 36,),
                      ScreenSize.width(15),
                      Expanded(
                        child: CustomText(title: "Henry Thomas",fontsize: 16,color: ColorHelper.appTheme,
                        fontFamily: FontfamilyHelper.interSemiBold,fontWeight: FontWeight.w600,
                        maxLines: 1,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          RoutesHelper.pushCupertinoNavigation(const ChatListScreen());
                        },
                        child: Image.asset(ImageHelper.chatIcon,height: 28,width: 28,),
                      ),
                      ScreenSize.width(15),
                      InkWell(
                        onTap: (){
                          unfriendDialogBox(context);
                        },
                        child: Container(
                          height: 30,width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                            color:index==1?ColorHelper.pinkColor: ColorHelper.appTheme
                          ),
                          alignment: Alignment.center,
                          child: CustomText(title:index==1?
                          getTranslated('add', context)!:
                           getTranslated('remove', context)!,
                          fontsize: 9,fontFamily: FontfamilyHelper.interMedium,
                          ),
                        ),
                      )
                    ],
                  );
              }),
            ),
          ],
        ),
      ),
    );
  }
}