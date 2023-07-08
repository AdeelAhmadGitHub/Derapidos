import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/controllers/r_s_controller/home_controller.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../component/custom_card.dart';
import '../../../consts/app_consts.dart';
import '../../../models/real_estate_models/filter_model.dart';

class RSAddDetailScreen extends StatefulWidget {
  const RSAddDetailScreen({Key? key}) : super(key: key);

  @override
  State<RSAddDetailScreen> createState() => _RSAddDetailScreenState();
}

List<String> images = [
  "assets/images/9.png",
];
int _current = 0;
int isSelect = 0;

class _RSAddDetailScreenState extends State<RSAddDetailScreen> {



  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => SizedBox(
                    height: 279..h,
                    width: double.maxFinite,
                    child: Image.asset(
                      images[itemIndex],
                      fit: BoxFit.fill,
                    ),
                  ),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    aspectRatio: 375 / 279,
                    initialPage: 2,
                    onPageChanged: (index, _) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24..w, vertical: 58..h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20.r,
                        ),
                      ),
                      CircleAvatar(
                        radius: 15.r,
                        backgroundColor: const Color(0xff2F3571),
                        child: CircleAvatar(
                          radius: 13.r,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              "assets/images/X.png",
                              color: AppColors().mainColor2,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 238..h, left: 26.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 15.h),
                      Row(
                        children: images.map(
                          (image) {
                            int index = images.indexOf(image);
                            return _current == index
                                ? Container(
                                    width: 19.0..w,
                                    height: 19.0..h,
                                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: AppColors().mainColor2, width: 2.w),
                                    ),
                                    child: Center(
                                      child: Container(
                                          width: 8.0..w,
                                          height: 8.0..h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle, color: AppColors().mainColor2)),
                                    ),
                                  )
                                : Container(
                                    width: 8.0..w,
                                    height: 8.0..h,
                                    decoration:
                                        const BoxDecoration(shape: BoxShape.circle, color: Color(0xffC0C0C0)),
                                  );
                          },
                        ).toList(),
                      ),
                      CustomCard(
                        height: 21.h,
                        width: 59.w,
                        cardColor: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        cardChild: Center(
                          child: CustomText(
                            text: "Sale",
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            fontColor: Color(0xffD80027),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10..h),
                  CustomText(
                    text: "Luxary Family House",
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                  ),
                  SizedBox(height: 8..h),
                  CustomText(
                    text: "\$\$ 25,000",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                  SizedBox(height: 8..h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      CustomText(
                        text: "24 street 5 New Youk, USA",
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        fontColor: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xffE5E5E5)),
                  SizedBox(height: 10..h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/bed 1.png",
                            height: 25..h,
                            width: 28..w,
                          ),
                          SizedBox(height: 10..h),
                          CustomText(
                            text: "4 Beds",
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/2.png",
                            height: 25..h,
                            width: 28..w,
                          ),
                          SizedBox(height: 10..h),
                          CustomText(
                            text: "3 Baths",
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/1.png",
                            height: 25..h,
                            width: 28..w,
                          ),
                          SizedBox(height: 10..h),
                          CustomText(
                            text: "1200",
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xffE5E5E5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Area unit",
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                      CustomText(
                        text: "Meter Yards",
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        fontColor: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xffE5E5E5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Furnished",
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                      CustomText(
                        text: "UnFurnished",
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        fontColor: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xffE5E5E5)),
                  CustomText(
                    text: "Features",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                  SizedBox(height: 10..h),
                  Wrap(
                    // direction: Axis.horizontal,
                    spacing: 10..w, runSpacing: 5..h,
                    children: List.generate(
                      filterModel.length,
                      (index) => CustomCard(
                        cardColor: Colors.white,
                        border: Border.all(color: Color(0xff9098B1), width: 2),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: .7,
                            blurRadius: 1.5,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50..r),
                        cardChild: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                          child: CustomText(
                            text: filterModel[index].text,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontColor: const Color(0xff9098B1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(color: Color(0xffE5E5E5)),
                  CustomText(
                    text: "Brief Description",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                  SizedBox(height: 10..h),
                  CustomText(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500sLorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontColor: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(height: 10..h),
                  CustomText(
                    text: "Search on Map",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                  SizedBox(
                    height: 185.h,
                    width: double.maxFinite,
                    child: Image.asset("assets/images/maps.PNG"),
                  ),
                  SizedBox(height: 20..h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Posted By",
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                      CustomText(
                        text: "13 feb 2023",
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        fontColor: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  SizedBox(height: 10..h),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Color(0xffE5E5E5),
                        child: Icon(
                          Icons.person,
                          size: 55..r,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(width: 20..w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Micheal john",
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                          SizedBox(height: 5..h),
                          CustomText(
                            text: "Member since March 2022",
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20..h),
                  CustomCard(
                    height: 84..h,
                    width: double.maxFinite,
                    cardChild: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCard(
                          height: 55..h,
                          width: 155..w,
                          cardColor: Colors.white,
                          border: Border.all(color: const Color(0xff34A00C)),
                          borderRadius: BorderRadius.circular(10),
                          cardChild: Center(
                            child: CustomText(
                              text: "Edit",
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              fontColor: Color(0xff34A00C),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  insetPadding: EdgeInsets.symmetric(horizontal: 70.w),
                                  title: const Text("Are you sure you want to delete this AD?"),
                                  titleTextStyle: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16.sp),
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  content: GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(width: 5.w),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).pop();

                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    Future.delayed(const Duration(seconds: 2), () {
                                                      Navigator.of(context).pop();
                                                    });
                                                    return AlertDialog(
                                                      insetPadding: EdgeInsets.symmetric(horizontal: 70.w),
                                                      title: const Text(
                                                        "Your AD is deleted \nsuccessfully",
                                                        textAlign: TextAlign.center,
                                                      ),
                                                      titleTextStyle: TextStyle(
                                                          // fontWeight: FontWeight.bold,

                                                          color: Colors.black,
                                                          fontSize: 16.sp),
                                                      backgroundColor: Colors.white,
                                                      shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(
                                                          Radius.circular(20),
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: CustomText(
                                              text: "Yes",
                                              fontSize: 16.sp,
                                              fontColor: const Color(0xffD80027),
                                            ),
                                          ),
                                          CustomText(
                                            text: "No",
                                            fontSize: 16.sp,
                                            fontColor: const Color(0xff34A00C),
                                          ),
                                        ],
                                      )),
                                );
                              }),
                          child: CustomCard(
                            height: 55..h,
                            width: 155..w,
                            cardColor: Colors.white,
                            border: Border.all(color: const Color(0xffD80027)),
                            borderRadius: BorderRadius.circular(10),
                            cardChild: Center(
                              child: CustomText(
                                text: "Delete",
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp,
                                fontColor: const Color(0xffD80027),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h)
          ],
        ),
      ),
    );
  }
}
