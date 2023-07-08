import 'package:derapidos/View/Delete_Reason/delete_reason.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/app_consts.dart';
import '../Custom Widget/custom_text.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.only(top: 50).r,
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
                      text: "Setting",
                      fontColor: const Color(0xff444444),
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15).r,
                  height: 45.h,
                  width: 315.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      const BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 5.0,
                        color: Color(0xffE5E5E5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Change Language",
                        fontColor: const Color(0xff9098B1),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: Color(0xffC0C0C0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const DeleteReasons());
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15).r,
                  height: 45.h,
                  width: 315.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 5.0,
                        color: Color(0xffE5E5E5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Delete Account",
                        fontColor: const Color(0xff9098B1),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: Color(0xffC0C0C0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15).r,
                  height: 45.h,
                  width: 315.w,
                  decoration: BoxDecoration(
                    color: const Color(0xfffFFFFFF),
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      const BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 5.0,
                        color: Color(0xffE5E5E5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Logout",
                        fontColor: const Color(0xff9098B1),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: Color(0xffC0C0C0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
