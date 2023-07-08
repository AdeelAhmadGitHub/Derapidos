import 'dart:async';

import 'package:derapidos/View/NavigationBar/navigationbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../consts/app_consts.dart';
import '../Custom Widget/button.dart';
import '../Custom Widget/custom_text.dart';
import '../Track Order/track_order_screen.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({Key? key}) : super(key: key);

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  // CartController cartController = Get.find();
  // @override
  // initState() {
  // moveToHome();
  //   super.initState();
  // }

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 190).r,
                child: Center(
                  child: Container(
                    child: Image.asset("assets/images/bags.png"),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Order Placed!",
                    fontColor: const Color(0xff444444),
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              CustomText(
                textAlign: TextAlign.center,
                text: "Thank you for choosing our app! Your order will \n be delivered soon.",
                fontColor: const Color(0xffC0C0C0),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30).r,
                child: MyCustomButton(
                  onPressed: () {
                    Get.off(const TrackOrderScreen());
                  },
                  height: 45.h,
                  width: 315.w,
                  buttonColor: const Color(0xffEC2547),
                  text: "Track Order",
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

  moveToHome() {
    var splashDuration = const Duration(seconds: 2);
    Timer(splashDuration, () {
      Get.offAll(const NavigationbarScreen());
    });
  }
}
