import 'dart:developer';

import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/View/Product%20Details/product_details.dart';
import 'package:derapidos/View/Store%20Details/store_detail_screen.dart';
import 'package:derapidos/controllers/favorites_controller.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/models/favorite_products.dart';
import 'package:derapidos/models/favouriteproduct.dart';
import 'package:derapidos/models/homepageproduct/homepageproducts.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../component/custom_card.dart';
import '../../consts/app_consts.dart';
import '../Custom Widget/custom_text.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<String> images = ["assets/images/shop.png"];
  int? selectedIndex = 0;
  int checkedIndex = 0;
  List cardNames = [
    'Sports',
    'Wild Life',
    'Night',
    'LandSpace',
  ];
  var favouritecontroller = Get.put(FavoritesController());
  var homeController = Get.put(HomeController());

  @override
  initState() {
    super.initState();
    nextScreen();
    // favoritesController.getFavoriteProducts();
  }

  nextScreen() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      Get.to(LoginScreen());
    } else {
      //favouritecontroller.loading.value = true;
      favouritecontroller.getFavourite();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesController>(
      builder: (favouritecontroller) {
        return favouritecontroller.loading.value
            ? const Scaffold(body: Center(child: CircularProgressIndicator()))
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
                    padding: const EdgeInsets.only(top: 10).r,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Favourite",
                                fontColor: const Color(0xff444444),
                                fontWeight: FontWeight.w500,
                                fontSize: 24.sp,
                              ),
                              SizedBox(width: 50.w),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10.h),
                            // scrollDirection: Axis.horizontal,
                            itemCount:
                                favouritecontroller.favouriteProduct?.favouriteList?.favmodel?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              Favmodel fav =
                                  favouritecontroller.favouriteProduct!.favouriteList!.favmodel![index];
                              return GestureDetector(
                                onTap: () {
                                  selectedIndex = index;
                                  setState(() {});
                                  homeController.currentRestaurantId = fav.id.toString();
                                  Get.to(const StoreDetailScreen());
                                },
                                child: Container(
                                  width: 300.w,
                                  height: 165.h,
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
                                                  "${fav.logo}",
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
                                                          await UserPreferences.getLoginCheck() ?? false;
                                                      if (isLogin == false) {
                                                        Get.to(const LoginScreen());
                                                      } else {
                                                        if (fav.favourite == 1) {
                                                          fav.favourite = 0;
                                                        } else {
                                                          fav.favourite = 1;
                                                        }
                                                        setState(() {});
                                                        favouritecontroller.restaurantIDFF =
                                                            fav.id.toString();
                                                        favouritecontroller.addRemoveFavorite();
                                                      }
                                                    },
                                                    child: SizedBox(
                                                        height: 20.h,
                                                        child: fav.favourite == 0
                                                            ? Image.asset("assets/images/like0.png")
                                                            : Image.asset("assets/images/like2.png")),
                                                  ),
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
                                                  padding:
                                                      EdgeInsets.symmetric(horizontal: 6.0.r, vertical: 3.h),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        size: 15.r,
                                                        color: const Color(0xffFFD10C),
                                                      ),
                                                      CustomText(
                                                        text: "${fav.averageRating}",
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
                                              text: "${fav.name}",
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
                                                    text: "12 mint",
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
                                                text: "${fav.address}",
                                                textOverflow: TextOverflow.ellipsis,
                                                fontSize: 10..sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            CustomText(
                                              text: "Min.Order ${fav.minimumOrderPrice} CFA",
                                              fontSize: 10.sp,
                                              fontColor: AppColors().mainColor2,
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
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
