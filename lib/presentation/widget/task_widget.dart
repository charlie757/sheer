import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/core/utils/screen_size_helper.dart';
import 'package:sheero/localization/language_constraints.dart';
import 'package:sheero/presentation/screens/dashboard/myTask/comment_screen.dart';
import 'package:sheero/presentation/screens/dashboard/myTask/view_task_screen.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        RoutesHelper.pushCupertinoNavigation(const ViewTaskScreen());
      },
      child: Container(
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
                InkWell(
                  onTap: (){
                    RoutesHelper.pushCupertinoNavigation(const CommentScreen());
                  },
                  child: Image.asset(ImageHelper.commentIcon,height: 16,)),
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
                btn(context)
              ],
            )
          ],
        ),
      ),
    );
 
  }
   btn(BuildContext context){
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ColorHelper.pinkColor,
      ),
      alignment: Alignment.center,
      child: CustomText(title: getTranslated('completed', context)!,
      fontsize: 10,
      color: ColorHelper.whiteColor,fontFamily: FontfamilyHelper.interSemiBold,
      ),
    );
  }
}
