import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheero/core/utils/color_helper.dart';
import 'package:sheero/core/utils/fontfamily_helper.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool isReadOnly;
  final validator;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;
  Widget? suffixWidget;
  Widget? prefixWidget;
  FocusNode? focusNode;
  bool isObscureText;
  Function()? onTap;
  CustomTextfield(
      {this.controller,
      this.hintText,
      this.textInputType = TextInputType.text,
      this.inputFormatters,
      this.isReadOnly = false,
      this.textInputAction,
      this.validator,
      this.onChanged,
      this.suffixWidget,
      this.prefixWidget,
      this.textCapitalization = TextCapitalization.none,
      this.focusNode,
      this.onTap,
      this.isObscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: isReadOnly,
      obscureText: isObscureText,
      // cursorHeight: 20,
      cursorColor: ColorHelper.whiteColor,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      style:const TextStyle(
        fontSize: 14,
        color: ColorHelper.whiteColor,fontFamily: FontfamilyHelper.interMedium
      ),
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixWidget,
          prefixIcon: prefixWidget,
          isDense: true,
          suffixIconConstraints: const BoxConstraints(
            minWidth: 4,
            minHeight: 4,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 4,
            minHeight: 4,
          ),
          hintStyle:  TextStyle(
              fontSize: 12,
              color: ColorHelper.whiteColor.withOpacity(.5),
              fontFamily
              : FontfamilyHelper.interRegular),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorHelper.whiteColor)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorHelper.whiteColor)),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorHelper.redColor)),
          focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorHelper.redColor))),
      onChanged: onChanged,
      onTap: onTap,
      validator: validator,
    );
  }
}
