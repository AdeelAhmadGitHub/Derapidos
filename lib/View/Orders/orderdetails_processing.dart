import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../consts/app_consts.dart';
import '../Custom Widget/button.dart';
import '../Custom Widget/custom_text.dart';
import '../Track Order/track_order_screen.dart';

class OrderdetailsProcessing extends StatefulWidget {
  const OrderdetailsProcessing({Key? key}) : super(key: key);

  @override
  State<OrderdetailsProcessing> createState() => _OrderdetailsProcessingState();
}

class _OrderdetailsProcessingState extends State<OrderdetailsProcessing> {
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
            padding: const EdgeInsets.only(top: 20).r,
            child: Column(
              children: [
                Container(
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
                        text: "Order Details",
                        fontColor: Color(0xff444444),
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Order number:",
                              fontColor: Color(0xff868686),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                            CustomText(
                              text: "123456789",
                              fontColor: Color(0xff222222),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ],
                        )),
                        SizedBox(height: 12.h),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Tracking number:",
                              fontColor: Color(0xff868686),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                            CustomText(
                              text: "US123456789",
                              fontColor: Color(0xff222222),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ],
                        )),
                        SizedBox(height: 12.h),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Status:",
                              fontColor: Color(0xff868686),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                            CustomText(
                              text: "Progress",
                              fontColor: Color(0xffFFBA49),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ],
                        )),
                        SizedBox(height: 15.h),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Delivery Date:",
                              fontColor: Color(0xff868686),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                            CustomText(
                              text: "06-23-2021",
                              fontColor: Color(0xff222222),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30).r,
                      child: Container(
                        child: CustomText(
                          text: "Items",
                          fontColor: Color(0xff444444),
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 94.h,
                  width: 315.w,
                  decoration: BoxDecoration(
                    color: Color(0xfffFFFFFF),
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 5.0,
                        color: Color(0xffE5E5E5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/OrderDetail.png",
                            height: 94.h,
                            width: 99.w,
                            fit: BoxFit.fill,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0).r,
                                    child: CustomText(
                                      text: "Chef’s Burger",
                                      fontColor: Color(0xff444444),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 38.w,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 15).r,
                                    child: CustomText(
                                      text: "06-23-2021",
                                      fontColor: Color(0xffC0C0C0),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10).r,
                                child: Row(
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: "Quantity:",
                                        style: TextStyle(
                                          color: const Color(0xff9B9B9B),
                                          fontSize: 12.sp,
                                          fontFamily: 'DMSans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: " 2",
                                            style: TextStyle(
                                              color: const Color(0xff444444),
                                              fontSize: 12.sp,
                                              fontFamily: 'DMSans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: "Size: ",
                                        style: TextStyle(
                                          color: const Color(0xff9B9B9B),
                                          fontSize: 12.sp,
                                          fontFamily: 'DMSans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Large",
                                            style: TextStyle(
                                              color: const Color(0xff444444),
                                              fontSize: 12.sp,
                                              fontFamily: 'DMSans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 15).r,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: "Extras:",
                                        style: TextStyle(
                                          color: const Color(0xff9B9B9B),
                                          fontSize: 12.sp,
                                          fontFamily: 'DMSans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: " 0",
                                            style: TextStyle(
                                              color: const Color(0xff444444),
                                              fontSize: 12.sp,
                                              fontFamily: 'DMSans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                    ),
                                    CustomText(
                                      text: "\$45.99",
                                      fontColor: Color(0xff000000),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30).r,
                    child: Container(
                      child: CustomText(
                        text: "Order information",
                        fontColor: Color(0xff444444),
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Shipping address:",
                              fontColor: Color(0xff868686),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                            CustomText(
                              text: "3 Newbridge Court,CA 91709,\n United States",
                              fontColor: Color(0xff222222),
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                          ],
                        )),
                        SizedBox(height: 12.h),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Payment method:",
                              fontColor: Color(0xff868686),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                            SizedBox(
                              width: 22.w,
                            ),
                            Image.asset(
                              "assets/images/MasteCard.png",
                              height: 25.h,
                              width: 32,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            CustomText(
                              text: "**** **** **** 3947",
                              fontColor: Color(0xff222222),
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                          ],
                        )),
                        SizedBox(height: 12.h),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Resturant:",
                              fontColor: Color(0xff868686),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                            CustomText(
                              text: "Burger King",
                              fontColor: Color(0xff444444),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ],
                        )),
                        SizedBox(height: 12.h),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Discount::",
                              fontColor: Color(0xff868686),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                            CustomText(
                              text: "10%, Personal promo code",
                              fontColor: Color(0xff444444),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ],
                        )),
                        SizedBox(height: 12.h),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Total:",
                              fontColor: Color(0xff444444),
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),
                            CustomText(
                              text: "\$40.00",
                              fontColor: Color(0xff444444),
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                  height: 45.h,
                  width: double.infinity.w,
                  child: MyCustomButton(
                    onPressed: () {
                      Get.to(TrackOrderScreen());
                    },
                    height: 45.h,
                    width: 142.w,
                    buttonColor: Color(0xffEC2547),
                    text: "Track Order",
                    textColor: Color(0xffFFFFFF),
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
