  import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/presentation/widget/custom_text.dart';

AppBar appBar({required BuildContext context,bool isLeading=true, required String title, List<Widget>?actions,}){
  return  AppBar(
        automaticallyImplyLeading: false,
        leading:isLeading? InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_outlined,color: ColorHelper.whiteColor,)):const SizedBox.shrink(),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorHelper.appTheme,
        scrolledUnderElevation: 0.0,
        title: CustomText(title: title,fontsize: 20,fontFamily: FontfamilyHelper.interMedium,),
        actions: actions,
      );
}