import 'dart:io';

import 'package:derapidos/View/Custom%20Widget/button.dart';
import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/View/Rating&Reviews/send_review_screen.dart';
import 'package:derapidos/controllers/orders_controller.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../consts/app_consts.dart';

class AddReview extends StatefulWidget {
  const AddReview({Key? key}) : super(key: key);

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  @override
  Widget build(BuildContext context) {
    return GetX<OrdersController>(
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                //width: 00.w,
                height: 400.h,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34.0.r),
                      topRight: Radius.circular(34.0.r),
                    ),
                  ),
                  color: const Color(0xffFBFBFB),
                  child: Column(
                    //
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10.h),
                      Container(
                        height: 6.h,
                        width: 60.w,
                        color: const Color(0xffC0C0C0),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomText(
                        text: "What is you rate?",
                        fontColor: const Color(0xff444444),
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: 20,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.only(left: 12, right: 12).r,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star, //_border,
                              color: Colors.amber, // Color(0xffC0C0C0),
                              size: 20,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              controller.review!.rating = rating.toString();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomText(
                        textAlign: TextAlign.center,
                        text: "Please share your opinion \n about the Restaurant",
                        fontColor: const Color(0xff444444),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30).r,
                        child: Container(
                          height: 100.h,
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
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              minLines: 2,
                              maxLines: 9,
                              keyboardType: TextInputType.multiline,
                              cursorColor: const Color(0xffC0C0C0),
                              decoration: const InputDecoration(
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
                                  fontFamily: "DMSans",
                                  fontSize: 14,
                                  letterSpacing: -0.15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onChanged: (value) {
                                controller.review!.review = value;
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 30).r,
                            //   child: Image.asset(
                            //     "assets/images/photo_ratting.png",
                            //     height: 103.h,
                            //     width: 104.w,
                            //     fit: BoxFit.fill,
                            //   ),
                            // ),
                            // SizedBox(width: 10.w),
                            for (int i = 0; i < controller.review!.reviewPhotos!.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  height: 90.h,
                                  width: 104.w,
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
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(
                                        File(controller.review!.reviewPhotos![i]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Container(
                              height: 90.h,
                              width: 104.w,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 10.h),
                                  Container(
                                    height: 52.h,
                                    width: 52.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      color: AppColors().mainColor2,
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.camera_alt_outlined),
                                      color: Colors.white,
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                            context: context,
                                            builder: ((builder) => bottomsheet(controller)));
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomText(
                                    text: "Add photos",
                                    fontColor: const Color(0xff444444),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      controller.addReviewLoading.value
                          ? const CircularProgressIndicator()
                          : Padding(
                              padding: const EdgeInsets.only(left: 30, right: 30).r,
                              child: MyCustomButton(
                                onPressed: () async {
                                  // Get.to(const SendReviewScreen());
                                  var check = await controller.addReview();
                                  if (check!) {
                                    showSnackBar(context, "Review added Successfully");

                                    Get.back();
                                  } else {
                                    showSnackBar(context, "Operation Failed");
                                  }
                                },
                                height: 30.h,
                                width: 315.w,
                                buttonColor: const Color(0xffEC2547),
                                text: "Send Review",
                                textColor: const Color(0xffFFFFFF),
                                fontSize: 14.sp,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // takephoto(ImageSource source) async {
  //   var _picker = ImagePicker();
  //   final pickedFile = await _picker.pickMultiImage(
  //       // source: source,
  //       );
  //   setState(() {
  //     var _imageFile = pickedFile;
  //   });
  // }

  bottomsheet(OrdersController controller) {
    return Container(
      color: Colors.white,
      height: 100.h,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0).r,
      child: Column(
        children: [
          CustomText(
            text: "Choose photo",
            fontColor: const Color(0xff444444),
            fontWeight: FontWeight.w400,
            fontSize: 24.sp,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.camera,
                  color: Color(0xffC0C0C0),
                  size: 30,
                ),
                onPressed: () async {
                  await controller.pickPhotos();
                  Get.back();
                },
                label: Text(
                  "Camera",
                  style: TextStyle(
                    color: const Color(0xff444444),
                    fontSize: 14.sp,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.white,
                  primary: Colors.white,
                  elevation: 0,
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.image,
                  color: Color(0xffC0C0C0),
                  size: 30,
                ),
                onPressed: () async {
                  await controller.pickPhotos();
                  Get.back();
                },
                label: Text(
                  "Gallery",
                  style: TextStyle(
                    color: const Color(0xff444444),
                    fontSize: 10.sp,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.white,
                  primary: Colors.white,
                  elevation: 0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
