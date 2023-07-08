import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/View/NavigationBar/navigationbar_screen_grocery.dart';
import 'package:derapidos/View/NavigationBar/navigationbar_screen_market.dart';
import 'package:derapidos/consts/app_consts.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/controllers/r_s_controller/home_controller.dart';
import 'package:derapidos/controllers/satrt_controller.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../component/card.dart';
import '../../component/custom_card.dart';
import '../../models/main_screen_model.dart';
import '../Home/image_slider.dart';
import '../NavigationBar/navigationbar_screen.dart';
import '../real_estate/r_s_bottom_nev_bar/r_s_bottom_nev_bar_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> images = ["assets/images/a.jpg", "assets/images/b.jpg"];
  int _current = 0;
  var homeController = Get.put(StartController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.getCurrentLocation();
      homeController.getProfile();
      homeController.profileLoading.value = false;
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Color(0xF8F8F8F4),
        appBar: AppBar(
          toolbarHeight: 80..h,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors().mainColor2,
          title: CustomText(
            text: homeController.address.value,
            fontColor: Colors.white,
            fontSize: 20.sp,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 10.h),
              Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => SizedBox(
                      height: 210.h,
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
                      height: 180.h,
                      aspectRatio: 2.0,
                      initialPage: 2,
                      onPageChanged: (index, _) {
                        setState(() {
                          _current = index;
                          print("${_current}");
                        });
                      },
                    ),
                  ),
                  // Positioned(
                  //   top: 130.h,
                  //   left: 26.w,
                  //   child: Row(
                  //     children: images.map(
                  //       (image) {
                  //         int index = images.indexOf(image);
                  //         return _current == index
                  //             ? Container(
                  //                 width: 19.0..w,
                  //                 height: 19.0..h,
                  //                 margin: EdgeInsets.symmetric(horizontal: 10.0..w),
                  //                 decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   border: Border.all(color: AppColors().mainColor2, width: 2.w),
                  //                 ),
                  //                 child: Center(
                  //                   child: Container(
                  //                       width: 8.0..w,
                  //                       height: 8.0..h,
                  //                       decoration: BoxDecoration(
                  //                           shape: BoxShape.circle, color: AppColors().mainColor2)),
                  //                 ),
                  //               )
                  //             : Container(
                  //                 width: 8.0..w,
                  //                 height: 8.0..h,
                  //                 decoration:
                  //                     const BoxDecoration(shape: BoxShape.circle, color: Color(0xffC0C0C0)),
                  //               );
                  //       },
                  //     ).toList(),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomText(
                    text: "Hi, ${homeController.userProfile?.userData?.name ?? "Welcome to Derapidos"}",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomCard(
                  height: 45.h,
                  borderRadius: BorderRadius.circular(10.0.r),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 0.5, spreadRadius: 1)],
                  cardColor: Colors.white,
                  // border: Border.all(
                  //     width: 1,
                  //     color: const Color(0xff5d3ebd),
                  cardChild: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'What do you want ?',
                            hintStyle: TextStyle(
                              color: const Color(0xffC0C0C0),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'DMSans',
                            ),
                            prefixIcon: Icon(Icons.search, size: 25, color: AppColors().mainColor2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 10.h),

              // SizedBox(height: 10.h),
              CustomGridView(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    Key? key,
    this.customGridHeight = const [175, 175],
  }) : super(key: key);
  final List<double> customGridHeight;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(10.sp),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: 4,
        itemBuilder: (context, index) {
          return index == 0
              ? InkWell(
                  onTap: () {
                    var homeController = Get.put(HomeController());
                    homeController.derapidosType = "1";
                    homeController.categorytype = "1";
                    homeController.rating = "";
                    homeController.deliveryType = "";
                    homeController.priceRange = "";
                    homeController.categoryIdF = "";
                    homeController.markettype = "";
                    homeController.restaurant_sub_type = "";
                    homeController.bannertype = "1";
                    homeController.radius = "";
                    homeController.product_date = "";
                    Get.to(const NavigationbarScreen());
                  },
                  child: Card1(
                    height: 184..h,
                    // width: 173.w,
                    radius: 10,
                    cardColor: Colors.white,
                    cardShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                    cardChild: Padding(
                      padding: EdgeInsets.only(top: 10..h, left: 10..w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText4(
                              text: mainScreenList[index].text,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              fontColor: AppColors().mainColor2),
                          // SizedBox(height: 10.h),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              mainScreenList[index].image, height: 90..h,
                              // fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : index == 1
                  ? InkWell(
                      onTap: () {
                        var homeController = Get.put(HomeController());
                        homeController.derapidosType = "3";
                        homeController.categorytype = "3";
                        homeController.rating = "";
                        homeController.deliveryType = "";
                        homeController.priceRange = "";
                        homeController.categoryIdF = "";
                        homeController.markettype = "";
                        homeController.restaurant_sub_type = "";
                        homeController.bannertype = "3";
                        homeController.radius = "";
                        homeController.product_date = "";

                        Get.to(const NavigationbarScreenGrocery());
                      },
                      //onTap: () => Get.to(NavigationbarScreenGrocery()),

                      // onTap: () {
                      //   // index == 3
                      //   //     ? Get.to(RSBottomNevBar())
                      //   //     :
                      //   showDialog(
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return AlertDialog(
                      //           title: Text("Under Development"),
                      //           titleTextStyle: TextStyle(
                      //               fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18.sp),
                      //           backgroundColor: Colors.greenAccent,
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.all(Radius.circular(20))),
                      //           content: GestureDetector(onTap: () => Get.back(), child: Text("OK")),
                      //         );
                      //       });
                      // },
                      child: Card1(
                        height: 86..h,
                        radius: 10.r,
                        cardColor: Colors.white,
                        cardShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                        cardChild: Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 10.h),
                          child: Stack(
                            children: [
                              CustomText4(
                                  text: mainScreenList[index].text,
                                  fontSize: 24..sp,
                                  fontWeight: FontWeight.w700,
                                  fontColor: AppColors().mainColor2),
                              // SizedBox(height: 15..h),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.r)),
                                  child: Image.asset(
                                    mainScreenList[index].image,
                                    height: 81..h,
                                    width: 66..w,
                                    // fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : index == 3
                      ? Align(
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                            onTap: () {
                              var rsHomecontroller = Get.put(RSHomeController());
                              rsHomecontroller.userID = "";
                              rsHomecontroller.listing_type = "";
                              rsHomecontroller.category_id = "";
                              rsHomecontroller.price_min = "";
                              rsHomecontroller.price_max = "";
                              rsHomecontroller.statusIsfurneshed = "";
                              rsHomecontroller.bedrooms = "";
                              rsHomecontroller.bathrooms = "";
                              rsHomecontroller.area_unit = "";
                              rsHomecontroller.area_start = "";
                              rsHomecontroller.area_end = "";
                              Get.to(RSBottomNevBar());
                            },
                            child: Card1(
                              // height: customGridHeight[index % 1],
                              // width: 160.w,
                              height: 130..h,
                              radius: 10.r,
                              cardColor: Colors.white,
                              cardShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                ),
                              ],
                              cardChild: Padding(
                                padding: EdgeInsets.only(left: 10..w, top: 10..h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText4(
                                        text: mainScreenList[index].text,
                                        fontSize: 20..sp,
                                        fontWeight: FontWeight.w700,
                                        fontColor: AppColors().mainColor2),
                                    // SizedBox(height: 15..h),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Image.asset(
                                        mainScreenList[index].image,
                                        height: 96..h,
                                        width: 145..w,
                                        // fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            var homeController = Get.put(HomeController());
                            homeController.derapidosType = "2";
                            homeController.categorytype = "2";
                            homeController.rating = "";
                            homeController.deliveryType = "";
                            homeController.priceRange = "";
                            homeController.categoryIdF = "";
                            homeController.markettype = "";
                            homeController.restaurant_sub_type = "";
                            homeController.bannertype = "2";
                            homeController.radius = "";
                            homeController.product_date = "";
                            Get.to(const NavigationbarScreenMarket());
                          },
                          //onTap: () => Get.to(NavigationbarScreenMarket()),

                          // onTap: () {
                          //   // index == 3
                          //   //     ? Get.to(RSBottomNevBar())
                          //   //     :
                          //   showDialog(
                          //       context: context,
                          //       builder: (BuildContext context) {
                          //         return AlertDialog(
                          //           title: Text("Under Development"),
                          //           titleTextStyle: TextStyle(
                          //               fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18.sp),
                          //           backgroundColor: Colors.greenAccent,
                          //           shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.all(Radius.circular(20))),
                          //           content: GestureDetector(onTap: () => Get.back(), child: Text("OK")),
                          //         );
                          //       });
                          // },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Card1(
                              // height: customGridHeight[index % 1],
                              // width: 160.w,
                              height: 86..h,
                              radius: 10.r,
                              cardColor: Colors.white,
                              cardShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                ),
                              ],
                              cardChild: Padding(
                                padding: EdgeInsets.only(left: 10..w, top: 10..h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText4(
                                        text: mainScreenList[index].text,
                                        fontSize: 20..sp,
                                        fontWeight: FontWeight.w700,
                                        fontColor: AppColors().mainColor2),
                                    // SizedBox(height: 15..h),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.r)),
                                        child: Image.asset(
                                          mainScreenList[index].image,
                                          height: 49..h,
                                          width: 150..w,
                                          // fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
        });
  }
}
