import 'package:flutter/material.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/dashboard/myFriend/chat_screen.dart';
import 'package:sheero/presentation/widget/appbar.dart';
import 'package:sheero/presentation/widget/custom_searchbar.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: getTranslated('messages', context)!),
      body: Column(
        children: [
          Padding(padding:const EdgeInsets.only(
            left: 20,right: 20,top: 15
          ),child: CustomSearchbar(),),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (contxt,sp){
                return ScreenSize.height(30);
              },
            itemCount: 10,
            shrinkWrap: true,
            padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  RoutesHelper.pushCupertinoNavigation(const ChatScreen());
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/dummy/Mask group (2).png',height: 50,width: 50,),
                    Expanded(
                      child: Padding(padding:const EdgeInsets.only(left: 11,right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: 'Amelia Allen',
                          fontsize: 16,fontFamily: FontfamilyHelper.interBold,
                          ),
                          ScreenSize.height(5),
                          CustomText(title: 'After long time great seeing you. I have to go now, I’ll talk to you later',
                          fontsize: 10,fontFamily: FontfamilyHelper.interRegular,
                          )
                        ],
                      ),
                      ),
                    ),
                    CustomText(title: '15 min',fontsize: 9,fontFamily: FontfamilyHelper.interSemiBold,)
                  ],
                ),
              );
          }))
        ],
      ),
    );
  }
}