import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/View/home_main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../consts/app_consts.dart';
import '../Custom Widget/button.dart';
import '../Custom Widget/custom_text.dart';
import '../SignUp/sign_up_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<PageViewModel> getPage() {
    return [
      PageViewModel(
        decoration: const PageDecoration(safeArea: 0, imageFlex: 2),
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "We Deliver in due ",
              fontColor: const Color(0xff444444),
              fontSize: 25.sp,
              fontWeight: FontWeight.w700,
            ),
            CustomText(
              text: "time!",
              fontColor: const Color(0xffFDBD01),
              fontSize: 25.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        image: SizedBox(
          // height: 381.h,
          // width: 273.w,
          child: Image.asset(
            "assets/images/onboarding3.png",
            // fit: BoxFit.fill,
          ),
        ),
        bodyWidget: Container(
          height: 72.h,
          width: 272.w,
          child: CustomText(
            text:
                "Derapidos is an online food and grocery delivery platform owned by Derapoios Delivery",
            fontColor: const Color(0xffAEAEAE),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ),
        footer: GestureDetector(
          onTap: () {
            Get.to(MainScreen());
            // Get.to(PageViewModel());
          },
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 45.h,
              width: 54.w,
              decoration: BoxDecoration(
                color: AppColors().mainColor2,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 30.0,
                    spreadRadius: 10.0,
                    color: const Color(0xffFE7A4D).withOpacity(0.30),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  FontAwesomeIcons.arrowRight,
                  size: 30.r,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      PageViewModel(
        decoration: const PageDecoration(safeArea: 0, imageFlex: 2),
        image: Image.asset(
          "assets/images/onboarding2.png",
          height: 135.h,
          width: 295.w,
          fit: BoxFit.contain,
        ),
        titleWidget: CustomText(
          text: "Fast Service",
          fontColor: Color(0xffEC2547),
          fontSize: 32.sp,
          fontWeight: FontWeight.w500,
        ),
        bodyWidget: CustomText(
          text:
              "Watch world-class instructors share their \n stories, skills, and everyday wisdom to \n inspire you.",
          fontColor: Color(0xffC0C0C0),
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
        footer: GestureDetector(
          onTap: () {
            Get.to(MainScreen());
            // Get.to(PageViewModel());
          },
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 45.h,
              width: 54.w,
              decoration: BoxDecoration(
                color: AppColors().mainColor2,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 30.0,
                    spreadRadius: 10.0,
                    color: const Color(0xffFE7A4D).withOpacity(0.30),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  FontAwesomeIcons.arrowRight,
                  size: 30.r,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      PageViewModel(
        decoration: const PageDecoration(safeArea: 0, imageFlex: 2),
        image: Image.asset("assets/images/onboarding1.png", height: 204.h, width: 295.w),
        titleWidget: CustomText(
          text: "Door Step Delivery",
          fontColor: Color(0xffEC2547),
          fontSize: 32.sp,
          fontWeight: FontWeight.w500,
        ),
        bodyWidget: CustomText(
          text:
              "Watch world-class instructors share \n stories, skills, and everyday wisdom to \n inspire you.",
          fontColor: Color(0xffC0C0C0),
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
        footer: GestureDetector(
          onTap: () {
            Get.to(MainScreen());
            // Get.to(PageViewModel());
          },
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 45.h,
              width: 54.w,
              decoration: BoxDecoration(
                color: AppColors().mainColor2,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 30.0,
                    spreadRadius: 10.0,
                    color: const Color(0xffFE7A4D).withOpacity(0.30),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  FontAwesomeIcons.arrowRight,
                  size: 35.r,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          bodyPadding: EdgeInsets.only(top: 80),
          globalBackgroundColor: Colors.white,
          pages: getPage(),
          done: Text(""),
          onDone: () {},
          showNextButton: false,
          curve: Curves.easeInOutCirc,
          dotsDecorator: const DotsDecorator(
            size: Size(5, 5),
            color: Color(0xffC0C0C0),
            activeSize: Size(9, 9),
            activeColor: Color(0xffEC2547),
            activeShape: CircleBorder(),
            // activeShape:
          ),
        ),
      ),
    );
  }
}
