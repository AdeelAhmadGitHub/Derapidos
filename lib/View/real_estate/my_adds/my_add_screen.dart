import 'dart:convert';

import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/View/real_estate/details/details_screen.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:derapidos/controllers/r_s_controller/home_controller.dart';
import 'package:derapidos/controllers/r_s_controller/my_ads_controller.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../consts/app_consts.dart';
import '../my_add_detail/my_add_detail_screen.dart';

class MyAddScreen extends StatefulWidget {
  MyAddScreen({Key? key}) : super(key: key);

  @override
  State<MyAddScreen> createState() => _MyAddScreenState();
}

class _MyAddScreenState extends State<MyAddScreen> {
  List<String> addList = ["Active ADS", "Previous ADS"];

  int isSelected = 0;
  final myadsController = Get.put(RSMyAdsController());
  final _controller = Get.put(RSHomeController());
  int? selectIndex;
  bool noMore = true;
  bool isProcessing = true;
  UserProfile? userProfile;
  String? userID="";

  ScrollController scrollController = ScrollController();
  nextScreen() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      //log('datansdlaslasljlajlaajlaJLas');
      Get.to(LoginScreen());
    } else {
      String? data = UserPreferences.getUserData();
      userProfile = UserProfile.fromJson(jsonDecode(data!));
      userID=userProfile!.userData!.id.toString();
      await myadsController.getMyAds(userID??"");
      if (myadsController.myads!.activeListing!.data!.length > 15) {
        noMore = false;
      }
      scrollController.addListener(() {
        if (scrollController.position.maxScrollExtent == scrollController.offset) {
          fetchMoreGetGift();
        }
      });
    }
  }

  fetchMoreGetGift() async {
    noMore = false;
    setState(() {});
    if (myadsController.myads!.activeListing!.currentPage! <
        myadsController.myads!.activeListing!.lastPage!) {
      myadsController.getProcessingPage = myadsController.getProcessingPage + 1;
    } else {
      noMore = true;
      setState(() {});
      return;
    }
    myadsController.isProcessing = false;
    await myadsController.getMyAds(userID??"");
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    nextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RSMyAdsController>(builder: (myadsController) {
      return myadsController.loading.value
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                title: CustomText(
                  text: "My ADS",
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  fontColor: Colors.black,
                ),
              ),
              body: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 10..w),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 15..h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          2,
                          (index) => InkWell(
                            onTap: () {
                              setState(() {
                                isSelected = index;
                              });
                            },
                            child: CustomCard(
                              height: 45.h,
                              width: 157.w,
                              cardColor: index == isSelected ? AppColors().mainColor2 : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(color: Colors.black12, spreadRadius: 0.4, blurRadius: 5)
                              ],
                              cardChild: Center(
                                child: CustomText(
                                  text: addList[index],
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontColor: isSelected == index ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 37.h),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 24..w,
                            crossAxisSpacing: 10..w,
                            childAspectRatio: (172 / 210)..r),
                        itemCount: myadsController.myadslList.length > 15
                            ? myadsController.myadslList.length + 1
                            : myadsController.myadslList.length,
                        itemBuilder: (context, index) {
                          var activedate = myadsController.myadslList[index];

                          return InkWell(
                            onTap: () {
                              selectIndex = index;
                              // setState(() {})
                              _controller.nTitle = activedate.title.toString();
                              _controller.postedUserId = activedate.userId.toString();
                              _controller.nPrice = activedate.price.toString();
                              _controller.nBath = activedate.bathrooms.toString();
                              _controller.nBed = activedate.bedrooms.toString();
                              _controller.nArea = activedate.area.toString();
                              _controller.nImages = activedate.images;
                              _controller.nFeatures = activedate.features;
                              _controller.nPostedPersonName = activedate.name;
                              _controller.nPostedPersonPhone = activedate.phone;
                              _controller.nPostedPersonProfilePic = activedate.profilePic;
                              _controller.nCreatedAt = activedate.createdAt;
                              _controller.nAdress = activedate.address;
                              _controller.nDescription = activedate.description;
                              _controller.nType = activedate.type;
                              _controller.checkProfileDetail = "";
                              _controller.checkMyAdds = "1";
                              _controller.userID = activedate.userId.toString();

                              Get.to(RSDetailScreen());
                            },
                            child: CustomCard(
                              cardColor: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 5)
                              ],
                              cardChild: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      SizedBox(
                                        height: 98.h,
                                        width: double.maxFinite,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            topLeft: Radius.circular(8),
                                          ),
                                          child: Image.network(
                                            activedate.images![0],
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 76.h,
                                        left: 10.w,
                                        child: CustomCard(
                                            height: 17..h,
                                            width: 48..w,
                                            cardColor: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                            cardChild: Center(
                                              child: CustomText(
                                                text: activedate.type,
                                                fontSize: 10..sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5..h),
                                  Padding(
                                    padding: EdgeInsets.only(top: 2..h, right: 7..w, left: 7..w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              text: activedate.title,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4..h),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 10.r,
                                            ),
                                            SizedBox(width: 5.w),
                                            SizedBox(
                                              width: 100.w,
                                              child: CustomText(
                                                text: activedate.address,
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4..h),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/bed.png",
                                                  height: 12..h,
                                                  width: 17..w,
                                                ),
                                                SizedBox(width: 3..w),
                                                CustomText(
                                                  text: activedate.bedrooms,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                )
                                              ],
                                            ),
                                            // SizedBox(width: 13..w),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/bathtub.png",
                                                  height: 12..h,
                                                  width: 17..w,
                                                ),
                                                SizedBox(width: 3..w),
                                                CustomText(
                                                  text: activedate.bathrooms,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ],
                                            ),
                                            // SizedBox(width: 13..w),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/area.png",
                                                  height: 12..h,
                                                  width: 17..w,
                                                ),
                                                SizedBox(width: 3..w),
                                                CustomText(
                                                  text: "2000 sqft",
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4..h),
                                        CustomText(
                                          text: activedate.price.toString(),
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700,
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
                      )
                    ],
                  )),
            );
    });
  }
}
