import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../consts/app_consts.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

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
          text: "Edit Profile",
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          fontColor: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30..h),
            SizedBox(
              width: 140.w,
              child: Stack(
                children: [
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.2),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 90.r,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Positioned(
                    top: 33.h,
                    left: 83.w,
                    child: CircleAvatar(
                      radius: 16.r,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 14.r,
                        child: Image.asset(
                          "assets/images/C.png",
                          height: 16.h,
                          width: 16.w,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30.h),
            CustomText(
              text: "Enter Your Name",
              fontSize: 14.sp,
              fontColor: Colors.black.withOpacity(0.6),
            ),
            SizedBox(height: 10.h),
            CustomCard(
                height: 45.h,
                width: double.maxFinite,
                cardColor: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 3, spreadRadius: 0.1)],
                cardChild: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 23.w),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/123.png",
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(width: 10.w),
                        Flexible(
                          child: TextField(
                            controller: TextEditingController(),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Enter Your Name",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            SizedBox(height: 20.h),
            CustomText(
              text: "Enter Your Email",
              fontSize: 14.sp,
              fontColor: Colors.black.withOpacity(0.6),
            ),
            SizedBox(height: 10.h),
            CustomCard(
              height: 45.h,
              width: double.maxFinite,
              cardColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 3, spreadRadius: 0.1)],
              cardChild: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 23.w),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/e.png",
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 10.w),
                      Flexible(
                        child: TextField(
                          controller: TextEditingController(),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Email",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Enter Your Date of birth",
              fontSize: 14.sp,
              fontColor: Colors.black.withOpacity(0.6),
            ),
            SizedBox(height: 10.h),
            CustomCard(
              height: 45.h,
              width: double.maxFinite,
              cardColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 3, spreadRadius: 0.1)],
              cardChild: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 23.w),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/ec.png",
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 10.w),
                      Flexible(
                        child: TextField(
                          controller: TextEditingController(),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Date of Birth",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Write Something about you",
              fontSize: 14.sp,
              fontColor: Colors.black.withOpacity(0.6),
            ),
            SizedBox(height: 10.h),
            CustomCard(
              height: 141.h,
              width: double.maxFinite,
              cardColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 3, spreadRadius: 0.1)],
              cardChild: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: TextField(
                  maxLines: null,
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            CustomCard(
              height: 45.h,
              width: double.maxFinite,
              cardColor: AppColors().mainColor2,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 3, spreadRadius: 0.1)],
              cardChild: Center(
                child: CustomText(
                  text: "Submit",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.h)
          ],
        ),
      ),
    );
  }
}
