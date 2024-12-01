import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';
import 'package:sheero/core/utils/image_helper.dart';

import '../../core/utils/color_helper.dart';

// ignore: must_be_immutable
class CustomSearchbar extends StatelessWidget {
  ValueChanged<String>? onChanged;
  final String hintText;
   CustomSearchbar({this.onChanged,this.hintText='Search'});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      padding:const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: ColorHelper.whiteColor,
        border: Border.all(color: ColorHelper.whiteColor,width: 0.5),
        borderRadius: BorderRadius.circular(12)
      ),
      child: TextFormField(
        inputFormatters: [
          //  FilteringTextInputFormatter.deny(RegExp(ValidationHelper.regexToRemoveEmoji)),
        ],
        style:const TextStyle(
          fontSize: 13,
          color: ColorHelper.appTheme,fontFamily: FontfamilyHelper.interMedium
        ),
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: FontfamilyHelper.interRegular,
            fontSize: 13,color: ColorHelper.appTheme
          ),
          border: InputBorder.none,
          prefixIconConstraints:const  BoxConstraints(
            minWidth: 30,
            minHeight: 6,
          ),
          prefixIcon: SizedBox(
            child: Image.asset(ImageHelper.searchIcon,height: 15,),
          )
        ),
        onChanged: onChanged,
      ),
    );
  }
}