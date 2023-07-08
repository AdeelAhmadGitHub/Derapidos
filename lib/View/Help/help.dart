import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../consts/app_consts.dart';
import '../Custom Widget/button.dart';
import '../Custom Widget/custom_text.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF8F8F8F4),
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Image.asset(
          "assets/images/logo1.png",
          height: 43.h,
          width: 150.w,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors().mainColor2,
        toolbarHeight: 40.h,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 40).r,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 10,
                ).r,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xff444444),
                      ),
                      iconSize: 16,
                      onPressed: () {
                        // Get.off(const SigninScreen());
                        Get.back();
                      },
                    ),
                    CustomText(
                      text: "Help",
                      fontColor: const Color(0xff444444),
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80).r,
                child: Center(
                  child: Container(
                    child: Image.asset(
                      "assets/images/help.png",
                      height: 242.h,
                      width: 175.w,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "We’re happy to Help You!",
                    fontColor: AppColors().mainColor2,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              CustomText(
                textAlign: TextAlign.center,
                text: "If you have complain about the\nproduct contact us",
                fontColor: const Color(0xffC0C0C0),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30).r,
                child: MyCustomButton(
                  onPressed: () {},
                  height: 45.h,
                  width: 315.w,
                  buttonColor: const Color(0xffEC2547),
                  text: "Contact Us",
                  textColor: const Color(0xffFFFFFF),
                  fontSize: 14.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
