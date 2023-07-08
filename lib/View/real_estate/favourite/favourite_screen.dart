import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/View/real_estate/details/details_screen.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:derapidos/controllers/r_s_controller/home_controller.dart';
import 'package:derapidos/controllers/r_s_controller/rs_favourite_controller.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../consts/app_consts.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final myfavouriteController = Get.put(RSFavouriteController());
  final _controller = Get.put(RSHomeController());
  int? selectIndex;
  bool noMore = true;
  bool isProcessing = true;
  ScrollController scrollController = ScrollController();
  nextScreen() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      Get.to(LoginScreen());
    } else {
      await myfavouriteController.getFavouriteAds();
      if (myfavouriteController.myfav!.data!.length! > 15) {
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
    if (myfavouriteController.myfav!.currentPage! < myfavouriteController.myfav!.lastPage!) {
      myfavouriteController.getProcessingPage = myfavouriteController.getProcessingPage + 1;
    } else {
      noMore = true;
      setState(() {});
      return;
    }
    myfavouriteController.isProcessing = false;
    await myfavouriteController.getFavouriteAds();
    setState(() {});
  }

  @override
  initState() {
    nextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RSFavouriteController>(builder: (myfavouriteController) {
      return myfavouriteController.loading.value
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: CustomText(
                  text: "Favourite",
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  fontColor: Colors.black,
                ),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 25..h),
                    ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: myfavouriteController.myfavlList.length > 15
                            ? myfavouriteController.myfavlList.length + 1
                            : myfavouriteController.myfavlList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 10.h);
                        },
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                        itemBuilder: (context, index) {
                          var favData = myfavouriteController.myfavlList[index];
                          return InkWell(
                            onTap: () {
                              selectIndex = index;
                              // setState(() {})
                              _controller.nTitle = favData.title.toString();
                              _controller.postedUserId = favData.userId.toString();
                              _controller.nPrice = favData.price.toString();
                              _controller.nBath = favData.bathrooms.toString();
                              _controller.nBed = favData.bedrooms.toString();
                              _controller.nArea = favData.area.toString();
                              _controller.nImages = favData.images;
                              _controller.nFeatures = favData.features;
                              _controller.nPostedPersonName = favData.name;
                              _controller.nPostedPersonPhone = favData.phone;
                              _controller.nPostedPersonProfilePic = favData.profilePic;
                              _controller.nCreatedAt = favData.createdAt;
                              _controller.nAdress = favData.address;
                              _controller.nDescription = favData.description;
                              _controller.nType = favData.type;
                              _controller.checkProfileDetail = "";
                              _controller.checkMyAdds = "";
                              _controller.userID = favData.userId.toString();

                              Get.to(RSDetailScreen());
                            },
                            child: CustomCard(
                              height: 112.h,
                              // width: 244.w,
                              cardColor: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 5)
                              ],
                              cardChild: Row(
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
                                            favData.images![0],
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
                                              text: favData.type,
                                              fontSize: 15.sp,
                                              fontColor: AppColors().mainColor2,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.0.r, left: 10, right: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              CustomText(
                                                text: favData.title,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  print("EVEy thing Good");
                                                  debugPrint("GVJHBKJNBLK");

                                                  if (favData.favorite == 1) {
                                                    favData.favorite = 0;
                                                  } else {
                                                    favData.favorite = 1;
                                                  }
                                                  setState(() {});
                                                  _controller.realestateIDF = favData.id.toString();
                                                  _controller.addRemoveFavorite();
                                                },
                                                child: SizedBox(
                                                    height: 20.h,
                                                    child: favData.favorite == 0
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
                                                width: 179.w,
                                                child: CustomText(
                                                  text: favData.address,
                                                  textOverflow: TextOverflow.ellipsis,
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
                                                    text: favData.bedrooms,
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
                                                    text: favData.bathrooms,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 10.w),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/area.png",
                                                    height: 20.h,
                                                    width: 20.w,
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  SizedBox(
                                                    width: 90,
                                                    child: CustomText(
                                                      text: favData.area,
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 7.h),
                                          CustomText(
                                            text: favData.price.toString(),
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                            fontColor: AppColors().mainColor2,
                                          ),
                                          // SizedBox(height: 7.h),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                          return null;
                        }),
                    SizedBox(height: 30..h)
                  ],
                ),
              ),
            );
    });
  }
}
