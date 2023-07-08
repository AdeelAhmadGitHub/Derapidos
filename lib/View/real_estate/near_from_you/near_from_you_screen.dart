import 'dart:convert';

import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../component/custom_card.dart';
import '../../../consts/app_consts.dart';
import '../../../controllers/r_s_controller/home_controller.dart';
import '../../../controllers/r_s_controller/near_from_you_controller.dart';
import '../../../models/AppliedCoupon.dart';
import '../../Custom Widget/custom_text.dart';
import '../details/details_screen.dart';
import '../filter/filter_screen.dart';

class NearFromYouScreen extends StatefulWidget {
  NearFromYouScreen({Key? key}) : super(key: key);

  @override
  State<NearFromYouScreen> createState() => _NearFromYouScreenState();
}

class _NearFromYouScreenState extends State<NearFromYouScreen> {
  final nearFromYouController = Get.put(NearFromYouController());
  bool noMore = true;
  bool isProcessing = true;
  ScrollController scrollController = ScrollController();
  UserProfile? userProfile;

  nextScreen() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      nearFromYouController.userID = "";

      await nearFromYouController.getviewRSAll();
      if (nearFromYouController.reviwall!.data!.length > 15) {
        noMore = false;
      }
      scrollController.addListener(() {
        if (scrollController.position.maxScrollExtent == scrollController.offset) {
          fetchMoreGetGift();
        }
      });
    } else {
      String? data = UserPreferences.getUserData();
      if (data != null) {
        userProfile = UserProfile.fromJson(jsonDecode(data!));
      } else {}
      nearFromYouController.userID = '${userProfile?.userData?.id}';

      await nearFromYouController.getviewRSAll();
      if (nearFromYouController.reviwall!.data!.length > 15) {
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
    if (nearFromYouController.reviwall!.currentPage! < nearFromYouController.reviwall!.lastPage!) {
      nearFromYouController.getProcessingPage = nearFromYouController.getProcessingPage + 1;
    } else {
      noMore = true;
      setState(() {});
      return;
    }
    nearFromYouController.isProcessing = false;
    await nearFromYouController.getviewRSAll();
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    nextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NearFromYouController>(builder: (nearFromYouController) {
      return nearFromYouController.loading.value
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
              body: Column(
                children: [
                  SizedBox(height: 35.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20.r,
                          ),
                        ),
                        Flexible(
                          child: CustomCard(
                            height: 45.h,
                            width: 253.w,
                            cardColor: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 3)
                            ],
                            cardChild: Center(
                              child: TextField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
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
                        ),
                        // SizedBox(width: 5.w),
                        InkWell(
                          onTap: () =>
                              nearFromYouController.doRotate.value = !nearFromYouController.doRotate.value,
                          child: Image.asset(
                            "assets/images/cc.png",
                            height: 30..h,
                            width: 30..w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 10.h),
                  // Wrap(
                  //   spacing: 20,
                  //   children: List.generate(
                  //     2,
                  //     (index) => InkWell(
                  //       onTap: () {
                  //         nearFromYouController.isSelected.value = index;
                  //         if (nearFromYouController.isSelected.value == 0) {
                  //           Get.to(RSFilterScreen());
                  //         }
                  //       },
                  //       child: CustomCard(
                  //         height: 36.h,
                  //         width: 130.w,
                  //         cardColor: Colors.white,
                  //         border: Border.all(
                  //           color: nearFromYouController.isSelected.value == index
                  //               ? AppColors().mainColor2.withOpacity(.62)
                  //               : const Color(0xff9098B1),
                  //         ),
                  //         borderRadius: BorderRadius.circular(50),
                  //         cardChild: Center(
                  //           child: CustomText(
                  //             text: nearFromYouController.filterList[index],
                  //             fontSize: 15.sp,
                  //             fontColor: nearFromYouController.isSelected.value == index
                  //                 ? AppColors().mainColor2.withOpacity(.62)
                  //                 : Colors.black,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Obx(
                    () => Expanded(
                      child: nearFromYouController.doRotate.value ? ViewTypeOfList1() : ViewTypeOfList2(),
                    ),
                  )
                ],
              ),
            );
    });
  }
}

