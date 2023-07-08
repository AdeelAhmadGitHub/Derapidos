import 'dart:convert';

import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../consts/app_consts.dart';
import '../../../controllers/r_s_controller/home_controller.dart';
import '../../../controllers/satrt_controller.dart';
import '../../../models/real_estate_models/HomeModel.dart';
import '../../../models/real_estate_models/type_model.dart';
import '../../Custom Widget/custom_text.dart';
import '../details/details_screen.dart';
import '../filter/filter_screen.dart';
import '../near_from_you/near_from_you_screen.dart';
import '../recommended/recommended_screen.dart';

class RSHomeScreen extends StatefulWidget {
  RSHomeScreen({super.key});

  @override
  State<RSHomeScreen> createState() => _RSHomeScreenState();
}

class _RSHomeScreenState extends State<RSHomeScreen> {
  final _controller = Get.put(RSHomeController());

  final homeController = Get.put(StartController());

  UserProfile? userProfile;
  String? username = "";
  String? idcategory = "";
  gotcallf() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      // _controller.userID = "";
      // _controller.listing_type = "";
      // _controller.category_id = idcategory;
      // _controller.price_min = "";
      // _controller.price_max = "";
      // _controller.statusIsfurneshed = "";
      // _controller.bedrooms = "";
      // _controller.bathrooms = "";
      // _controller.area_unit = "";
      // _controller.area_start = "";
      // _controller.area_end = "";
      _controller.getAllData();
      print("adeel");
    } else {
      String? data = UserPreferences.getUserData();
      if (data != null) {
        userProfile = UserProfile.fromJson(jsonDecode(data!));
      } else {}
      username = userProfile?.userData?.name;
      _controller.userID = '${userProfile?.userData?.id}';
      // _controller.listing_type = "";
      // _controller.category_id = idcategory;
      // _controller.price_min = "";
      // _controller.price_max = "";
      // _controller.statusIsfurneshed = "";
      // _controller.bedrooms = "";
      // _controller.bathrooms = "";
      // _controller.area_unit = "";
      // _controller.area_start = "";
      // _controller.area_end = "";
      _controller.getAllData();
    }
  }

  @override
  initState() {
    gotcallf();
    super.initState();
  }

  int? nSelectIndex;
  int? rSelectIndex;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RSHomeController>(builder: (controller) {
      return controller.rsHomeLoader
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors().mainColor2,
                titleSpacing: 0,
                title: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 19..h, left: 10..w, right: 10..w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Hi ${username}",
                                fontColor: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 10.r,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 3.w),
                                  CustomText(
                                    text: homeController.address.value,
                                    fontColor: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/images/Notificaton.png",
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
                automaticallyImplyLeading: false,
                toolbarHeight: 40.h,
              ),
              body: Column(
                children: [
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Container(
                            height: 45..h,
                            decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 2)
                                ]),
                            child: TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                fillColor: Colors.white,
                                // filled: true,
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: const Color(0xffC0C0C0),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'DMSans',
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 25,
                                  color: AppColors().mainColor2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () => Get.to(RSFilterScreen()),
                          child: Container(
                            height: 45..h,
                            width: 45..w,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10.0.r),
                              border: Border.all(
                                  // width: 1,
                                  color: const Color(0xffE5E5E5)),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  AppColors().mainColor2.withOpacity(0.5),
                                  AppColors().mainColor2.withOpacity(0.9),
                                ],
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
                            child: Padding(
                              padding: EdgeInsets.all(13.0.r),
                              child: Image.asset(
                                "assets/images/filter.png",
                                height: 10..h,
                                width: 10..w,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20..h),
                  SizedBox(
                    height: 40.h,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 10.w),
                      itemCount: types.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Obx(
                        () => Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.selectedIndex.value = index;
                                int? cataGoryid;
                                cataGoryid = controller.selectedIndex.value + 1;

                                idcategory = cataGoryid.toString();
                                gotcallf();
                                print(idcategory);
                              },
                              child: CustomCard(
                                cardColor: index == controller.selectedIndex.value
                                    ? AppColors().mainColor2
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                  ),
                                ],
                                cardChild: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15.h,
                                        width: 15.w,
                                        child: Image.asset(
                                          types[index].image,
                                          color: controller.selectedIndex.value == index
                                              ? Colors.white
                                              : Colors.black.withOpacity(0.5),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      CustomText(
                                        text: types[index].text,
                                        fontColor: controller.selectedIndex.value == index
                                            ? Colors.white
                                            : Colors.black.withOpacity(0.5),
                                        fontSize: 16.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10..h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10..w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Near from you",
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.reViewValue = "Nearby";
                                    Get.to(NearFromYouScreen());
                                  },
                                  child: CustomText(
                                    text: "View all",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontColor: AppColors().mainColor2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 250.h,
                            child: ListView.builder(
                                itemCount: controller.rsHomeData!.nearByListing!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  NearByListing nearFromYou = controller.rsHomeData!.nearByListing![index];
                                  return Row(
                                    children: [
                                      SizedBox(width: 10.w),
                                      InkWell(
                                        onTap: () {
                                          nSelectIndex = index;
                                          setState(() {});
                                          controller.userID = nearFromYou.userId.toString();
                                          controller.nTitle = nearFromYou.title.toString();
                                          controller.postedUserId = nearFromYou.userId.toString();
                                          controller.nPrice = nearFromYou.price.toString();
                                          controller.nBath = nearFromYou.bathrooms.toString();
                                          controller.nBed = nearFromYou.bedrooms.toString();
                                          controller.nArea = nearFromYou.area.toString();
                                          controller.nImages = nearFromYou.images;
                                          controller.nFeatures = nearFromYou.features;
                                          controller.nPostedPersonName = nearFromYou.name;
                                          controller.nPostedPersonPhone = nearFromYou.phone;
                                          controller.nPostedPersonProfilePic = nearFromYou.profilePic;
                                          controller.nCreatedAt = nearFromYou.createdAt;
                                          controller.nAdress = nearFromYou.address;
                                          controller.nDescription = nearFromYou.description;
                                          controller.nType = nearFromYou.type;
                                          controller.checkProfileDetail = "";
                                          controller.checkMyAdds = "";
                                          Get.to(RSDetailScreen());
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 5),
                                          child: CustomCard(
                                            // height: 230.h,
                                            width: 244..w,
                                            cardColor: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)
                                            ],
                                            cardChild: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                // SizedBox(height: 8.h)
                                                Stack(
                                                  children: [
                                                    SizedBox(
                                                      height: 140.h,
                                                      width: double.infinity,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(10),
                                                        child: Image.network(
                                                          nearFromYou.images![0],
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 8.w, vertical: 10.h),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          CustomCard(
                                                            height: 21.h,
                                                            width: 59.w,
                                                            cardColor: Colors.white,
                                                            borderRadius: BorderRadius.circular(7),
                                                            cardChild: Center(
                                                              child: CustomText(
                                                                text: nearFromYou.type,
                                                                fontSize: 15.sp,
                                                                fontColor: AppColors().mainColor2,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(height: 10..h),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          CustomText(
                                                            text: nearFromYou.title,
                                                            fontSize: 15.sp,
                                                            fontWeight: FontWeight.w700,
                                                          ),
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
                                                                if (nearFromYou.favorite == 1) {
                                                                  nearFromYou.favorite = 0;
                                                                } else {
                                                                  nearFromYou.favorite = 1;
                                                                }
                                                                setState(() {});
                                                                controller.realestateIDF =
                                                                    nearFromYou.id.toString();
                                                                controller.addRemoveFavorite();
                                                              }
                                                            },
                                                            child: SizedBox(
                                                                height: 20.h,
                                                                child: nearFromYou.favorite == 0
                                                                    ? Image.asset("assets/images/short.png")
                                                                    : Image.asset("assets/images/like2.png")),
                                                          ),
                                                        ],
                                                      ),
                                                      CustomText(
                                                        text: nearFromYou.price.toString(),
                                                        fontSize: 15.sp,
                                                        fontWeight: FontWeight.w700,
                                                        fontColor: AppColors().mainColor2,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                "assets/images/bed.png",
                                                                height: 20.h,
                                                                width: 20.w,
                                                              ),
                                                              SizedBox(width: 5.w),
                                                              CustomText(
                                                                text: nearFromYou.bedrooms,
                                                                fontSize: 14.sp,
                                                                fontWeight: FontWeight.w400,
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(width: 20.w),
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                "assets/images/bathtub.png",
                                                                height: 20.h,
                                                                width: 20.w,
                                                              ),
                                                              SizedBox(width: 5.w),
                                                              CustomText(
                                                                text: nearFromYou.bathrooms,
                                                                fontSize: 14.sp,
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(width: 20.w),
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                "assets/images/area.png",
                                                                height: 20.h,
                                                                width: 20.w,
                                                              ),
                                                              SizedBox(width: 5.w),
                                                              CustomText(
                                                                text: '${nearFromYou.area![0]}' +
                                                                    '${nearFromYou.area![0]}',
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 7..h),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.location_on,
                                                            size: 10.r,
                                                          ),
                                                          SizedBox(width: 5.w),
                                                          SizedBox(
                                                            width: 129.w,
                                                            child: CustomText(
                                                              text: nearFromYou.address,
                                                              fontSize: 10.sp,
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                          SizedBox(height: 10..h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10..w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Recommended For You",
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.reViewValue = "Recommended";
                                    Get.to(NearFromYouScreen());
                                  },
                                  child: CustomText(
                                    text: "View all",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontColor: AppColors().mainColor2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 7..h),
                          ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.rsHomeData!.recommendedListing!.length,
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(height: 10..h);
                              },
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 10..w, vertical: 10..h),
                              itemBuilder: (context, index) {
                                RecommendedListing recommendFromYou =
                                    controller.rsHomeData!.recommendedListing![index];
                                return InkWell(
                                  onTap: () {
                                    // rSelectIndex = index;
                                    setState(() {});
                                    controller.userID = recommendFromYou.userId.toString();
                                    controller.nTitle = recommendFromYou.title.toString();
                                    controller.postedUserId = recommendFromYou.userId.toString();
                                    controller.nPrice = recommendFromYou.price.toString();
                                    controller.nBath = recommendFromYou.bathrooms.toString();
                                    controller.nBed = recommendFromYou.bedrooms.toString();
                                    controller.nArea = recommendFromYou.area.toString();
                                    controller.nImages = recommendFromYou.images;
                                    controller.nFeatures = recommendFromYou.features;
                                    controller.nPostedPersonName = recommendFromYou.name;
                                    controller.nPostedPersonPhone = recommendFromYou.phone;
                                    controller.nPostedPersonProfilePic = recommendFromYou.profilePic;
                                    controller.nCreatedAt = recommendFromYou.createdAt;
                                    controller.nAdress = recommendFromYou.address;
                                    controller.nDescription = recommendFromYou.description;
                                    controller.nType = recommendFromYou.type;
                                    Get.to(RSDetailScreen());
                                  },
                                  child: CustomCard(
                                    height: 120.h,
                                    width: 244.w,
                                    cardColor: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)
                                    ],
                                    cardChild: Row(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 8.h),
                                        Stack(
                                          children: [
                                            SizedBox(
                                              width: 113.w,
                                              height: double.maxFinite,
                                              child: ClipRRect(
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  bottomLeft: Radius.circular(8),
                                                ),
                                                child: Image.network(
                                                  recommendFromYou.images![0],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 4.h,
                                              left: 50.w,
                                              child: CustomCard(
                                                  height: 21.h,
                                                  width: 59.w,
                                                  cardColor: Colors.white,
                                                  borderRadius: BorderRadius.circular(7),
                                                  cardChild: Center(
                                                    child: CustomText(
                                                      text: recommendFromYou.type,
                                                      fontSize: 15.sp,
                                                      fontColor: AppColors().mainColor2,
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    CustomText(
                                                      text: recommendFromYou.title,
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        print("EVEy thing Good");
                                                        debugPrint("GVJHBKJNBLK");
                                                        bool? isLogin =
                                                            await UserPreferences.getLoginCheck() ?? false;
                                                        if (isLogin == false) {
                                                          Get.to(const LoginScreen());
                                                        } else {
                                                          if (recommendFromYou.favorite == 1) {
                                                            recommendFromYou.favorite = 0;
                                                          } else {
                                                            recommendFromYou.favorite = 1;
                                                          }
                                                          setState(() {});
                                                          controller.realestateIDF =
                                                              recommendFromYou.id.toString();
                                                          controller.addRemoveFavorite();
                                                        }
                                                      },
                                                      child: SizedBox(
                                                          height: 20.h,
                                                          child: recommendFromYou.favorite == 0
                                                              ? Image.asset("assets/images/short.png")
                                                              : Image.asset("assets/images/like2.png")),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 5.h),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      size: 10.r,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    SizedBox(
                                                      width: 129.w,
                                                      child: CustomText(
                                                        text: recommendFromYou.address,
                                                        fontSize: 10.sp,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 7.h),
                                                Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/bed.png",
                                                          height: 20.h,
                                                          width: 20.w,
                                                        ),
                                                        SizedBox(width: 5.w),
                                                        CustomText(
                                                          text: recommendFromYou.bedrooms,
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.w400,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/bathtub.png",
                                                          height: 20..h,
                                                          width: 20..w,
                                                        ),
                                                        SizedBox(width: 5..w),
                                                        CustomText(
                                                          text: recommendFromYou.bathrooms,
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 10..w),
                                                    Row(
                                                      children: [
                                                        Image.asset("assets/images/area.png",
                                                            height: 20.h, width: 20.w),
                                                        SizedBox(width: 5.w),
                                                        SizedBox(
                                                          width: 100..w,
                                                          height: 30,
                                                          child: CustomText(
                                                            text: recommendFromYou.area,
                                                            // fontSize: 14.sp,
                                                            fontSize: 12.sp,
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),
                                                CustomText(
                                                  text: "\$${recommendFromYou.price}",
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w700,
                                                  fontColor: AppColors().mainColor2,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(height: 80..h)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
