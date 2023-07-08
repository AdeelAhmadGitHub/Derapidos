import 'dart:convert';

import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/View/real_estate/chatScreen/chat_room_launcher.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:derapidos/controllers/r_s_controller/my_ads_controller.dart';
import 'package:derapidos/models/real_estate_models/myads/my_ads_model.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../consts/app_consts.dart';
import '../../../controllers/r_s_controller/home_controller.dart';
import '../details/details_screen.dart';

class OwnerProfile extends StatefulWidget {
  const OwnerProfile({Key? key}) : super(key: key);

  @override
  State<OwnerProfile> createState() => _OwnerProfileState();
}

class _OwnerProfileState extends State<OwnerProfile> {
  final myadsController = Get.put(RSMyAdsController());
  final _controller = Get.put(RSHomeController());
  int? selectIndex;
  bool noMore = true;
  bool isProcessing = true;
  String? userID = "";
  String? CheckUserId = "";
  UserProfile? userProfile;
  String? personPhone;
  ScrollController scrollController = ScrollController();

  nextScreen() async {
    String? data = UserPreferences.getUserData();
    if (data != null) {
      userProfile = UserProfile.fromJson(jsonDecode(data));
      userID = userProfile!.userData!.id.toString();
      CheckUserId = _controller.userID;
      // await myadsController.getMyAds();
      if (myadsController.myads!.activeListing!.data!.length > 15) {
        noMore = false;
      }
      scrollController.addListener(() {
        if (scrollController.position.maxScrollExtent == scrollController.offset) {
          fetchMoreGetGift();
        }
      });
    } else {}
    personPhone = _controller.nPostedPersonPhone;
    // await myadsController.getMyAds();
    if (myadsController.myads!.activeListing!.data!.length > 15) {
      noMore = false;
    }
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        fetchMoreGetGift();
      }
    });
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
    // await myadsController.getMyAds();
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
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                title: CustomText(
                  text: "Owner Profile",
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  fontColor: Colors.black,
                ),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 26..h),
                    CustomCard(
                      // height: 230..h,
                      width: double.maxFinite,
                      cardColor: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.r,
                          blurRadius: 10.r,
                        ),
                      ],
                      cardChild: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10..w, vertical: 20..h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 35..r,
                                  backgroundColor: Color(0xff078089),
                                  child: CircleAvatar(
                                    radius: 32..r,
                                    backgroundImage:
                                        NetworkImage(myadsController.myads!.userDetail!.first!.profilePic!),
                                  ),
                                ),
                                SizedBox(width: 13..w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: myadsController.myads!.userDetail!.first.name!,
                                      fontSize: 18..sp,
                                    ),
                                    SizedBox(height: 13..h),
                                    Row(
                                      children: [
                                        CustomCard(
                                          height: 28..h,
                                          width: 92..w,
                                          borderRadius: BorderRadius.circular(20),
                                          cardColor: Color(0xff34A00C),
                                          cardChild: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              CircleAvatar(
                                                radius: 12..r,
                                                backgroundColor: Colors.white,
                                                child: Image.asset(
                                                  "assets/images/sms.png",
                                                  height: 15..h,
                                                  width: 15..w,
                                                  color: Color(0xff34A00C),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  bool? isLogin =
                                                      await UserPreferences.getLoginCheck() ?? false;
                                                  if (isLogin == false) {
                                                    Get.to(LoginScreen());
                                                  } else {
                                                    if (CheckUserId == userID) {
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                          content: CustomText(
                                                              text: "User can't send the message")));
                                                    } else {
                                                      ChatRoomLauncher().sendMessage(context, _controller);
                                                    }
                                                  }
                                                },
                                                child: CustomText(
                                                  text: "Message",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13.sp,
                                                  fontColor: Colors.white,
                                                ),
                                              ),
                                              SizedBox()
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10..w),
                                        InkWell(
                                          onTap: () async {
                                            final Uri launchOnPhone = Uri(scheme: "tel", path: personPhone);
                                            await canLaunchUrl(launchOnPhone)
                                                ? await launchUrl(launchOnPhone)
                                                : print("Some error on launching on phone");
                                          },
                                          child: CustomCard(
                                            height: 28..h,
                                            width: 92..w,
                                            borderRadius: BorderRadius.circular(20),
                                            cardColor: Color(0xff1D6CEF),
                                            cardChild: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                CircleAvatar(
                                                  radius: 12..r,
                                                  backgroundColor: Colors.white,
                                                  child: Image.asset(
                                                    "assets/images/call.png",
                                                    height: 15..h,
                                                    width: 15..w,
                                                    color: Color(0xff1D6CEF),
                                                  ),
                                                ),
                                                CustomText(
                                                  text: "Contact",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13.sp,
                                                  fontColor: Colors.white,
                                                ),
                                                SizedBox(width: 1.w),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              color: const Color(0xffE5E5E5),
                              thickness: 1.h,
                            ),
                            SizedBox(height: 10..h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Total Posted :${myadsController.myads!.total.toString()}",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                                CustomText(
                                  text: "Live : ${myadsController.myads!.totalActive.toString()}",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                                CustomText(
                                  text: "Sale : ${myadsController.myads!.totalPrevious.toString()}",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                            SizedBox(height: 10..h),
                            Divider(
                              color: const Color(0xffE5E5E5),
                              thickness: 1.h,
                            ),
                            CustomText(
                              text: "About Us:",
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                            CustomText(
                              text:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500swhen an unknown printer took a galley of type and scrambled it to make a type specimen book.:",
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              fontColor: Colors.black.withOpacity(0.69),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15..h),
                    CustomText(
                      text: "Properties Posted",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                    SizedBox(height: 18..h),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 24..w,
                          crossAxisSpacing: 10..w,
                          childAspectRatio: (162 / 210)..r

                          // MediaQuery.of(context).size.width /
                          //     (MediaQuery.of(context).size.height / 2),
                          ),
                      itemCount: myadsController.myadslList.length > 15
                          ? myadsController.myadslList.length + 1
                          : myadsController.myadslList.length,
                      itemBuilder: (context, index) {
                        //ActiveData activedate = myadsController!.myads!.activeListing!.data![index];
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

                            Get.to(RSDetailScreen());
                          },
                          child: CustomCard(
                            cardColor: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 15)
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
                                  padding: EdgeInsets.symmetric(horizontal: 7..w, vertical: 7..w),
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
                                          // SizedBox(width: 4..w),
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
                ),
              ),
            );
    });
  }
}
