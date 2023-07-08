import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/app_consts.dart';
import '../Custom Widget/custom_text.dart';

class RattingReviewsWithphoto extends StatefulWidget {
  const RattingReviewsWithphoto({Key? key}) : super(key: key);

  @override
  State<RattingReviewsWithphoto> createState() => _RattingReviewsWithphotoState();
}

class _RattingReviewsWithphotoState extends State<RattingReviewsWithphoto> {
  bool isSelected = false;
  var _isloading = false;
  bool _isObscure = true;
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, right: 20.0).r,
        child: FloatingActionButton.extended(
          // extendedPadding: EdgeInsets.only(right: 30),
          onPressed: () {
            showCustomDialog(context);
          },
          icon: Image.asset(
            'assets/images/review_icon.png',
            width: 24.w,
            height: 24.h,
          ),
          label: Text(
            "Write a review",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontFamily: 'DMSans',
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Color(0xffEC2547),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 30).r,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xff444444),
                            ),
                            iconSize: 13,
                            onPressed: () {
                              // Get.off(const SigninScreen());
                              Get.back();
                            },
                          ),
                          CustomText(
                            text: "Rating & Reviews",
                            fontColor: Color(0xff444444),
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30).r,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              CustomText(
                                text: "4.8",
                                fontColor: Color(0xff444444),
                                fontWeight: FontWeight.w500,
                                fontSize: 44.sp,
                              ),
                              CustomText(
                                text: "40 ratings",
                                fontColor: Color(0xffC0C0C0),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RatingBar.builder(
                                  initialRating: 5,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemSize: 13,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Color(0xffFFBA49),
                                    size: 12,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                RatingBar.builder(
                                  initialRating: 4,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemSize: 13,
                                  itemCount: 4,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Color(0xffFFBA49),
                                    size: 12,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemSize: 13,
                                  itemCount: 3,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Color(0xffFFBA49),
                                    size: 12,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                RatingBar.builder(
                                  initialRating: 2,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemSize: 13,
                                  itemCount: 2,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Color(0xffFFBA49),
                                    size: 12,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                RatingBar.builder(
                                  initialRating: 1,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 1,
                                  itemSize: 13,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Color(0xffFFBA49),
                                    size: 12,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 11.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 8.h,
                                width: 114.w,
                                decoration: BoxDecoration(
                                    color: Color(0xffEC2547), borderRadius: BorderRadius.circular(4.r)),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Container(
                                height: 8.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    color: Color(0xffEC2547), borderRadius: BorderRadius.circular(4.r)),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Container(
                                height: 8.h,
                                width: 29.w,
                                decoration: BoxDecoration(
                                    color: Color(0xffEC2547), borderRadius: BorderRadius.circular(4.r)),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Container(
                                height: 8.h,
                                width: 15.w,
                                decoration: BoxDecoration(
                                    color: Color(0xffEC2547), borderRadius: BorderRadius.circular(4.r)),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Container(
                                height: 8.h,
                                width: 8.w,
                                decoration: BoxDecoration(
                                    color: Color(0xffEC2547), borderRadius: BorderRadius.circular(4.r)),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 63.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomText(
                                text: "12",
                                fontColor: Color(0xff444444),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              CustomText(
                                text: "5",
                                fontColor: Color(0xff444444),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              CustomText(
                                text: "4",
                                fontColor: Color(0xff444444),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              CustomText(
                                text: "2",
                                fontColor: Color(0xff444444),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              CustomText(
                                text: "0",
                                fontColor: Color(0xff444444),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "8 reviews",
                            fontColor: Color(0xff222222),
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                activeColor: AppColors().mainColor2,
                                side: BorderSide(
                                  color: Color(0xff222222),
                                  width: 1,
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
                                value: isSelected,
                                onChanged: (newValue) {
                                  setState(() {
                                    isSelected = newValue!;
                                  });
                                },
                              ),
                              CustomText(
                                text: "With photo",
                                fontColor: Color(0xff222222),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      child: Container(
                        padding: EdgeInsets.only(left: 30, right: 30).r,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: Color(0xfffFFFFFF),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0.r),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 5.0,
                                      color: Color(0xffE5E5E5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.asset("assets/images/rating_photo.png"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18, right: 18).r,
                                      child: CustomText(
                                        text: "Helene Moore",
                                        fontColor: Color(0xff000000),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18, right: 18).r,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          RatingBar.builder(
                                            initialRating: 4,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemSize: 13,
                                            itemCount: 4,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Color(0xffFFBA49),
                                              size: 12,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          CustomText(
                                            text: "June 5, 2019",
                                            fontColor: Color(0xffC0C0C0),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const TextField(
                                      minLines: 2,
                                      maxLines: 9,
                                      keyboardType: TextInputType.multiline,
                                      cursorColor: Color(0xffC0C0C0),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintMaxLines: 9,
                                        floatingLabelAlignment: FloatingLabelAlignment.start,
                                        contentPadding: EdgeInsets.fromLTRB(18.0, 11.0, 18.0, 11.0),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText:
                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, ",
                                        hintStyle: TextStyle(
                                          color: Color(0xff444444),
                                          fontFamily: "DMSans",
                                          fontSize: 14,
                                          letterSpacing: -0.15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // padding: const EdgeInsets.only(left: 15),
                                      height: 104.h,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 10,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Card(
                                            child: Container(
                                              height: 104.h,
                                              width: 104.w,
                                              padding: const EdgeInsets.all(8.0).r,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(5.r),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 0),
                                                    blurRadius: 5.0,
                                                    color: Color(0xffE5E5E5),
                                                  ),
                                                ],
                                              ),
                                              child: Image.asset(
                                                "assets/images/image 2.png",
                                                height: 113.h,
                                                width: 214.w,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18).r,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CustomText(
                                            text: "Helpful",
                                            fontColor: Color(0xffC0C0C0),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.sp,
                                          ),
                                          Icon(
                                            Icons.thumb_up_alt,
                                            color: Color(0xffDADADA),
                                            size: 13,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> showCustomDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        var rating = 3.0;
        return Dialog(
          insetPadding: EdgeInsets.only(left: 0, right: 0, top: 175, bottom: 0).r,
          backgroundColor: Colors.transparent,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                child: Container(
                  width: 500.w,
                  height: 500.h,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34.0.r),
                        topRight: Radius.circular(34.0.r),
                      ),
                    ),
                    color: Color(0xffFBFBFB),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            height: 6.h,
                            width: 60.w,
                            color: Color(0xffC0C0C0),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomText(
                            text: "What is you rate?",
                            fontColor: Color(0xff444444),
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          RatingBar.builder(
                            initialRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: 13,
                            itemCount: 5,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color(0xffFFBA49),
                              size: 12,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          CustomText(
                            textAlign: TextAlign.center,
                            text: "Please share your opinion \n about the product",
                            fontColor: Color(0xff444444),
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30).r,
                            child: Container(
                              height: 150.h,
                              width: 315.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.0.r),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 5.0,
                                    color: Color(0xffE5E5E5),
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: TextField(
                                  minLines: 2,
                                  maxLines: 9,
                                  keyboardType: TextInputType.multiline,
                                  cursorColor: Color(0xffC0C0C0),
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintMaxLines: 9,
                                    floatingLabelAlignment: FloatingLabelAlignment.start,
                                    //  contentPadding: EdgeInsets.fromLTRB(18.0, 11.0, 18.0, 11.0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: " Your review",
                                    hintStyle: TextStyle(
                                      color: Color(0xffC0C0C0),
                                      fontFamily: "GraphikRegular",
                                      fontSize: 14,
                                      letterSpacing: -0.15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
          // child: Container(
          //   child: Image.asset(
          //     'images/check_logo.png',
          //     height: 70.h,
          //     width: 70,
          //   ),
          // ),
        );
      });
}
