import 'package:derapidos/View/Rating&Reviews/add_review.dart';
import 'package:derapidos/View/Rating&Reviews/ratting_reviews_withphoto.dart';
import 'package:derapidos/controllers/orders_controller.dart';
import 'package:derapidos/models/customer_reviews.dart';
import 'package:derapidos/theme.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../consts/app_consts.dart';
import '../Custom Widget/custom_text.dart';

class RattingReviewsScreen extends StatefulWidget {
  const RattingReviewsScreen({Key? key}) : super(key: key);

  @override
  State<RattingReviewsScreen> createState() => _RattingReviewsScreenState();
}

class _RattingReviewsScreenState extends State<RattingReviewsScreen> {
  OrdersController ordersController = Get.find();

  bool isSelected = false;
  var _isloading = false;
  bool _isObscure = true;

  // File? _image;
  // Future _pickImage(ImageSource source) async {
  //   final image = await ImagePicker().pickImage(source: source);
  //   if (image ==null) return;
  //   File? img = File(image.path);
  //   setState(() {
  //     _image = img;
  //     Navigator.of(context).pop();
  //   });
  // }
  @override
  initState() {
    ordersController.getCustomerReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<OrdersController>(
      builder: (controller) {
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
              onPressed: () async {
                await showCustomDialog(context);
                await ordersController.getCustomerReviews();
              },
              icon: const Icon(Icons.edit),
              // icon: Image.asset(
              //   'assets/images/review_icon.png',
              //   width: 24.w,
              //   height: 24.h,
              // ),
              label: Text(
                "Write a review",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: AppTheme.appColor, // const Color(0xffEC2547),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0.r),
              ),
            ),
          ),
          body: SafeArea(
            child: controller.reviewLoading.value
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 15, right: 30).r,
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
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
                              Container(
                                padding: const EdgeInsets.only(left: 30, right: 30).r,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          CustomText(
                                            text: "${controller.averageRating}",
                                            // text: "4.8",
                                            fontColor: const Color(0xff444444),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 44.sp,
                                          ),
                                          CustomText(
                                            text:
                                                "${controller.customerReviews!.data!.reviews!.length} ratings",
                                            // text: "40 ratings",
                                            fontColor: const Color(0xffC0C0C0),
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
                                              itemBuilder: (context, _) => const Icon(
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
                                              itemBuilder: (context, _) => const Icon(
                                                Icons.star,
                                                color: Color(0xffFFBA49),
                                                size: 12,
                                              ),
                                              onRatingUpdate: (rating) {
                                                dprint(rating);
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
                                              itemBuilder: (context, _) => const Icon(
                                                Icons.star,
                                                color: Color(0xffFFBA49),
                                                size: 12,
                                              ),
                                              onRatingUpdate: (rating) {
                                                dprint(rating);
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
                                              itemBuilder: (context, _) => const Icon(
                                                Icons.star,
                                                color: Color(0xffFFBA49),
                                                size: 12,
                                              ),
                                              onRatingUpdate: (rating) {
                                                dprint(rating);
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
                                              itemBuilder: (context, _) => const Icon(
                                                Icons.star,
                                                color: Color(0xffFFBA49),
                                                size: 12,
                                              ),
                                              onRatingUpdate: (rating) {
                                                dprint(rating);
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
                                            width: 8.w +
                                                controller
                                                    .fiveWidth
                                                    // ((controller.fiveRatings *
                                                    //             100) /
                                                    //         controller
                                                    //             .customerReviews!
                                                    //             .data!
                                                    //             .reviews!
                                                    //             .length)
                                                    .w, // 114.w,
                                            decoration: BoxDecoration(
                                                color: AppColors().mainColor2,
                                                borderRadius: BorderRadius.circular(4.r)),
                                          ),
                                          SizedBox(
                                            height: 14.h,
                                          ),
                                          Container(
                                            height: 8.h,
                                            width: 8.w +
                                                controller
                                                    .fourWidth
                                                    // ((controller.fourRatings *
                                                    //             100) /
                                                    //         controller
                                                    //             .customerReviews!
                                                    //             .data!
                                                    //             .reviews!
                                                    //             .length)
                                                    .w, // width: 40.w,
                                            decoration: BoxDecoration(
                                                color: AppColors().mainColor2,
                                                borderRadius: BorderRadius.circular(4.r)),
                                          ),
                                          SizedBox(
                                            height: 14.h,
                                          ),
                                          Container(
                                            height: 8.h,
                                            width: 8.w +
                                                controller
                                                    .threeWidth
                                                    // ((controller.threeRatings *
                                                    //             100) /
                                                    //         controller
                                                    //             .customerReviews!
                                                    //             .data!
                                                    //             .reviews!
                                                    //             .length)
                                                    .w, // width: 29.w,
                                            decoration: BoxDecoration(
                                                color: AppColors().mainColor2,
                                                borderRadius: BorderRadius.circular(4.r)),
                                          ),
                                          SizedBox(
                                            height: 14.h,
                                          ),
                                          Container(
                                            height: 8.h,
                                            width: 8.w +
                                                controller
                                                    .twoWidth
                                                    // ((controller.twoRatings * 100) /
                                                    //         controller
                                                    //             .customerReviews!
                                                    //             .data!
                                                    //             .reviews!
                                                    //             .length)
                                                    .w, // width: 15.w,
                                            decoration: BoxDecoration(
                                                color: AppColors().mainColor2,
                                                borderRadius: BorderRadius.circular(4.r)),
                                          ),
                                          SizedBox(
                                            height: 14.h,
                                          ),
                                          Container(
                                            height: 8.h,
                                            width: 8.w +
                                                controller
                                                    .oneWidth
                                                    // ((controller.oneRatings * 100) /
                                                    //         controller
                                                    //             .customerReviews!
                                                    //             .data!
                                                    //             .reviews!
                                                    //             .length)
                                                    .w, // width: 8.w,
                                            decoration: BoxDecoration(
                                                color: AppColors().mainColor2,
                                                borderRadius: BorderRadius.circular(4.r)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20.w, //63.w,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          CustomText(
                                            text: "${controller.fiveRatings}",
                                            //  text: "12",
                                            fontColor: const Color(0xff444444),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          CustomText(
                                            text: "${controller.fourRatings}",
                                            // text: "5",
                                            fontColor: const Color(0xff444444),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          CustomText(
                                            text: "${controller.threeRatings}",
                                            // text: "4",
                                            fontColor: const Color(0xff444444),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          CustomText(
                                            text: "${controller.twoRatings}",
                                            // text: "2",
                                            fontColor: const Color(0xff444444),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          CustomText(
                                            text: "${controller.oneRatings}",
                                            // text: "0",
                                            fontColor: const Color(0xff444444),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 30, right: 30).r,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "${controller.customerReviews!.data!.reviews!.length} reviews",
                                      // text: "8 reviews",
                                      fontColor: const Color(0xff222222),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24.sp,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(const RattingReviewsWithphoto());
                                          },
                                          child: Checkbox(
                                            checkColor: Colors.white,
                                            activeColor: AppColors().mainColor2,
                                            side: const BorderSide(
                                              color: Color(0xff222222),
                                              width: 1,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(2.r)),
                                            value: isSelected,
                                            onChanged: (newValue) {
                                              setState(() {
                                                isSelected = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                        CustomText(
                                          text: "With photo",
                                          fontColor: const Color(0xff222222),
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
                                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: ordersController.customerReviews!.data!.reviews!.length, // 3,
                                    itemBuilder: (BuildContext context, int index) {
                                      Review? review =
                                          ordersController.customerReviews!.data!.reviews![index];
                                      return Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                                            child: Card(
                                              color: const Color(0xffFFFFFF),
                                              child: Container(
                                                padding: const EdgeInsets.only(top: 30.0, left: 20.0),
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
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    // Container(
                                                    //   child: Image.asset(
                                                    //       "assets/images/avatar.png"),
                                                    // ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 18, right: 18).r,
                                                      child: CustomText(
                                                        text: "${review.customerName}",
                                                        // text: "Helene Moore",
                                                        fontColor: const Color(0xff000000),
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 18, right: 18).r,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          RatingBar.builder(
                                                            initialRating: double.parse(review.rating!), // 4,
                                                            minRating: 1,
                                                            direction: Axis.horizontal,
                                                            allowHalfRating: true,
                                                            itemSize: 13,
                                                            itemCount: int.parse(review.rating!), // 4,
                                                            itemBuilder: (context, _) => const Icon(
                                                              Icons.star,
                                                              color: Color(0xffFFBA49),
                                                              size: 12,
                                                            ),
                                                            onRatingUpdate: (rating) {
                                                              print(rating);
                                                            },
                                                          ),
                                                          CustomText(
                                                            text: review.reviewDate!,
                                                            // text:  "June 5, 2019",
                                                            fontColor: const Color(0xffC0C0C0),
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 11.sp,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextField(
                                                      minLines: 2,
                                                      maxLines: 9,
                                                      keyboardType: TextInputType.multiline,
                                                      cursorColor: const Color(0xffC0C0C0),
                                                      decoration: InputDecoration(
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        enabled: false,
                                                        hintMaxLines: 9,
                                                        floatingLabelAlignment: FloatingLabelAlignment.start,
                                                        contentPadding:
                                                            const EdgeInsets.fromLTRB(18.0, 11.0, 18.0, 11.0),
                                                        border: const OutlineInputBorder(
                                                          borderSide: BorderSide.none,
                                                        ),
                                                        focusedBorder: const OutlineInputBorder(
                                                          borderSide: BorderSide.none,
                                                        ),
                                                        hintText: review.review,
                                                        // hintText:
                                                        //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, ",
                                                        hintStyle: const TextStyle(
                                                          color: Color(0xff444444),
                                                          fontFamily: "DMSans",
                                                          fontSize: 14,
                                                          letterSpacing: -0.15,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                              left: 18, right: 18, bottom: 18)
                                                          .r,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          CustomText(
                                                            text: "Helpful",
                                                            fontColor: const Color(0xffC0C0C0),
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 11.sp,
                                                          ),
                                                          const Icon(
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
                                            ),
                                          ),
                                          CircleAvatar(
                                            radius: 24,
                                            backgroundImage: NetworkImage(review.profilePic!),
                                          ),
                                          // Container(
                                          //   child: Image.network(
                                          //       "${review.profilePic}"),
                                          //   child: Image.asset(  "assets/images/avatar.png"),
                                          // ),
                                        ],
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
      },
    );
  }

  Future<dynamic> showCustomDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // var rating = 3.0;
        return SingleChildScrollView(
          child: Dialog(
            insetPadding: const EdgeInsets.only(left: 0, right: 0, top: 160, bottom: 0).r,
            backgroundColor: Colors.transparent,
            child: const AddReview(),
          ),
        );
      },
    );
  }
}
