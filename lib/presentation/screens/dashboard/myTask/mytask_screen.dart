import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/dashboard/myTask/create_task_screen.dart';
import 'package:sheero/presentation/widget/appbar.dart';
import 'package:sheero/presentation/widget/custom_text.dart';
import 'package:sheero/presentation/widget/task_widget.dart';

class MytaskScreen extends StatefulWidget {
  const MytaskScreen({super.key});

  @override
  State<MytaskScreen> createState() => _MytaskScreenState();
}

class _MytaskScreenState extends State<MytaskScreen> {

 int selectedTabBar =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context,isLeading: false, title: getTranslated('task', context)!,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  tabBar(title: getTranslated('createdTask', context)!,index: 0),
                tabBar(title: getTranslated('receivedTask', context)!,index: 1),
                ],
              ),
            ),
            Expanded(child: selectedTabBar==0?
            createTaskWidget():recentTaskWidget()
            )
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          RoutesHelper.pushCupertinoNavigation(const CreateTaskScreen());
        },
        child: Container(
          height: 54,width: 54,
          decoration:const BoxDecoration(
            color: ColorHelper.pinkColor,
            shape: BoxShape.circle
          ),
          alignment: Alignment.center,
          child: Image.asset(ImageHelper.plusIcon,height: 23,),
        ),
      ),
    );
  }

  tabBar({required String title, required int index}){
    return InkWell(
      onTap: (){
        selectedTabBar=index;
        setState(() {
        });
      },
      child: Container(
        height: 25,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color:selectedTabBar==index? ColorHelper.pinkColor:ColorHelper.appTheme
            )
          )
        ),
        child: CustomText(title: title,fontsize: 16,fontFamily: FontfamilyHelper.interMedium,),
      ),
    );
  }

createTaskWidget(){
  return ListView.separated(
    separatorBuilder: (context,sp){
    return ScreenSize.height(35);
  },
    itemCount: 4,
    shrinkWrap: true,
    padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
    itemBuilder: (context,index){
      return const TaskWidget();
  });
}

recentTaskWidget(){
return ListView.separated(
  separatorBuilder: (context,sp){
    return ScreenSize.height(35);
  },
    itemCount: 3,
    shrinkWrap: true,
    padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
    itemBuilder: (context,index){
      return const TaskWidget();
  });
}
}