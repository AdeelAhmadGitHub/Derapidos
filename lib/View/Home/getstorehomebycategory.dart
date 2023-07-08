import 'dart:convert';
import 'package:derapidos/component/custom_card.dart';
import 'package:derapidos/consts/app_consts.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Custom Widget/custom_text.dart';
import '../store_detail1/store_detail_screen1.dart';

class GetStoreHomebyCategory extends StatefulWidget {
  const GetStoreHomebyCategory({Key? key}) : super(key: key);

  @override
  State<GetStoreHomebyCategory> createState() => _GetStoreHomebyCategory();
}
class _GetStoreHomebyCategory extends State<GetStoreHomebyCategory> {
  int? selectedIndex;
  int checkedIndex = 0;
  var homeController = Get.put(HomeController());
  String addres = "";


  @override
  initState() {
    gotcallf();
    super.initState();
    //homeController.getHomeData();
  }

  gotcallf() async {
    homeController.loading.value = true;
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      homeController.userIDCheck = "";
      homeController.getHomeData();
    } else {
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
            ? const Scaffold(body: Center(child: CircularProgressIndicator()))
            : Scaffold(
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
                // backgroundColor: Colors.white,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                                child: Row(children: [
                                  SizedBox(width: 10.w),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: CustomCard(
                              height: 45.h,
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
                                          fontSize: 14.sp,
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

                          SizedBox(height: 10.h),

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
                                      text: "No Super Market",
                                    ),
                                  )
                                : GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 4.0,
                                        mainAxisSpacing: 4.0,
                                        childAspectRatio: 0.8),
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

                                        child: Container(
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
                                            child: Column(
                                              children: [
                                                Stack(
                                                  children: [
                                                    SizedBox(
                                                      height: 80.h,
                                                      width: double.maxFinite,
                                                      child: ClipRRect(
                                                        borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(10),
                                                          topRight: Radius.circular(10),
                                                        ),
                                                        child: Image.network(
                                                          "${restaurant.logo}",
                                                          fit: BoxFit.cover,
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
                                                // SizedBox(width: 10.w),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            CustomText(
                                                              // text: "${restaurant.name}",
                                                              text: "${restaurant.name}",
                                                              fontColor: const Color(0xff262525),
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 10.sp,
                                                            ),
                                                            // const Spacer(flex: 5),
                                                            CustomCard(
                                                                height: 18.h,
                                                                // width: 89.w,
                                                                borderRadius: BorderRadius.circular(7),
                                                                cardColor: AppColors().mainColor2,
                                                                cardChild: Row(
                                                                  children: [
                                                                    SizedBox(width: 2.w),
                                                                    Image.asset(
                                                                      "assets/images/rrr.png",
                                                                      height: 10.h,
                                                                      width: 10.w,
                                                                    ),
                                                                    SizedBox(width: 2.w),
                                                                    Image.asset(
                                                                      "assets/images/ss.png",
                                                                      height: 10.h,
                                                                      width: 10.w,
                                                                      color: Colors.white,
                                                                    ),
                                                                    SizedBox(width: 2.w),
                                                                    CustomText(
                                                                      text: restaurant.time,
                                                                      fontSize: 8.sp,
                                                                      fontColor: Colors.white,
                                                                      fontWeight: FontWeight.w500,
                                                                    ),
                                                                    SizedBox(width: 4.w)
                                                                  ],
                                                                )),
                                                          ]),
                                                      SizedBox(height: 5.w),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.location_on_outlined,
                                                            size: 15,
                                                            color: Color(0xff262525),
                                                          ),
                                                          SizedBox(
                                                            width: 90.w,
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
                                                            height: 18.h,
                                                            // width: 89.w,
                                                            borderRadius: BorderRadius.circular(7),
                                                            cardColor: AppColors().mainColor2,
                                                            cardChild: Row(
                                                              children: [
                                                                SizedBox(width: 2.w),
                                                                Image.asset(
                                                                  "assets/images/aa.png",
                                                                  height: 10.h,
                                                                  width: 10.w,
                                                                ),
                                                                SizedBox(width: 2.w),
                                                                Image.asset(
                                                                  "assets/images/ss.png",
                                                                  height: 10.h,
                                                                  width: 10.w,
                                                                  color: Colors.white,
                                                                ),
                                                                SizedBox(width: 2.w),
                                                                CustomText(
                                                                  text: restaurant.time,
                                                                  fontSize: 8.sp,
                                                                  fontColor: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                                SizedBox(width: 4.w)
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 5.h),
                                                      Row(
                                                        children: [
                                                          CustomText(
                                                            text:
                                                                "Min.Order ${restaurant.minimumOrderPrice} CFA",
                                                            // text: "\$4.00",

                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 12.sp,
                                                          ),
                                                          // SizedBox(width: 13.w),
                                                          Spacer(),
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
                                                          // SizedBox(width: 10.w),
                                                          CustomText(
                                                            text: restaurant.distance,
                                                            // "${restaurant.distance} mins",
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 20.h),
                                                  ],
                                                ),
                                              ],
                                            )),
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
