import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/dashboard/settings/add_remainder_screen.dart';
import 'package:sheero/presentation/widget/appbar.dart';
import 'package:sheero/presentation/widget/custom_text.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: getTranslated('calendar', context)!),
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
        child: dateTable(),
      ),
    );
  }

    dateTable(){
    return  TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      calendarFormat: CalendarFormat.month,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle:const TextStyle(
          fontSize:20,color: ColorHelper.appTheme,
          fontFamily: FontfamilyHelper.interSemiBold
        ),
        headerPadding: EdgeInsets.zero,
        decoration:const BoxDecoration(
          // color: Colors.red
        ),
        headerMargin: EdgeInsets.only(left: ScreenSize.screenWidth*.10,right: ScreenSize.screenWidth*.10,bottom: 10)
      ),
      focusedDay: DateTime.now(),
      calendarBuilders: CalendarBuilders(
        todayBuilder: (context, day, focusedDay) {
          return InkWell(
            onTap: (){
              RoutesHelper.pushCupertinoNavigation(const AddRemainderScreen());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  margin:const EdgeInsets.only(top: 3),
                  decoration:const BoxDecoration(
                      shape: BoxShape.circle,
                    color: ColorHelper.pinkColor
                  ),
                  alignment: Alignment.center,
                  child:  CustomText(title: day.day.toString(),fontFamily: FontfamilyHelper.interSemiBold,fontsize: 11,),
                ),
              ],
            ),
          );
        },
        outsideBuilder: (context, day, focusedDay) {
          return Container(
            // height: 60,
            padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 3),
            decoration:const BoxDecoration(
              // color: Colors.yellow,
              // shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 CustomText(title: day.day.toString(),color: ColorHelper.lightGrayColor,fontFamily: FontfamilyHelper.interSemiBold,fontsize: 11,),
              ],
            ),
          );
        },
        defaultBuilder: (context, day,focusDay) {
          return  InkWell(
            onTap: (){
              RoutesHelper.pushCupertinoNavigation(const AddRemainderScreen());
            },
            child: Container(
              // height: 60,
              padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 3),
              decoration:const BoxDecoration(
                // color: Colors.yellow,
                // shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   CustomText(title: day.day.toString(),color: ColorHelper.appTheme,fontFamily: FontfamilyHelper.interSemiBold,fontsize: 11,),
                  day.day==11? Container(
                    
                    decoration: BoxDecoration(
                      color: ColorHelper.pinkColor.withOpacity(.5)
                    ),
                    padding:const EdgeInsets.symmetric(horizontal: 4,vertical: 1),
                    child: CustomText(title: "go to gym",fontsize: 6,color: ColorHelper.appTheme,fontFamily: FontfamilyHelper.interSemiBold,),
                   ):const SizedBox.shrink()
                ],
              ),
            ),
          );
        },
      ),
      calendarStyle:const CalendarStyle(
        
      ),
      daysOfWeekHeight: 80,
      daysOfWeekStyle:const DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          fontSize: 12,
          color: ColorHelper.appTheme,fontFamily: FontfamilyHelper.interSemiBold
        ),
        weekendStyle: TextStyle(
          fontSize: 12,
          color: ColorHelper.appTheme,fontFamily: FontfamilyHelper.interSemiBold
        )
      ),
      // calendarBuilders: CalendarBuilders(
      // todayBuilder: (context, day, focusedDay) {
      //   if(day==focusedDay){
      //     return Text('data');
      //   }
      // },
      // ),
    );
  }

}