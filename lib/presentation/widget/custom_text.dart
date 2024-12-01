import 'package:flutter/material.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  final String title;
  double? fontsize;
  FontWeight? fontWeight;
  String? fontFamily;
  Color ?color;
  int? maxLines;
  TextAlign?textAlign;
  TextDecoration decoration;
   CustomText({required this.title,this.fontFamily = FontfamilyHelper.interRegular, this.fontWeight,this.fontsize,this.color = ColorHelper.whiteColor,this.
  maxLines,this.textAlign,this.decoration = TextDecoration.none});

  @override
  Widget build(BuildContext context) {
    return Text(title,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow:maxLines==null?null: TextOverflow.ellipsis,
    style: TextStyle(
      decoration: decoration,
      // decorationColor: ColorHelper.appTheme,
      fontSize: fontsize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      color: color
    ),
    );
  }
}