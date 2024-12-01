import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/dashboard/home/notification_screen.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: ColorHelper.appTheme,
        elevation: 0,scrolledUnderElevation: 0.0,
        title: Row(
          children: [
            Image.asset('assets/dummy/Mask group.png',height: 40,),
            ScreenSize.width(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title: getTranslated('hello', context)!,
            fontsize: 13,fontFamily: FontfamilyHelper.interRegular,
            ),
                CustomText(title: 'Alexandra',
            fontsize: 19,fontFamily: FontfamilyHelper.interBold,
            )
              ],
            )
          ],
        ),
        actions: [
         const Padding(padding: EdgeInsets.only(right: 15),
         child: Icon(Icons.calendar_month_outlined,color: ColorHelper.whiteColor,size: 21,),),
          Image.asset(ImageHelper.chatIcon,color: ColorHelper.whiteColor,height: 22,),
          Padding(padding:const EdgeInsets.only(right: 20,left: 15),
          child: InkWell(
            onTap: (){
              RoutesHelper.pushCupertinoNavigation(const NotificationScreen());
            },
            child: Image.asset(ImageHelper.notificationIcon,color: ColorHelper.whiteColor,height: 22,)),
          )
        ],
      ),
    );
  }
}