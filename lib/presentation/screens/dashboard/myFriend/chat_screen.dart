import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
         const Padding(
            padding:  EdgeInsets.only(top: 4),
            child: Divider(
                  color: ColorHelper.whiteColor,
                ),
          ),
        Expanded(child: SingleChildScrollView(
          child: Column(
            children: [
                Padding(padding:const EdgeInsets.only(top: 20),
            child: CustomText(title: "Today",fontsize: 12,fontFamily: FontfamilyHelper.interMedium,),
            ),
            ListView.separated(
              separatorBuilder: (context,sp){
                return ScreenSize.height(15);
              },
              itemCount: 7,
              padding:const EdgeInsets.only(top: 25,bottom: 30),
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
            return index==1||index==3?
            receiveChatWidget():
            sendChatWidget();
            })
            ],
          ),
        )),
        Padding(padding:const EdgeInsets.only(bottom: 20,left: 20,right: 20),
        child: commentBoxWidget(),
        )
        ],
      ),
    );
  }

sendChatWidget(){
  return Align(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: const EdgeInsets.only(right: 15,left: 65,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 15,),
            decoration:const BoxDecoration(
              color: ColorHelper.blueColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              )
            ),
            child: CustomText(title: "Hey there! What’s up?",fontsize: 14,fontFamily: FontfamilyHelper.interMedium,),
          ),
          ScreenSize.height(5),
          CustomText(title: '10:15',fontsize: 9,fontFamily: FontfamilyHelper.interMedium,)
        ],
      ),
    ),
  );
}

receiveChatWidget(){
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(right: 65,left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset('assets/dummy/Mask group girl.png',height: 16,),
              Expanded(
                child: Container(
                  margin:const EdgeInsets.only(left: 5),
                  padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  decoration:const BoxDecoration(
                    color: ColorHelper.blueColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child: CustomText(title: "Nothing just chilling and watching youtube. what about you?",fontsize: 14,fontFamily: FontfamilyHelper.interMedium,),
                ),
              ),
              
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18,top: 5),
            child: CustomText(title: '10:15',fontsize: 9,fontFamily: FontfamilyHelper.interMedium,),
          )
        ],
      ),
    ),
  );
}

  AppBar appBar(){
    return AppBar(
       automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorHelper.appTheme,
        scrolledUnderElevation: 0.0,
        title:  Row(
          children: [
            Image.asset('assets/dummy/Mask group girl.png',height: 50,),
            ScreenSize.width(15),
            CustomText(title: 'Amelia Allen',
            fontsize: 20,fontFamily: FontfamilyHelper.interBold,
            )
          ],
        ),
        actions: const[
          Padding(padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.info_outline,color: ColorHelper.whiteColor,),
          )
        ],
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

}