import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../consts/app_consts.dart';
import '../Custom Widget/custom_text.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
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
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              top: 20,
            ),
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
                          Icons.close,
                          color: Color(0xff444444),
                        ),
                        iconSize: 16,
                        onPressed: () {
                          // Get.off(const SigninScreen());
                          Get.back();
                        },
                      ),
                      CustomText(
                        text: "Reviews",
                        fontColor: const Color(0xff444444),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 30).r,
                      height: 79.h,
                      width: 315.w,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5.0,
                            color: Color(0xffE5E5E5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 56.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xffEC2547),
                                width: 1.0,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 50.r,
                              backgroundImage: const ExactAssetImage(
                                "assets/images/gustavo_lubin.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Gustavo Lubin",
                                fontColor: const Color(0xff444444),
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              RatingBar.builder(
                                initialRating: 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemSize: 11,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                                itemBuilder: (context, _) {
                                  return const Icon(
                                    Icons.star,
                                    color: Color(0xffFFBA49),
                                    size: 12,
                                  );
                                },
                                onRatingUpdate: (rating) {
                                  dprint(rating);
                                },
                              ),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              CustomText(
                                text: "2345 reviews",
                                fontColor: const Color(0xffC0C0C0),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 30).r,
                      height: 118.h,
                      width: 315.w,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(5.r),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5.0,
                            color: Color(0xffE5E5E5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "How was the driver?",
                            fontColor: const Color(0xff444444),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                          SizedBox(
                            height: 5.0.h,
                          ),
                          CustomText(
                            text: "Help us improve our service and your\n experience by your rating",
                            textAlign: TextAlign.center,
                            fontColor: const Color(0xffC0C0C0),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                          SizedBox(
                            height: 5.0.h,
                          ),
                          RatingBar.builder(
                            initialRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: 28,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                            itemBuilder: (context, _) {
                              return const Icon(
                                Icons.star,
                                color: Color(0xffC0C0C0),
                                size: 28,
                              );
                            },
                            onRatingUpdate: (rating) {
                              dprint(rating);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 45.h,
                  width: 315.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0.r),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 5.0,
                        color: Color(0xffE5E5E5),
                      ),
                    ],
                  ),
                  child: TextField(
                    cursorColor: const Color(0xffC0C0C0),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0).r,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5.0.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(5.0.r)),
                      hintText: "Write a Comment",
                      hintStyle: const TextStyle(
                        color: Color(0xffC0C0C0),
                        fontFamily: 'GraphikRegular',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 30).r,
                      height: 79.h,
                      width: 315.w,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(5.r),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5.0,
                            color: Color(0xffE5E5E5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 56.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xffEC2547),
                                width: 1.0,
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage: ExactAssetImage(
                                "assets/images/burggerking.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Burger King",
                                fontColor: const Color(0xff444444),
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              RatingBar.builder(
                                initialRating: 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemSize: 11,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Color(0xffFFBA49),
                                  size: 12,
                                ),
                                onRatingUpdate: (rating) {
                                  dprint(rating);
                                },
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              CustomText(
                                text: "2345 reviews",
                                fontColor: const Color(0xffC0C0C0),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 30).r,
                      height: 118.h,
                      width: 315.w,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(5.r),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5.0,
                            color: Color(0xffE5E5E5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "How was the Food?",
                            fontColor: const Color(0xff444444),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                          SizedBox(
                            height: 5.0.h,
                          ),
                          CustomText(
                            text: "Help us improve our service and your\n experience by your rating",
                            textAlign: TextAlign.center,
                            fontColor: const Color(0xffC0C0C0),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                          SizedBox(
                            height: 5.0.h,
                          ),
                          RatingBar.builder(
                            initialRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: 28,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Color(0xffC0C0C0),
                              size: 28,
                            ),
                            onRatingUpdate: (rating) {
                              dprint(rating);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 45.h,
                  width: 315.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0.r),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 5.0,
                        color: Color(0xffE5E5E5),
                      ),
                    ],
                  ),
                  child: TextField(
                    cursorColor: const Color(0xffC0C0C0),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0).r,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5.0.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(5.0.r)),
                      hintText: "Write a Comment",
                      hintStyle: const TextStyle(
                        color: Color(0xffC0C0C0),
                        fontFamily: 'GraphikRegular',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
