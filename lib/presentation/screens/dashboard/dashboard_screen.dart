import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/dashboard/home/home_screen.dart';
import 'package:sheero/presentation/screens/dashboard/myFriend/my_friend_screen.dart';
import 'package:sheero/presentation/screens/dashboard/myTask/mytask_screen.dart';
import 'package:sheero/presentation/screens/dashboard/settings/setting_screen.dart';
import 'package:sheero/presentation/widget/custom_text.dart';
import 'package:sheero/providers/dashboard_provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  List list =[
const HomeScreen(),
const MytaskScreen(),
const MyFriendScreen(),
const SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context,myProvider,child) {
        return Scaffold(
          body: SafeArea(
            child: HomeScreen()
            // list[myProvider.currentIndex]
            ),
          bottomNavigationBar: Container(
            height: 65,
            padding:const EdgeInsets.symmetric(horizontal: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bottonNavigationWidget(img:ImageHelper.logo,title: getTranslated("sheero", context)!,index: 0),
                bottonNavigationWidget(img:ImageHelper.myTaskIcon,title:getTranslated("myTask", context)!,index: 1),
                bottonNavigationWidget(img:ImageHelper.myFriendIcon,title:getTranslated("myFriends", context)!,index: 2),
                bottonNavigationWidget(img:ImageHelper.settingIcon,title:getTranslated("setting", context)!,index: 3),
              ],
            ),
          ),
        );
      }
    );
  }

  bottonNavigationWidget({required String img,required String title,required int index}){
    return InkWell(
      onTap: (){
        context.read<DashboardProvider>().updateIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(img,height: 20,width: 47,color: context.watch<DashboardProvider>().currentIndex==index?
          ColorHelper.pinkColor:ColorHelper.whiteColor,),
          ScreenSize.height(5),
          CustomText(title: title,
          color: context.watch<DashboardProvider>().currentIndex==index?
          ColorHelper.pinkColor:ColorHelper.whiteColor,
          fontsize: 10,fontFamily: FontfamilyHelper.interRegular,
          )
        ],
      ),
    );
  }
}