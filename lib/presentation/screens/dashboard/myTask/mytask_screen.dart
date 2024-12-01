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
      return taskWidget();
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
      return taskWidget();
  });
}

  taskWidget(){
    return Container(
      decoration: BoxDecoration(
        color: ColorHelper.whiteColor,
        borderRadius: BorderRadius.circular(10)
      ),
      padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset("assets/dummy/Mask group.png",height: 28),
              ScreenSize.width(6),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: "Jack Henry",
                  fontsize: 12,color: ColorHelper.appTheme,fontFamily: FontfamilyHelper.interBold,
                  ),
                  ScreenSize.height(3),
                  CustomText(title: "15 min",
                  fontsize: 7,color: ColorHelper.appTheme,fontFamily: FontfamilyHelper.interMedium,
                  ),
                ],
              )),
             const Icon(Icons.favorite,
              color: ColorHelper.pinkColor,
              size: 22,
              ),
              ScreenSize.width(10),
              Image.asset(ImageHelper.commentIcon,height: 16,),
              ScreenSize.width(10),
              Image.asset(ImageHelper.shareIcon,height: 16,),
            ],
          ),
          ScreenSize.height(20),
          CustomText(title: 'You need to perform 5 exercise today ',
          fontsize: 15,color: ColorHelper.appTheme,fontFamily: FontfamilyHelper.interBold,
          ),
          ScreenSize.height(6),
          CustomText(title: 'Bench press, Dumbble flyes, Cable crossover, Machine Fly, Wide Pushup.',
          fontsize: 9,color: ColorHelper.appTheme.withOpacity(.8),
          ),
          ScreenSize.height(15),
          Image.asset('assets/dummy/gym.png'),
          ScreenSize.height(15),
          Row(
            children: [
              Stack(
                children: [
                  Image.asset('assets/dummy/Mask group.png',height: 22,),
                   Padding(padding:const EdgeInsets.only(left: 10),
                   child: Image.asset('assets/dummy/Mask group (2).png',height: 22,),
                   ),
                   Padding(padding:const EdgeInsets.only(left: 20),
                   child: Image.asset('assets/dummy/Mask group (1).png',height: 22,),
                   )
                ],
              ),
              ScreenSize.width(6),
              CustomText(title: '25+ participants',
              fontsize: 10,color: ColorHelper.appTheme,fontFamily: FontfamilyHelper.interSemiBold,
              ),
              const Spacer(),
              btn()
            ],
          )
        ],
      ),
    );
  }
  btn(){
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ColorHelper.pinkColor,
      ),
      alignment: Alignment.center,
      child: CustomText(title: "Completed",
      fontsize: 10,
      color: ColorHelper.whiteColor,fontFamily: FontfamilyHelper.interSemiBold,
      ),
    );
  }
}