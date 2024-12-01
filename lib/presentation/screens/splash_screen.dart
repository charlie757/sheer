import 'package:flutter/material.dart';
import 'package:sheero/core/utils/image_helper.dart';
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/presentation/screens/select_language_screen.dart';
import 'package:sheero/core/utils/color_helper.dart';
// 
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      RoutesHelper.pushReplacementNavigation(const SelectLanguageScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.whiteColor,
      body: Center(
        child: Image.asset(ImageHelper.splash),
      ),
    );
  }
}