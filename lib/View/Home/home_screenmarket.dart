import 'dart:convert';

import 'package:derapidos/View/Home/getstorehomebycategory.dart';
import 'package:derapidos/View/Home/image_slider.dart';
import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/View/Orders/orders_screen.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:derapidos/consts/app_consts.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/models/homepageproduct/homepageproducts.dart';
import 'package:derapidos/models/marketcategory.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Custom Widget/custom_text.dart';
import '../store_detail1/store_detail_screen1.dart';

class HomeScreenMarket extends StatefulWidget {
  const HomeScreenMarket({Key? key}) : super(key: key);

  @override
  State<HomeScreenMarket> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenMarket> {
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
      homeController.getHomeData();
    } else {
      //log('uytrtyuiolkjhgcvbnm');
      UserProfile? userProfile;
      String? data = UserPreferences.getUserData();
      if (data != null) {
        userProfile = UserProfile.fromJson(jsonDecode(data!));
      } else {}
      homeController.userIDCheck = '${userProfile?.userData?.id}';
      homeController.getHomeData1();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return homeController.loading.value
            ? CircularProgressIndicator()
            : Scaffold(
          backgroundColor: Color(0xF8F8F8F4),
          appBar: AppBar(
                  titleSpacing: 0,
                  centerTitle: true,
                  title: Image.asset(
                    "assets/images/martlogo.png",
                    height: 59..h,
                    width: 190..w,
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: const Color(0xff95006F),
                  toolbarHeight: 40.h,
                ),
                // backgroundColor: Colors.white,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(top: 2),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                                child: Row(children: [
                                  Flexible(
                                    child: Container(
                                      height: 30.h,
                                      width: 300.w,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFFFFFF),
                                        borderRadius: BorderRadius.circular(10.0.r),
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(0, 0),
                                            blurRadius: 5.0,
                                            spreadRadius: 0.0,
                                            color: Color(0xffE5E5E5),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: CustomText(
                                                  text: homeController.address.value,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Container(
                                    height: 30.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.circular(10.0.r),
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xffE5E5E5),
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 0),
                                          blurRadius: 5.0,
                                          spreadRadius: 0.0,
                                          color: Color(0xffE5E5E5),
                                        ),
                                      ],
                                    ),
                                    child: ImageIcon(
                                      const AssetImage(
                                        "assets/images/Notificaton.png",
                                      ),
                                      color: AppColors().mainColor2,
                                      size: 18,
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          ImageSlider(
                            bannerImages: homeController.banners!.bannerList!,
                            // bannerImages:
                            //     homeController.banners!.bannerList!.map((e) => e.bannerImage).toList(),
                          ),

                          Visibility(
                            visible: homeController.activeOrderMarketDetailModel == null ||
                                    homeController
                                        .activeOrderMarketDetailModel!.activeOrderMarketDetail!.isEmpty
                                ? false
                                : true ?? false,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                              child: Card(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 40.h,
                                      width: double.infinity,
                                      color: const Color(0xff95006F),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Container(
                                                height: 25.h,
                                                width: 25.w,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle, color: Colors.white),
                                                child: Center(
                                                  child: CustomText(
                                                    text: homeController.activeOrderMarketDetailModel
                                                            ?.activeOrderMarketDetail?.length
                                                            .toString() ??
                                                        "0",
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              const CustomText(
                                                text: "Track Orders",
                                                fontColor: Colors.white,
                                              ),
                                            ],
                                          ),
                                          // Padding(
                                          //   padding:  EdgeInsets.only(right:10.0.w),
                                          //   child: Icon(Icons.arrow_forward_ios_rounded,
                                          //     size: 22,
                                          //       color: Colors.white
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    ),
                                    homeController.activeOrderMarketDetailModel != null
                                        ? homeController.activeOrderMarketDetailModel?.activeOrderMarketDetail
                                                    ?.length !=
                                                0
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 30.h,
                                                          width: 30.w,
                                                          decoration: const BoxDecoration(
                                                              shape: BoxShape.circle, color: Colors.yellow),
                                                          child: Center(
                                                            child: CustomText(
                                                                text: homeController
                                                                            .activeOrderMarketDetailModel
                                                                            ?.activeOrderMarketDetail
                                                                            ?.first
                                                                            .deliveryType ==
                                                                        "Restaurant Delivery"
                                                                    ? "R"
                                                                    : "B",
                                                                fontColor: Colors.white),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const CustomText(
                                                              text: "Delivered",
                                                              fontColor: Colors.yellow,
                                                            ),
                                                            CustomText(
                                                              text: homeController
                                                                      .activeOrderMarketDetailModel
                                                                      ?.activeOrderMarketDetail
                                                                      ?.first
                                                                      .name ??
                                                                  "",
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Get.to(OrdersScreen());
                                                      },
                                                      child: const Icon(
                                                        Icons.arrow_forward_ios_rounded,
                                                        size: 22,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : Container()
                                        : Container()
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: CustomCard(
                              height: 35.h,
                              borderRadius: BorderRadius.circular(10.0.r),
                              boxShadow: const [
                                BoxShadow(color: Colors.black12, blurRadius: 0.5, spreadRadius: 1)
                              ],
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
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'DMSans',
                                        ),
                                        prefixIcon:
                                            Icon(Icons.search, size: 25, color: AppColors().mainColor2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            child: homeController.homepagecategory!.value.data!.isEmpty
                                ? const Center(
                                    child: CustomText(
                                      text: "No Super Market",
                                    ),
                                  )
                                : Container(
                                    height: 100.h,
                                    child: ListView.separated(
                                      separatorBuilder: (BuildContext context, int index) {
                                        return SizedBox(width: 8.w);
                                      },
                                      shrinkWrap: true,
                                      padding: EdgeInsets.only(top: 7.h),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: homeController.homepagecategory!.value.data!.length,
                                      // 10,
                                      itemBuilder: (BuildContext context, int index) {
                                        MarketCategoriesData? product =
                                            homeController.homepagecategory!.value.data![index];
                                        return GestureDetector(
                                          onTap: () {
                                            selectedIndex = index;
                                            setState(() {});
                                            //var homeController = Get.put(HomeController());
                                            homeController.categorytypeid =
                                                homeController.currentRestaurantId = product.id.toString();
                                            Get.to(const GetStoreHomebyCategory());
                                          },
                                          child: Container(
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Colors.black12,
                                                      spreadRadius: 0.2,
                                                      blurRadius: 0.5)
                                                ],
                                                borderRadius: BorderRadius.circular(10)),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 100.w,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(10),
                                                      topRight: Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 70.h,
                                                        width: double.maxFinite,
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(10),
                                                            topRight: Radius.circular(10),
                                                          ),
                                                          child: Image.network(
                                                            "${product.image}",
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      CustomText(
                                                        text: product.name,
                                                        textOverflow: TextOverflow.ellipsis,
                                                        // text: "${product.marketName}",
                                                        fontColor: const Color(0xff9B9B9B),
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 12.sp,
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

                          SizedBox(height: 15.h),

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
                                    homeController.categorytype = "2";
                                    homeController.markettype = "Popular Restaurants";
                                    homeController.restaurant_sub_type = "";
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
                                      Get.to(const StoreDetailScreen1());
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
                                                  fontSize: 10.sp,
                                                  fontColor: AppColors().mainColor2,
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
                                    homeController.categorytype = "2";
                                    homeController.markettype = "Discounted Restaurants";
                                    homeController.restaurant_sub_type = "";
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
                                      Get.to(const StoreDetailScreen1());
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText2(
                                  text: "Nearby Super Market",
                                  fontColor: const Color(0xff262525),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          SizedBox(
                            //height: 300.h, // 400.h,
                            width: double.infinity.w,
                            child: homeController.homepageproduct!.value.data!.nearbyRestaurants!.isEmpty
                                ? const Center(
                              child: CustomText(
                                text: "No Restaurants",
                              ),
                            )
                                : ListView.builder(
                              padding: EdgeInsets.only(left: 15..w, right: 10..w),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                              homeController.homepageproduct!.value.data!.nearbyRestaurants!.length,
                              // 10,
                              itemBuilder: (BuildContext context, int index) {
                                var restaurant = homeController
                                    .homepageproduct!.value.data!.nearbyRestaurants![index];
                                return GestureDetector(
                                  onTap: () {
                                    selectedIndex = index;
                                    setState(() {});
                                    homeController.currentRestaurantId = restaurant.id.toString();
                                    Get.to(const StoreDetailScreen1());
                                  },
                                  //  onTap: () {Get.to(SignUpScreen());},

                                  child: Column(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                offset: Offset(0, 0),
                                                blurRadius: 5.0,
                                                spreadRadius: 2,
                                                color: Color(0xffE5E5E5),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(width: 6.w),
                                              Stack(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(.0),
                                                    child: SizedBox(
                                                      height: 70.h,
                                                      width: 80.w,
                                                      child: ClipRRect(
                                                        borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(10),
                                                          bottomLeft: Radius.circular(10),
                                                          topRight: Radius.circular(10),
                                                          bottomRight: Radius.circular(10),
                                                        ),
                                                        child: Image.network(
                                                          "${restaurant.logo}",
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 5.h,
                                                    left: 5.w,
                                                    child: CircleAvatar(
                                                      radius: 7.r,
                                                      backgroundColor: Colors.red,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          vertical: 10..h, horizontal: 10..w),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: 195..w,
                                                              child: Row(
                                                                children: [
                                                                  CustomText(
                                                                    // text: "${restaurant.name}",
                                                                    text: "${restaurant.name}",
                                                                    fontColor: const Color(0xff262525),
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 16.sp,
                                                                  ),
                                                                  Flexible(
                                                                    child: CustomText(
                                                                      text: "",
                                                                      textOverflow:
                                                                      TextOverflow.ellipsis,
                                                                      fontColor:
                                                                      const Color(0xff262525),
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 16.sp,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            const Spacer(flex: 5),
                                                            CustomCard(
                                                                height: 20.h,
                                                                // width: 89.w,
                                                                borderRadius: BorderRadius.circular(7),
                                                                cardColor: AppColors().mainColor2,
                                                                cardChild: Row(
                                                                  children: [
                                                                    SizedBox(width: 4.w),
                                                                    Image.asset(
                                                                      "assets/images/aa.png",
                                                                      height: 13.h,
                                                                      width: 13.w,
                                                                    ),
                                                                    SizedBox(width: 4.w),
                                                                    Image.asset(
                                                                      "assets/images/ss.png",
                                                                      height: 12.h,
                                                                      width: 13.w,
                                                                      color: Colors.white,
                                                                    ),
                                                                    SizedBox(width: 4.w),
                                                                    CustomText(
                                                                      text: restaurant.time,
                                                                      fontSize: 10.sp,
                                                                      fontColor: Colors.white,
                                                                      fontWeight: FontWeight.w500,
                                                                    ),
                                                                    SizedBox(width: 4.w)
                                                                  ],
                                                                )),
                                                          ]),
                                                    ),
                                                    // SizedBox(height: 5.w),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10..w),
                                                      child: Row(
                                                        children: [
                                                          CustomText(
                                                            text:
                                                            "Min. Order ${restaurant.minimumOrderPrice} CFA",
                                                            // text: "\$4.00",

                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 12.sp,
                                                          ),
                                                          SizedBox(width: 10.w),
                                                          const Icon(
                                                            Icons.star,
                                                            color: Color(0xffFFC107),
                                                            size: 12,
                                                          ),
                                                          // SizedBox(width: 16.w),
                                                          CustomText(
                                                            text: "${restaurant.averageRating}",
                                                            // text: "4.5",

                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 12.sp,
                                                          ),
                                                          SizedBox(width: 10.w),
                                                          CustomText(
                                                            text: restaurant.distance,
                                                            // "${restaurant.distance} mins",
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 12.sp,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // SizedBox(height: 10.h),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10..w, top: 7..h, bottom: 10..h),
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.location_on_outlined,
                                                            size: 15,
                                                            color: Color(0xff262525),
                                                          ),
                                                          SizedBox(width: 5.w),
                                                          SizedBox(
                                                            width: 100.w,
                                                            child: CustomText(
                                                              text: "${restaurant.address}",
                                                              textOverflow: TextOverflow.ellipsis,
                                                              //  text: "Majeedhee Magu Rd, Malé, Maldives",
                                                              fontColor: const Color(0xff262525),
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 10.sp,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          CustomCard(
                                                            height: 20.h,
                                                            // width: 89.w,
                                                            borderRadius: BorderRadius.circular(7),
                                                            cardChild: Row(
                                                              children: [
                                                                SizedBox(width: 4.w),
                                                                Image.asset(
                                                                  "assets/images/like0.png",
                                                                  height: 20.h,
                                                                  width: 20.w,
                                                                ),
                                                                SizedBox(width: 4.w),
                                                                SizedBox(width: 4.w),
                                                                CustomText(
                                                                  text: restaurant.time,
                                                                  fontSize: 10.sp,
                                                                  fontColor: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                                SizedBox(width: 4.w)
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 32.h),
                                                ],
                                              ),
                                            ],
                                          )),
                                      const SizedBox(height: 35)
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
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
      height: 75.h,
      width: 75.w,
      borderRadius: BorderRadius.circular(10.0.r),
      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 0.5, spreadRadius: 1)],
      cardColor: Colors.white,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 35.h,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5.h),
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
                                    radius: 17.r,
                                    backgroundColor: Colors.white,
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
