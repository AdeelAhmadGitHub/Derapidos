import 'dart:convert';

import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/consts/app_consts.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../component/custom_card.dart';
import '../Custom Widget/custom_text.dart';
import '../Store Details/store_detail_screen.dart';
import 'package:derapidos/View/Home/getstorehomebycategory.dart';
import 'package:derapidos/View/Home/image_slider.dart';
import 'package:derapidos/models/homepageproduct/homepageproducts.dart';

import '../Explore/explore_screen.dart';
import '../awards/awards_screen.dart';

class RestaurantTypeScreen extends StatefulWidget {
  const RestaurantTypeScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantTypeScreen> createState() => _RestaurantTypeScreenState();
}

class _RestaurantTypeScreenState extends State<RestaurantTypeScreen> {
  int? selectedIndex;
  int checkedIndex = 0;

  var homeController = Get.put(HomeController());

  String addres = "";

  // List cardNames = [
  //   'Sports',
  //   'Wild Life',
  //   'Night',
  //   'LandSpace',
  // ];

  @override
  initState() {
    gotcallf();
    super.initState();
  }
  gotcallf() async {
    homeController.loading.value = true;
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      //log('datansdlaslasljlajlaajlaJLas');
      homeController.userIDCheck = "";
      homeController.getSpecialData();
    } else {
      //log('uytrtyuiolkjhgcvbnm');
      UserProfile? userProfile;
      String? data = UserPreferences.getUserData();
      if (data != null) {
        userProfile = UserProfile.fromJson(jsonDecode(data!));
      } else {}
      homeController.userIDCheck = '${userProfile?.userData?.id}';
      homeController.getSpecialData1();


    }
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return homeController.loading.value
            ? const Scaffold(body:  Center(child: CircularProgressIndicator()))
            : Scaffold(
          backgroundColor: Color(0xF8F8F8F4),
          appBar: AppBar(
                  titleSpacing: 0,
                  centerTitle: true,
                  leading: GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  title: Image.asset(
                    "assets/images/logo2.png",
                    height: 59..h,
                    width: 203..w,
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: const Color(0xff95006F),
                  toolbarHeight: 70.h,
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          SizedBox(height: 30.h),
                          Padding(
                            padding: EdgeInsets.only(left: 0..w, right: 0..w),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                  visible: homeController.categoryIdName == null ||
                                          homeController.categoryIdName == ""
                                      ? false
                                      : true,
                                  child: InkWell(
                                    onTap: () {
                                      homeController.categoryIdName = "";
                                      homeController.categoryIdF = "";
                                      homeController.getSuggestedProducts();
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: AppColors().mainColor2,
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CustomText(
                                              text: homeController.categoryIdName ?? "",
                                              fontColor: AppColors().mainColor2,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Icon(
                                              Icons.close,
                                              color: AppColors().mainColor2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Visibility(
                                  visible: homeController.rating == null || homeController.rating == ""
                                      ? false
                                      : true,
                                  child: InkWell(
                                    onTap: () {
                                      homeController.rating = "";
                                      homeController.getSuggestedProducts();
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: AppColors().mainColor2,
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CustomText(
                                              text: homeController.rating ?? "",
                                              fontColor: AppColors().mainColor2,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Icon(
                                              Icons.close,
                                              color: AppColors().mainColor2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.only(left: 10..w, right: 10..w),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                  visible:
                                      homeController.deliveryType == null || homeController.deliveryType == ""
                                          ? false
                                          : true,
                                  child: InkWell(
                                    onTap: () {
                                      homeController.deliveryType = "";
                                      homeController.getSuggestedProducts();
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: AppColors().mainColor2,
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CustomText(
                                              text: homeController.deliveryType ?? "",
                                              fontColor: AppColors().mainColor2,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Icon(
                                              Icons.close,
                                              color: AppColors().mainColor2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Visibility(
                                  visible:
                                      homeController.priceRange == null || homeController.priceRange == ""
                                          ? false
                                          : true,
                                  child: InkWell(
                                    onTap: () {
                                      homeController.priceRange = "";
                                      homeController.getSuggestedProducts();
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: AppColors().mainColor2,
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CustomText(
                                              text: homeController.priceRange ?? "",
                                              fontColor: AppColors().mainColor2,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Icon(
                                              Icons.close,
                                              color: AppColors().mainColor2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.only(left: 10..w, right: 10..w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText4(
                                  text: "International Cuisines",
                                  fontColor: const Color(0xff262525),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    homeController.categorytype = "1";
                                    homeController.markettype = "International Cuisines";
                                    Get.to(const GetStoreHomebyCategory());
                                  },
                                  child: CustomText4(
                                    text: "View all",
                                    fontColor: AppColors().mainColor2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15..h),
                          SizedBox(
                            child: MediaQuery.removePadding(
                              context: context,
                              removeBottom: true,
                              child: homeController
                                  .homepageproduct!.value.data!.internationalCuisinesRestaurants!.isEmpty
                                  ? const Center(
                                child: CustomText(
                                  text: "No Restaurants",
                                ),
                              )
                                  : Container(
                                height: 170.h,
                                decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                                  BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 2)
                                ]),
                                child: ListView.separated(
                                  separatorBuilder: (BuildContext context, int index) {
                                    return SizedBox(width: 10.w);
                                  },
                                  padding: EdgeInsets.only(left: 10..w, bottom: 0, top: 7,right: 10.w),
                                  // shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeController.homepageproduct!.value.data!
                                      .internationalCuisinesRestaurants!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    InternationalCuisinesRestaurants product = homeController
                                        .homepageproduct!
                                        .value
                                        .data!
                                        .internationalCuisinesRestaurants![index];
                                    return GestureDetector(
                                      onTap: () {
                                        selectedIndex = index;
                                        setState(() {});
                                        homeController.currentRestaurantId = product.id.toString();
                                        Get.to(const StoreDetailScreen());
                                      },
                                      child: Container(
                                        width: 300.w,
                                        height: 130.h,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 120.h,
                                              width: 300.w,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomLeft: Radius.circular(10),
                                                  bottomRight: Radius.circular(10),
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: const BorderRadius.only(
                                                      topLeft: Radius.circular(10),
                                                      topRight: Radius.circular(10),
                                                      bottomLeft: Radius.circular(10),
                                                      bottomRight: Radius.circular(10),
                                                    ),
                                                    child: SizedBox(
                                                      width: double.maxFinite,
                                                      child: Image.network(
                                                        "${product.logo}",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 10.h,
                                                    left: 10.w,
                                                    right: 10.w,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        CustomCard(
                                                            borderRadius: BorderRadius.circular(5),
                                                            cardColor: const Color(0xffFFD10C),
                                                            cardChild: Padding(
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: 4.0.r, vertical: 3.h),
                                                              child: Row(
                                                                // mainAxisAlignment:
                                                                //     MainAxisAlignment
                                                                //         .spaceBetween,
                                                                children: [
                                                                  Image.asset(
                                                                    "assets/images/aw.png",
                                                                    height: 10.h,
                                                                    width: 11.w,
                                                                  ),
                                                                  SizedBox(width: 3.w),
                                                                  CustomText(
                                                                    text: "Regular",
                                                                    fontSize: 12.sp,
                                                                    fontColor: AppColors().mainColor2,
                                                                  )
                                                                ],
                                                              ),
                                                            )),

                                                        InkWell(
                                                          onTap: () async {
                                                            print("EVEy thing Good");
                                                            debugPrint("GVJHBKJNBLK");
                                                            bool? isLogin =
                                                                await UserPreferences.getLoginCheck() ??
                                                                    false;
                                                            if (isLogin == false) {
                                                              Get.to(const LoginScreen());
                                                            } else {
                                                              if (product.favourite == 1) {
                                                                product.favourite = 0;
                                                              } else {
                                                                product.favourite = 1;
                                                              }
                                                              setState(() {});
                                                              homeController.restaurantIDF = product.id;
                                                              homeController.addRemoveFavorite();
                                                            }
                                                          },
                                                          child: SizedBox(
                                                              height: 20.h,
                                                              child: product.favourite == 0
                                                                  ? Image.asset(
                                                                  "assets/images/like0.png")
                                                                  : Image.asset(
                                                                  "assets/images/like2.png")),
                                                        ),
                                                        // InkWell(
                                                        //   onTap: (){
                                                        //     print("ifhnclsk")
                                                        //
                                                        //   },
                                                        //   child: Icon(
                                                        //     Icons
                                                        //         .favorite_border,
                                                        //     size: 26.sp,
                                                        //     color: Colors
                                                        //         .white,
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 10.h,
                                                    top: 97.h,
                                                    child: CustomCard(
                                                      height: 19.h,
                                                      width: 45.w,
                                                      borderRadius: BorderRadius.circular(5),
                                                      cardColor: AppColors().mainColor2,
                                                      cardChild: Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 6.0.r, vertical: 3.h),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              size: 15.r,
                                                              color: const Color(0xffFFD10C),
                                                            ),
                                                            CustomText(
                                                              text: "${product.averageRating}",
                                                              fontColor: Colors.white,
                                                              fontSize: 10.sp,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  CustomText(
                                                    text: "${product.name}",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14.sp,
                                                  ),
                                                  CustomText(
                                                    text: "",
                                                    fontColor: AppColors().mainColor2,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/aa.png",
                                                        height: 13.h,
                                                        width: 13.w,
                                                      ),
                                                      SizedBox(width: 5.w),
                                                      Image.asset(
                                                        "assets/images/ss.png",
                                                        height: 12.h,
                                                        width: 13.w,
                                                      ),
                                                      SizedBox(width: 5.w),
                                                      SizedBox(
                                                        width: 40.w,
                                                        child: CustomText(
                                                          text: product.time,
                                                          fontSize: 10.sp,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 150.w,
                                                    child: CustomText(
                                                      text: "${product.address}",
                                                      textOverflow: TextOverflow.ellipsis,
                                                      fontSize: 10..sp,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  CustomText(
                                                    text: "Min.Order ${product.minimumOrderPrice} CFA",
                                                    fontColor: AppColors().mainColor2,
                                                    fontSize: 10.sp,

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
                          ),

                          SizedBox(height: 15..h),
                          Padding(
                            padding: EdgeInsets.only(left: 10..w, right: 10..w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText4(
                                  text: "Local Cuisines",
                                  fontColor: const Color(0xff262525),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    homeController.categorytype = "1";
                                    homeController.markettype = "Homemade & Local Cuisines";
                                    Get.to(const GetStoreHomebyCategory());
                                  },
                                  child: CustomText4(
                                    text: "View all",
                                    fontColor: AppColors().mainColor2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Container(
                            child: homeController
                                .homepageproduct!.value.data!.homemadeLocalCuisinesRestaurants!.isEmpty
                                ? const Center(
                              child: CustomText(
                                text: "No Restaurants",
                              ),
                            )
                                : Container(
                              height: 170.h,
                              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                                BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 2)
                              ]),
                              child: ListView.separated(
                                separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(width: 10.w);
                                },
                                padding: EdgeInsets.only(left: 10..w, top: 7,right: 10.w),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController.homepageproduct!.value.data!
                                    .homemadeLocalCuisinesRestaurants!.length,
                                // 10,
                                itemBuilder: (BuildContext context, int index) {
                                  HomemadeLocalCuisinesRestaurants? product = homeController
                                      .homepageproduct!
                                      .value
                                      .data!
                                      .homemadeLocalCuisinesRestaurants![index];
                                  return GestureDetector(
                                    onTap: () {
                                      selectedIndex = index;
                                      setState(() {});
                                      homeController.currentRestaurantId = product.id.toString();
                                      Get.to(const StoreDetailScreen());
                                    },
                                    child: Container(
                                      width: 300.w,
                                      // height: 150.h,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 300.w,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius: const BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10),
                                                    bottomRight: Radius.circular(10),
                                                  ),
                                                  child: SizedBox(
                                                    width: double.maxFinite,
                                                    height: 120.h,
                                                    child: Image.network(
                                                      "${product.logo}",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 10.h,
                                                  left: 10.w,
                                                  right: 10.w,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      CustomCard(
                                                          borderRadius: BorderRadius.circular(5),
                                                          cardColor: const Color(0xffFFD10C),
                                                          cardChild: Padding(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal: 4.0.r, vertical: 4.h),
                                                            child: Row(
                                                              children: [
                                                                Image.asset("assets/images/aw.png",
                                                                    height: 10.h, width: 11.w),
                                                                SizedBox(
                                                                  width: 3.w,
                                                                ),
                                                                CustomText(
                                                                  text: "Regular",
                                                                  fontSize: 12.sp,
                                                                  fontColor: AppColors().mainColor2,
                                                                )
                                                              ],
                                                            ),
                                                          )),
                                                      InkWell(
                                                        onTap: () async {
                                                          bool? isLogin =
                                                              await UserPreferences.getLoginCheck() ??
                                                                  false;
                                                          if (isLogin == false) {
                                                            Get.to(const LoginScreen());
                                                          } else {
                                                            if (product.favourite == 1) {
                                                              product.favourite = 0;
                                                            } else {
                                                              product.favourite = 1;
                                                            }
                                                            setState(() {});
                                                            homeController.restaurantIDF = product.id;
                                                            homeController.addRemoveFavorite();
                                                          }
                                                        },
                                                        child: SizedBox(
                                                            height: 20.h,
                                                            child: product.favourite == 0
                                                                ? Image.asset("assets/images/like0.png")
                                                                : Image.asset(
                                                                "assets/images/like2.png")),
                                                      )
                                                      // Icon(
                                                      //   Icons
                                                      //       .favorite_border,
                                                      //   size: 26.sp,
                                                      //   color:
                                                      //       Colors.white,
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 10.h,
                                                  top: 97.h,
                                                  child: CustomCard(
                                                    height: 19.h,
                                                    width: 45.w,
                                                    borderRadius: BorderRadius.circular(5),
                                                    cardColor: AppColors().mainColor2,
                                                    cardChild: Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 6.0.r),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            size: 15.r,
                                                            color: const Color(0xffFFD10C),
                                                          ),
                                                          CustomText(
                                                            text: "${product.averageRating}",
                                                            fontColor: Colors.white,
                                                            fontSize: 10.sp,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                CustomText(
                                                  text: "${product.name}",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                ),
                                                CustomText(
                                                  text: "",
                                                  fontColor: AppColors().mainColor2,
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/aa.png",
                                                      height: 13.h,
                                                      width: 13.w,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Image.asset(
                                                      "assets/images/ss.png",
                                                      height: 12.h,
                                                      width: 13.w,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    SizedBox(
                                                      width: 40.w,
                                                      child: CustomText(
                                                        text: product.time,
                                                        fontSize: 10.sp,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width:150.w,
                                                  child: CustomText(
                                                    text: "${product.address}",
                                                    fontSize: 10..sp,
                                                    textOverflow: TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),

                                                CustomText(
                                                  text: "Min.Order ${product.minimumOrderPrice} CFA",
                                                  fontColor: AppColors().mainColor2,
                                                  fontSize: 10.sp,

                                                )
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

                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsets.only(left: 10..w, right: 10..w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText4(
                                  text: "Popular",
                                  fontColor: const Color(0xff262525),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    homeController.categorytype = "1";
                                    homeController.markettype = "Popular Restaurants";
                                    Get.to(const GetStoreHomebyCategory());
                                  },
                                  child: CustomText4(
                                    text: "View all",
                                    fontColor: AppColors().mainColor2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          SizedBox(
                            child: homeController.homepageproduct!.value.data!.popularRestaurants!.isEmpty
                                ? const Center(
                              child: CustomText(
                                text: "No Restaurants",
                              ),
                            )
                                : Container(
                              height: 170.h,
                              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1)
                              ]),
                              child: ListView.separated(
                                separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(width: 10.w);
                                },
                                shrinkWrap: true,
                                padding: EdgeInsets.only(left: 10..w, top: 7.h,right: 10.w),
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController
                                    .homepageproduct!.value.data!.popularRestaurants!.length,
                                // 10,
                                itemBuilder: (BuildContext context, int index) {
                                  PopularRestaurants? product = homeController
                                      .homepageproduct!.value.data!.popularRestaurants![index];
                                  return GestureDetector(
                                    onTap: () {
                                      selectedIndex = index;
                                      setState(() {});
                                      homeController.currentRestaurantId = product.id.toString();
                                      Get.to(const StoreDetailScreen());
                                    },
                                    child: Container(
                                      width: 300.w,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 300.w,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius: const BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10),
                                                    bottomRight: Radius.circular(10),
                                                  ),
                                                  child: SizedBox(
                                                    height: 120.h,
                                                    width: double.maxFinite,
                                                    child: Image.network(
                                                      "${product.logo}",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 10.h,
                                                  left: 10.w,
                                                  right: 10.w,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      CustomCard(
                                                        // height: 19.h,
                                                        // width: 62.w,
                                                          borderRadius: BorderRadius.circular(5),
                                                          cardColor: const Color(0xffFFD10C),
                                                          cardChild: Padding(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal: 4.0.r, vertical: 3.h),
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  "assets/images/aw.png",
                                                                  height: 10.h,
                                                                  width: 11.w,
                                                                ),
                                                                SizedBox(width: 3.w),
                                                                Row(
                                                                  children: [
                                                                    CustomText(
                                                                      text: "Regular ",
                                                                      fontSize: 12.sp,
                                                                      fontColor: AppColors().mainColor2,
                                                                    ),
                                                                    CustomText(
                                                                      text: " + 15% Discount",
                                                                      fontSize: 12.sp,
                                                                      fontColor: AppColors().mainColor2,
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          )),
                                                      InkWell(
                                                        onTap: () async {
                                                          bool? isLogin =
                                                              await UserPreferences.getLoginCheck() ??
                                                                  false;
                                                          if (isLogin == false) {
                                                            Get.to(const LoginScreen());
                                                          } else {
                                                            if (product.favourite == 1) {
                                                              product.favourite = 0;
                                                            } else {
                                                              product.favourite = 1;
                                                            }
                                                            setState(() {});
                                                            homeController.restaurantIDF =
                                                                product.id.toString();
                                                            homeController.addRemoveFavorite();
                                                          }
                                                        },
                                                        child: SizedBox(
                                                            height: 20.h,
                                                            child: product.favourite == 0
                                                                ? Image.asset("assets/images/like0.png")
                                                                : Image.asset(
                                                                "assets/images/like2.png")),
                                                      )
                                                      // Icon(
                                                      //   Icons
                                                      //       .favorite_border,
                                                      //   size: 26.sp,
                                                      //   color:
                                                      //       Colors.white,
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 10.h,
                                                  top: 97.h,
                                                  child: CustomCard(
                                                    height: 19.h,
                                                    width: 45.w,
                                                    borderRadius: BorderRadius.circular(5),
                                                    cardColor: AppColors().mainColor2,
                                                    cardChild: Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 6.0.r),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            size: 15.r,
                                                            color: const Color(0xffFFD10C),
                                                          ),
                                                          CustomText(
                                                            text: "${product.averageRating}",
                                                            fontColor: Colors.white,
                                                            fontSize: 10.sp,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                CustomText(
                                                  text: "${product.name}",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                ),
                                                CustomText(
                                                  text: "",
                                                  fontColor: AppColors().mainColor2,
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/aa.png",
                                                      height: 13.h,
                                                      width: 13.w,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Image.asset(
                                                      "assets/images/ss.png",
                                                      height: 12.h,
                                                      width: 13.w,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    SizedBox(
                                                      width: 40.w,
                                                      child: CustomText(
                                                        text: "${product.time}",
                                                        fontSize: 10.sp,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width:150.w,
                                                  child: CustomText(
                                                    text: "${product.address}",
                                                    fontSize: 10..sp,
                                                    textOverflow: TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   width: 170.w,
                                                //   child: CustomText(
                                                //     text: product.address,
                                                //     textOverflow: TextOverflow.ellipsis,
                                                //     // text: "${product.marketName}",
                                                //     fontColor: const Color(0xff9B9B9B),
                                                //     fontWeight: FontWeight.w400,
                                                //     fontSize: 12.sp,
                                                //   ),
                                                // ),
                                                CustomText(
                                                  text: "Min.Order ${product.minimumOrderPrice} CFA",
                                                  fontColor: AppColors().mainColor2,
                                                  fontSize: 10.sp,

                                                )

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
                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsets.only(left: 10..w, right: 10..w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText4(
                                  text: "Discounted",
                                  fontColor: const Color(0xff262525),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    homeController.categorytype = "1";
                                    homeController.markettype = "Discounted Restaurants";
                                    Get.to(const GetStoreHomebyCategory());
                                  },
                                  child: CustomText4(
                                    text: "View all",
                                    fontColor: AppColors().mainColor2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          SizedBox(
                            child: homeController.homepageproduct!.value.data!.discountedRestaurants!.isEmpty
                                ? const Center(
                              child: CustomText(
                                text: "No Restaurants",
                              ),
                            )
                                : Container(
                              height: 170.h,
                              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1)
                              ]),
                              child: ListView.separated(
                                separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(width: 10.w);
                                },
                                shrinkWrap: true,
                                padding: EdgeInsets.only(left: 10..w, top: 7.h,right: 10.w),
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController
                                    .homepageproduct!.value.data!.discountedRestaurants!.length,
                                // 10,
                                itemBuilder: (BuildContext context, int index) {
                                  DiscountedRestaurants? product = homeController
                                      .homepageproduct!.value.data!.discountedRestaurants![index];
                                  return GestureDetector(
                                    onTap: () {
                                      selectedIndex = index;
                                      setState(() {});
                                      homeController.currentRestaurantId = product.id.toString();
                                      Get.to(const StoreDetailScreen());
                                    },
                                    child: Container(
                                      width: 300.w,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 300.w,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius: const BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10),
                                                    bottomRight: Radius.circular(10),
                                                  ),
                                                  child: SizedBox(
                                                    height: 120.h,
                                                    width: double.maxFinite,
                                                    child: Image.network(
                                                      "${product.logo}",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 10.h,
                                                  left: 10.w,
                                                  right: 10.w,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      CustomCard(
                                                        // height: 19.h,
                                                        // width: 62.w,
                                                          borderRadius: BorderRadius.circular(5),
                                                          cardColor: const Color(0xffFFD10C),
                                                          cardChild: Padding(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal: 4.0.r, vertical: 3.h),
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  "assets/images/aw.png",
                                                                  height: 10.h,
                                                                  width: 11.w,
                                                                ),
                                                                SizedBox(width: 3.w),
                                                                Row(
                                                                  children: [
                                                                    CustomText(
                                                                      text: "Regular ",
                                                                      fontSize: 12.sp,
                                                                      fontColor: AppColors().mainColor2,
                                                                    ),
                                                                    CustomText(
                                                                      text: " + 15% Discount",
                                                                      fontSize: 12.sp,
                                                                      fontColor: AppColors().mainColor2,
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          )),
                                                      InkWell(
                                                        onTap: () async {
                                                          bool? isLogin =
                                                              await UserPreferences.getLoginCheck() ??
                                                                  false;
                                                          if (isLogin == false) {
                                                            Get.to(const LoginScreen());
                                                          } else {
                                                            if (product.favourite == 1) {
                                                              product.favourite = 0;
                                                            } else {
                                                              product.favourite = 1;
                                                            }
                                                            setState(() {});
                                                            homeController.restaurantIDF =
                                                                product.id.toString();
                                                            homeController.addRemoveFavorite();
                                                          }
                                                        },
                                                        child: SizedBox(
                                                            height: 20.h,
                                                            child: product.favourite == 0
                                                                ? Image.asset("assets/images/like0.png")
                                                                : Image.asset(
                                                                "assets/images/like2.png")),
                                                      )
                                                      // Icon(
                                                      //   Icons
                                                      //       .favorite_border,
                                                      //   size: 26.sp,
                                                      //   color:
                                                      //       Colors.white,
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 10.h,
                                                  top: 97.h,
                                                  child: CustomCard(
                                                    height: 19.h,
                                                    width: 45.w,
                                                    borderRadius: BorderRadius.circular(5),
                                                    cardColor: AppColors().mainColor2,
                                                    cardChild: Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 6.0.r),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            size: 15.r,
                                                            color: const Color(0xffFFD10C),
                                                          ),
                                                          CustomText(
                                                            text: "${product.averageRating}",
                                                            fontColor: Colors.white,
                                                            fontSize: 10.sp,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                CustomText(
                                                  text: "${product.name}",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                ),
                                                CustomText(
                                                  text: "",
                                                  fontColor: AppColors().mainColor2,
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/aa.png",
                                                      height: 13.h,
                                                      width: 13.w,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Image.asset(
                                                      "assets/images/ss.png",
                                                      height: 12.h,
                                                      width: 13.w,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    SizedBox(
                                                      width: 40.w,
                                                      child: CustomText(
                                                        text: "${product.time}",
                                                        fontSize: 10.sp,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width:150.w,
                                                  child: CustomText(
                                                    text: "${product.address}",
                                                    fontSize: 10..sp,
                                                    textOverflow: TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   width: 170.w,
                                                //   child: CustomText(
                                                //     text: product.address,
                                                //     textOverflow: TextOverflow.ellipsis,
                                                //     // text: "${product.marketName}",
                                                //     fontColor: const Color(0xff9B9B9B),
                                                //     fontWeight: FontWeight.w400,
                                                //     fontSize: 12.sp,
                                                //   ),
                                                // ),
                                                CustomText(
                                                  text: "Min.Order ${product.minimumOrderPrice} CFA",
                                                  fontColor: AppColors().mainColor2,
                                                  fontSize: 10.sp,

                                                )

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
                          SizedBox(height: 15.h),
                          // Container(
                          //   // padding: const EdgeInsets.only(left: 15),
                          //   height: 400.h,
                          //   width: 315.w,
                          //   child: ListView.builder(
                          //     shrinkWrap: true,
                          //     scrollDirection: Axis.vertical,
                          //     itemCount: 10,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       return GestureDetector(
                          //         onTap: () {
                          //           setState(() {
                          //             Get.to(StoreDetailScreen());
                          //             selectedIndex = index;
                          //           });
                          //         },
                          //         //  onTap: () {Get.to(SignUpScreen());},
                          //         child: Card(
                          //           child: Container(
                          //             height: 74.h,
                          //             width: 315.w,
                          //             decoration: BoxDecoration(
                          //               color: Colors.blue,
                          //               borderRadius: BorderRadius.circular(5.r),
                          //               boxShadow: [
                          //                 BoxShadow(
                          //                   offset: Offset(0, 0),
                          //                   blurRadius: 5.0,
                          //                   color: Color(0xffE5E5E5),
                          //                 ),
                          //               ],
                          //             ),
                          //             child: Row(
                          //               children: [
                          //                 Image.asset(
                          //                   "assets/images/burger_king.png",
                          //                   height: 58.h,
                          //                   width: 58.w,
                          //                   fit: BoxFit.fill,
                          //                 ),
                          //                 Column(
                          //                   crossAxisAlignment: CrossAxisAlignment.start,
                          //                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                   children: [
                          //                     CustomText(
                          //                       text: "Burger King",
                          //                       fontColor: Color(0xff444444),
                          //                       fontWeight: FontWeight.w500,
                          //                       fontSize: 12.sp,
                          //                     ),
                          //                     Row(
                          //                       children: [
                          //                         Icon(
                          //                           Icons.location_on_outlined,
                          //                           size: 7,
                          //                           color: Color(0xff9098B1),
                          //                         ),
                          //                         CustomText(
                          //                           text:
                          //                               "Majeedhee Magu Rd, Malé, Maldives",
                          //                           fontColor: Color(0xff444444),
                          //                           fontWeight: FontWeight.w400,
                          //                           fontSize: 7.sp,
                          //                         ),
                          //                       ],
                          //                     ),
                          //                     Padding(
                          //                       padding: const EdgeInsets.only(
                          //                               left: 10, right: 10, top: 15)
                          //                           .r,
                          //                       child: Row(
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment.spaceBetween,
                          //                         children: [
                          //                           const Icon(
                          //                             Icons.star,
                          //                             color: const Color(0xffFFC107),
                          //                             size: 6,
                          //                           ),
                          //                           // SizedBox(width: 16.w),
                          //                           CustomText(
                          //                             text: "4.5",
                          //                             fontColor: Color(0xff9A9A9A),
                          //                             fontWeight: FontWeight.w400,
                          //                             fontSize: 8.sp,
                          //                           ),
                          //                           Container(
                          //                             height: 20.h,
                          //                             width: 50.w,
                          //                             decoration: BoxDecoration(
                          //                                 color: Color(0xffEC2547),
                          //                                 borderRadius:
                          //                                     BorderRadius.circular(3.r)),
                          //                             child: Padding(
                          //                               padding: const EdgeInsets.only(
                          //                                       left: 15,
                          //                                       right: 15,
                          //                                       top: 5,
                          //                                       bottom: 5)
                          //                                   .r,
                          //                               child: InkWell(
                          //                                 onTap: () {
                          //                                   Get.to(OrderDetails());
                          //                                 },
                          //                                 child: CustomText(
                          //                                   textAlign: TextAlign.center,
                          //                                   text: "Details",
                          //                                   fontColor: Color(0xffFFFFFF),
                          //                                   fontWeight: FontWeight.w600,
                          //                                   fontSize: 9.sp,
                          //                                 ),
                          //                               ),
                          //                             ),
                          //                           )
                          //                         ],
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }

  CustomCard buildCustomCard(
    String text,
    String image,
  ) {
    return CustomCard(
      height: 65.h,
      width: 65.w,
      borderRadius: BorderRadius.circular(10.0.r),
      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 0.5, spreadRadius: 1)],
      cardColor: Colors.white,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 24.h,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.h),
          CustomText3(
            text: text,
            fontSize: 14.sp,
          )
        ],
      ),
    );
  }
}

List<String> foodGroupList = [
  "Dairy",
  "Pizza",
  "Breakfast",
  "Soups",
  "Solods",
  "Burger",
  "Chicken",
  "Meat",
];
List<int> ratingList = [1, 2, 3, 4, 5];
List<String> deliveryTypeList = ["All", "Derapidos Delivery", "Restaurant Delivery"];
List<String> priceRangeList = ["All", "CFA 10-30", "CFA 30-50", "CFA 50-70"];

class MyBottomSheet extends StatefulWidget {
  var homeController = Get.put(HomeController());

  MyBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  bool isSelected = false;
  bool isClicked = false;
  int? isSelect;
  int? selectFoodGroup;
  int? selectRating;
  int? selectDeliveryType;
  int? selectPrinceRange;
  final homeCont = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          height: 73.h,
          width: double.maxFinite,
          cardColor: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.black38, spreadRadius: 5, blurRadius: 5)],
          cardChild: Column(
            children: [
              SizedBox(height: 20.h),
              Container(
                height: 2,
                width: 40,
                color: Colors.grey,
              ),
              SizedBox(height: 20..h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23..w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.clear,
                        size: 30.r,
                        color: const Color(0xff9B9B9B),
                      ),
                    ),
                    CustomText(
                      text: "Filter & Sort",
                      fontSize: 16.sp,
                      fontColor: const Color(0xff9B9B9B),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 20..w, right: 20..w, top: 20..h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText2(
                  text: "Category",
                  fontSize: 16.sp,
                ),
                SizedBox(height: 14..h),
                Wrap(
                  // direction: Axis.horizontal,
                  spacing: 10..w,
                  children: List.generate(
                    homeCont.categories?.categories?.length ?? 0,
                    (index) {
                      return InkWell(
                        onTap: () {
                          homeCont.categoryIdName =
                              homeCont.categories!.categories![index].name.toString() ?? "";
                          homeCont.categoryIdF = homeCont.categories!.categories![index].id.toString() ?? "";
                          setState(() {
                            isSelect = index;
                          });
                        },
                        child: CustomCard(
                          cardColor: isSelect == index ? AppColors().mainColor2 : const Color(0xffF7F7F7),
                          boxShadow: const [BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 1)],
                          borderRadius: BorderRadius.circular(15..r),
                          cardChild: Padding(
                            padding: EdgeInsets.all(5.0..r),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: CircleAvatar(
                                    radius: 25.r,
                                    backgroundColor: Colors.green,
                                    child: Image.network(
                                      homeCont.categories!.categories![index].image ?? "",
                                      fit: BoxFit.fill,
                                      height: 80.h,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                CustomText2(
                                  text: homeCont.categories!.categories![index].name ?? "N/A",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontColor: isSelect == index ? Colors.white : Colors.black,
                                ),
                                SizedBox(width: 7.w),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 7..h),
                const Divider(),
                SizedBox(height: 7..h),
                CustomText2(
                  text: "Food Groups",
                  fontSize: 16.sp,
                ),
                SizedBox(height: 10..h),
                Wrap(
                  spacing: 10,
                  runSpacing: 20.w,
                  children: List.generate(
                    foodGroupList.length,
                    (index) => InkWell(
                      onTap: () {
                        setState(() {
                          selectFoodGroup = index;
                        });
                      },
                      child: CustomCard(
                        cardColor: selectFoodGroup == index ? AppColors().mainColor2 : Colors.white,
                        border: Border.all(
                          color: selectFoodGroup == index ? AppColors().mainColor2 : const Color(0xff9B9B9B),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        cardChild: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                          child: CustomText(
                            text: foodGroupList[index],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5..h),
                const Divider(),
                SizedBox(height: 7..h),
                CustomText2(
                  text: "Rating",
                  fontSize: 18.sp,
                ),
                SizedBox(height: 10..h),
                Wrap(
                  spacing: 15,
                  runSpacing: 20,
                  children: List.generate(
                    5,
                    (index) {
                      return InkWell(
                        onTap: () {
                          print(homeCont.rating);
                          homeCont.rating = "${index + 1}";
                          setState(() {
                            selectRating = index;
                          });
                        },
                        child: CustomCard(
                          height: 33.h,
                          width: 52.w,
                          cardColor: selectRating == index ? AppColors().mainColor2 : const Color(0xffF0F0F0),
                          borderRadius: BorderRadius.circular(10),
                          cardChild: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 8.h),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: ratingList[index].toString(),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  fontColor: selectRating == index ? Colors.white : Colors.black,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 17.r,
                                  color: const Color(0xffFFA412),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 7.h),
                const Divider(),
                SizedBox(height: 10.h),
                CustomText2(
                  text: "Delivery Type",
                  fontSize: 18.sp,
                ),
                SizedBox(height: 10..h),
                Wrap(
                  spacing: 12,
                  runSpacing: 10,
                  children: List.generate(
                    deliveryTypeList.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          print(homeCont.deliveryType);
                          if (index == 0) {
                            homeCont.deliveryType = "ALL";
                          } else if (index == 1) {
                            homeCont.deliveryType = "Derapidos Delivery";
                          } else {
                            homeCont.deliveryType = "Restaurant Delivery";
                          }
                          setState(() {
                            selectDeliveryType = index;
                          });
                        },
                        child: CustomCard(
                          cardColor: selectDeliveryType == index ? AppColors().mainColor2 : Colors.white,
                          border: Border.all(
                            color: const Color(0xff9B9B9B),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          cardChild: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            child: CustomText(
                              text: deliveryTypeList[index],
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontColor: selectDeliveryType == index ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10..h),
                const Divider(),
                SizedBox(height: 10..h),
                CustomText2(
                  text: "Price range",
                  fontSize: 18.sp,
                ),
                SizedBox(height: 10..h),
                Wrap(
                  spacing: 12,
                  runSpacing: 10,
                  children: List.generate(
                    priceRangeList.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          print(homeCont.priceRange);
                          if (index == 0) {
                            homeCont.priceRange = "ALL";
                          } else if (index == 1) {
                            homeCont.priceRange = "10-30";
                          } else if (index == 2) {
                            homeCont.priceRange = "30-50";
                          } else {
                            homeCont.priceRange = "50-70";
                          }
                          setState(() {
                            selectPrinceRange = index;
                          });
                        },
                        child: CustomCard(
                          cardColor: selectPrinceRange == index ? AppColors().mainColor2 : Colors.white,
                          border: Border.all(
                            color: const Color(0xff9B9B9B),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          cardChild: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            child: CustomText(
                              text: priceRangeList[index],
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontColor: selectPrinceRange == index ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 55..h),
                InkWell(
                  onTap: () {
                    setState(() {});
                    homeCont.getSuggestedProducts();
                    Get.back();
                  },
                  child: CustomCard(
                    height: 53.h,
                    width: double.maxFinite,
                    borderRadius: BorderRadius.circular(15),
                    cardColor: AppColors().mainColor2,
                    cardChild: Center(
                      child: CustomText3(
                        text: "Apply Filter",
                        fontColor: Colors.white,
                        fontSize: 19.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20..h)
              ],
            ),
          ),
        )
      ],
    );
  }
}
