import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../consts/app_consts.dart';
import '../add_property/add_property_screen.dart';

class ChooseCategoryScreen extends StatelessWidget {
  const ChooseCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: CustomText(
          text: "Choose Category",
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          fontColor: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10..w),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30..h),
            InkWell(
              onTap: () => Get.back(result: ["assets/images/house.png", "House/Villa"]),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/house.png",
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(width: 20.w),
                  CustomText(
                    text: "House/Villa",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () => Get.back(result: ["assets/images/land.png", "Land & Plots"]),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/land.png",
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(width: 20.w),
                  CustomText(
                    text: "Land & Plots",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () => Get.back(result: ["assets/images/office.png", "Commercial"]),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/office.png",
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(width: 20.w),
                  CustomText(
                    text: "Commercial",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () => Get.back(result: ["assets/images/ap.png", "Apartment & Flats"]),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/ap.png",
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(width: 20.w),
                  CustomText(
                    text: "Apartment & Flats",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () => Get.back(result: ["assets/images/tile.png", "Portion & Floor"]),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/tile.png",
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(width: 20.w),
                  CustomText(
                    text: "Portion & Floor",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
