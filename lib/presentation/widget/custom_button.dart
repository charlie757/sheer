import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String title;
  Function()?onTap;
  Color color;
   double height;
   double? width;
   bool isLoading;
   bool isBorder;
   String img;
   CustomButton({required this.title,this.onTap, this.color = ColorHelper.pinkColor,
   this.height =50.0,this.width ,this.isLoading=false,this.isBorder=false,this.img=''
   });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isLoading?color.withOpacity(.4): 
       isBorder?ColorHelper.appTheme: color,
        disabledBackgroundColor:isBorder?ColorHelper.appTheme: color,
        fixedSize: Size(width??MediaQuery.sizeOf(context).width, height),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color:isBorder||color==ColorHelper.whiteColor? ColorHelper.whiteColor:ColorHelper.pinkColor
          ),
          borderRadius: BorderRadius.circular(20)
        )
      ),
      onPressed: onTap,
     child:isLoading?
    const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        backgroundColor: ColorHelper.whiteColor,
      strokeWidth: 2,
     ),
     ):
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          img.isNotEmpty?
          Padding(padding:const EdgeInsets.only(right: 10),
          child: Image.asset(img,height: 22,),
          ):const SizedBox.shrink(),
          CustomText(title: title,
          color:color==ColorHelper.whiteColor?ColorHelper.appTheme: ColorHelper.whiteColor,
          fontFamily: FontfamilyHelper.interBold,
          fontsize: 17
              ),
        ],
      ));
  }
}