class ViewTypeOfList1 extends StatelessWidget {
  final _controller = Get.put(RSHomeController());
  int? selectIndex;
  ViewTypeOfList1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NearFromYouController>(builder: (nearFromYouController) {
      return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemCount: nearFromYouController.reviewallList.length > 15
              ? nearFromYouController.reviewallList.length + 1
              : nearFromYouController.reviewallList.length,
          itemBuilder: (context, index) {
            var listData = nearFromYouController.reviewallList[index];
            return InkWell(
              onTap: () {
                selectIndex = index;
                // setState(() {})
                _controller.nTitle = listData.title.toString();
                _controller.postedUserId = listData.userId.toString();
                _controller.nPrice = listData.price.toString();
                _controller.nBath = listData.bathrooms.toString();
                _controller.nBed = listData.bedrooms.toString();
                _controller.nArea = listData.area.toString();
                _controller.nImages = listData.images;
                _controller.nFeatures = listData.features;
                _controller.nPostedPersonName = listData.name;
                _controller.nPostedPersonPhone = listData.phone;
                _controller.nPostedPersonProfilePic = listData.profilePic;
                _controller.nCreatedAt = listData.createdAt;
                _controller.nAdress = listData.address;
                _controller.nDescription = listData.description;
                _controller.nType = listData.type;
                _controller.checkProfileDetail = "";
                _controller.checkMyAdds = "";
                _controller.userID = listData.userId.toString();
                Get.to(RSDetailScreen());
              },
              child: CustomCard(
                height: 240.h,
                // width: 244.w,
                cardColor: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)],
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 180..h,
                          width: double.maxFinite,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              listData.images![0],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
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
                                    text: listData.type,
                                    fontSize: 15.sp,
                                    fontColor: AppColors().mainColor2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10..h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: listData.title,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              InkWell(
                                onTap: () async {
                                  print("EVEy thing Good");
                                  debugPrint("GVJHBKJNBLK");

                                  if (listData.favorite == 1) {
                                    listData.favorite = 0;
                                  } else {
                                    listData.favorite = 1;
                                  }
                                   //setState((){});
                                  _controller.realestateIDF = listData.id.toString();
                                  _controller.addRemoveFavorite();
                                },
                                child: SizedBox(
                                    height: 20.h,
                                    child: listData.favorite == 0
                                        ? Image.asset("assets/images/short.png")
                                        : Image.asset("assets/images/like2.png")),
                              ),
                            ],
                          ),
                          SizedBox(height: 5..h),
                          CustomText(
                            text: listData.price.toString(),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            fontColor: AppColors().mainColor2,
                          ),
                          SizedBox(height: 6.h),
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
                                    text: listData.bedrooms.toString(),
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
                                    text: listData.bathrooms.toString(),
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
                                    text: listData.area,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 7.h),
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
                                  text: listData.address,
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
            );
          });
    });
  }
}

class ViewTypeOfList2 extends StatelessWidget {
  final _controller = Get.put(RSHomeController());
  int? selectIndex;
  ViewTypeOfList2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NearFromYouController>(builder: (nearFromYouController) {
      return ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 10..w, vertical: 10.h),
          itemCount: nearFromYouController.reviewallList.length > 15
              ? nearFromYouController.reviewallList.length + 1
              : nearFromYouController.reviewallList.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10..h);
          },
          itemBuilder: (context, index) {
            var listData = nearFromYouController.reviewallList[index];
            return InkWell(
              onTap: () {
                selectIndex = index;
                // setState(() {})
                _controller.nTitle = listData.title.toString();
                _controller.postedUserId = listData.userId.toString();
                _controller.nPrice = listData.price.toString();
                _controller.nBath = listData.bathrooms.toString();
                _controller.nBed = listData.bedrooms.toString();
                _controller.nArea = listData.area.toString();
                _controller.nImages = listData.images;
                _controller.nFeatures = listData.features;
                _controller.nPostedPersonName = listData.name;
                _controller.nPostedPersonPhone = listData.phone;
                _controller.nPostedPersonProfilePic = listData.profilePic;
                _controller.nCreatedAt = listData.createdAt;
                _controller.checkProfileDetail = "";
                _controller.checkMyAdds = "";
                _controller.userID = listData.userId.toString();
                Get.to(RSDetailScreen());
              },
              child: CustomCard(
                height: 120.h,
                width: 244.w,
                cardColor: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 1..r, blurRadius: 5..r)],
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
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.r),
                              bottomLeft: Radius.circular(8.r),
                            ),
                            child: Image.network(
                              listData.images![0],
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
                              borderRadius: BorderRadius.circular(6.r),
                              cardChild: Center(
                                child: CustomText(
                                  text: listData.type,
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
                        padding: EdgeInsets.all(10.0.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomText(
                                  text: listData.title,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                InkWell(
                                  onTap: () async {
                                    print("EVEy thing Good");
                                    debugPrint("GVJHBKJNBLK");

                                    if (listData.favorite == 1) {
                                      listData.favorite = 0;
                                    } else {
                                      listData.favorite = 1;
                                    }
                                    //setState((){});
                                    _controller.realestateIDF = listData.id.toString();
                                    _controller.addRemoveFavorite();
                                  },
                                  child: SizedBox(
                                      height: 20.h,
                                      child: listData.favorite == 0
                                          ? Image.asset("assets/images/short.png")
                                          : Image.asset("assets/images/like2.png")),
                                ),
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
                                    text: listData.address,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
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
                                      text: listData.bedrooms.toString(),
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
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                    SizedBox(width: 5.w),
                                    CustomText(
                                      text: listData.bathrooms.toString(),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10.w),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/area.png",
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                    SizedBox(width: 5.w),
                                    SizedBox(
                                      height: 40..h,
                                      width: 100..w,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 8..h),
                                        child: CustomText(
                                          text: listData.area,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            CustomText(
                              text: listData.price.toString(),
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
          });
    });
  }
}
