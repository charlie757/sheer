import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/widget/appbar.dart';
import 'package:sheero/presentation/widget/custom_text.dart';
import 'package:table_calendar/table_calendar.dart';

class AddRemainderScreen extends StatefulWidget {
  const AddRemainderScreen({super.key});

  @override
  State<AddRemainderScreen> createState() => _AddRemainderScreenState();
}

class _AddRemainderScreenState extends State<AddRemainderScreen> {
  List min = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,
    31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60];
    List hour = [1,2,3,4,5,6,7,8,9,10,11,12];
    List timeFormatList =['AM',"PM"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context: context, title: getTranslated('addReminder', context)!),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dateTable(),
            ScreenSize.height(30),
            timeWidget(),
            notesWidget()
          ],
          ),
        ),
    );
  }


    dateTable(){
    return  Container(
        decoration: BoxDecoration(
          color: ColorHelper.whiteColor,
          borderRadius: BorderRadius.circular(15)
        ),
        padding:const EdgeInsets.only(top: 15,left: 5,right: 5,bottom: 10),
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        calendarFormat: CalendarFormat.month,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle:const TextStyle(
            fontSize:14,color: ColorHelper.appTheme,
            fontFamily: FontfamilyHelper.interSemiBold
          ),
          headerPadding: EdgeInsets.zero,
          headerMargin: EdgeInsets.only(left: ScreenSize.screenWidth*.09,right: ScreenSize.screenWidth*.09,)
        ),
        focusedDay: DateTime.now(),
        calendarBuilders: CalendarBuilders(
          todayBuilder: (context, day, focusedDay) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  decoration:const BoxDecoration(
                      shape: BoxShape.circle,
                    color: ColorHelper.pinkColor
                  ),
                  alignment: Alignment.center,
                  child:  CustomText(title: day.day.toString(),fontFamily: FontfamilyHelper.interMedium,fontsize: 13,),
                ),
              ],
            );
          },
          outsideBuilder: (context, day, focusedDay) {
            return Container(
              // height: 60,
              padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   CustomText(title: day.day.toString(),color: ColorHelper.lightGrayColor,fontFamily: FontfamilyHelper.interMedium,fontsize: 13,),
                ],
              ),
            );
          },
          defaultBuilder: (context, day,focusDay) {
            return  InkWell(
              onTap: (){
              },
              child: Container(
                // height: 60,
                padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                decoration:const BoxDecoration(
                  // shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     CustomText(title: day.day.toString(),color: ColorHelper.appTheme,fontFamily: FontfamilyHelper.interMedium,fontsize: 13,),
                  ],
                ),
              ),
            );
          },
        ),
        calendarStyle:const CalendarStyle(
        ),
        rowHeight: 40,
        daysOfWeekHeight: 50,
        daysOfWeekStyle:const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            fontSize: 12,
            color: ColorHelper.appTheme,fontFamily: FontfamilyHelper.interRegular
          ),
          weekendStyle: TextStyle(
            fontSize: 12,
            color: ColorHelper.appTheme,fontFamily: FontfamilyHelper.interRegular
          )
        ),
        // calendarBuilders: CalendarBuilders(
        // todayBuilder: (context, day, focusedDay) {
        //   if(day==focusedDay){
        //     return Text('data');
        //   }
        // },
        // ),
      ),
    );
  }

timeWidget(){
  return Container(
     decoration:BoxDecoration(
          color: ColorHelper.whiteColor,
          borderRadius: BorderRadius.circular(15)
        ),
        padding:const EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        timerPicker(list:hour, title: getTranslated('hour', context)!,
        onSelectedItemChanged: (vl){}),
        ScreenSize.width(20),
        timerPicker(list:min, title: getTranslated('minute', context)!,
        onSelectedItemChanged: (vl){}),
        timeFormatPicker()
      ],
    ),
  );
}

notesWidget(){
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: getTranslated("note", context)!,
        fontsize: 14,fontFamily: FontfamilyHelper.interSemiBold,
        ),
        Padding(padding:const EdgeInsets.only(top: 12),
       child: noteTextField(),
       )
      ],
    ),
  );
}

timerPicker({required List list,required String title, ValueChanged<int>? onSelectedItemChanged}) {
    return Column(
      children: [
        CustomText(title: title,
        fontsize: 14,
        color: ColorHelper.appTheme,fontFamily: FontfamilyHelper.interSemiBold,
        ),
        ScreenSize.height(10),
        Row(
          children: [
            SizedBox(
              width: 50,
              height:90,
              child: CupertinoPicker(
                  selectionOverlay: Container(),
                  scrollController:
                  FixedExtentScrollController(initialItem: 0),
                  squeeze: 1,
                  diameterRatio: 1.9,
                  useMagnifier: true,
                  itemExtent: 30,
                  onSelectedItemChanged: onSelectedItemChanged,
                  looping: true,
                  children: list.map((element) {
                    return CustomText(
                        title: element.toString(),
                        fontsize: 16,
                        fontFamily: FontfamilyHelper.interBold,
                        color: ColorHelper.appTheme,
                        );
                  }).toList()),
            ),
          ],
        ),
      ],
    );
  }
  
  timeFormatPicker(){
    return  Padding(
      padding: const EdgeInsets.only(top: 29),
      child: SizedBox(
                width: 50,
                height: 90,
                child: CupertinoPicker(
                    selectionOverlay: Container(),
                    scrollController:
                    FixedExtentScrollController(initialItem: 0),
                    squeeze: 1,
                    diameterRatio: 1.9,
                    useMagnifier: true,
                    itemExtent: 30,
                    onSelectedItemChanged: (val){},
                    // looping: true,
                    children: timeFormatList.map((element) {
                      return CustomText(
                          title: element.toString(),
                          fontsize: 16,
                          fontFamily: FontfamilyHelper.interSemiBold,
                          color: ColorHelper.appTheme,
                          );
                    }).toList()),
              ),
    );
  }

  noteTextField(){
    return TextFormField(
      maxLines: 3,
      decoration: InputDecoration(
        hintText: getTranslated('writeYourNoteHere', context),
        hintStyle:const TextStyle(
          fontFamily: FontfamilyHelper.interSemiBold,
          color: Color(0xffA4A4A4),fontSize: 11
        ),
        filled: true,
       fillColor: ColorHelper.whiteColor,
       border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
       ),
       enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
       ),
       focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
       )
      ),
    );
  }
}