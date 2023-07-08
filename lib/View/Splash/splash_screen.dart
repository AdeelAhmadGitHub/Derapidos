import 'dart:async';
import 'dart:convert';

import 'package:derapidos/View/NavigationBar/navigationbar_screen.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Onboarding/onboarding_screen.dart';
import '../home_main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    goToNextScreen();
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (_) => const OnboardingScreen()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // height: 61.h,
          width: double.infinity.w,
          // padding: const EdgeInsets.all(20).r,
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(200),
            image: DecorationImage(
              image: AssetImage(
                "assets/images/logo1.png",
              ),
            ),
          ),
          // child: Image.asset(
          //   "images/tech.jpg",
          //   height: 210.h,
          //   width: 202.w,
          // ),
        ),
      ),
    );
  }

  goToNextScreen() {
    bool? isLogin = UserPreferences.getLoginCheck() ?? false;
    var splashDuration = const Duration(seconds: 5);
    Timer(splashDuration, () {
      if (isLogin) Get.off(MainScreen());
      if (!isLogin) Get.off(const OnboardingScreen());
    });
  }
}
