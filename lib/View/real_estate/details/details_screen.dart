import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/View/real_estate/chatScreen/chat_room_launcher.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../component/custom_card.dart';
import '../../../consts/app_consts.dart';
import '../../../controllers/r_s_controller/home_controller.dart';
import '../../../models/real_estate_models/filter_model.dart';
import '../owner_profile/owner_profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class RSDetailScreen extends StatefulWidget {
  const RSDetailScreen({Key? key}) : super(key: key);

  @override
  State<RSDetailScreen> createState() => _RSDetailScreenState();
}

final _controller = Get.put(RSHomeController());

int _current = 0;
int isSelect = 0;

class _RSDetailScreenState extends State<RSDetailScreen> {
  String? title;
  String? bathRoom;
  String? bedRoom;
  String? price;
  String? area;
  List<String>? images;
  List<String>? features;
  String? personName;
  String? personPhone;
  String? personImage;
  String? createdAt;
  String? type;
  String? aDdress;
  String? dEscrption;

  UserProfile? userProfile;
  String? userID = "";
  String? CheckUserId = "";
  gotcallf() async {
    String? data = UserPreferences.getUserData();
    if (data != null) {
      userProfile = UserProfile.fromJson(jsonDecode(data!));
      userID = userProfile!.userData!.id.toString();
      CheckUserId = _controller.userID;
      title = _controller.nTitle;
      bathRoom = _controller.nBath;
      bedRoom = _controller.nBed;
      price = _controller.nPrice;
      area = _controller.nArea;
      images = _controller.nImages;
      features = _controller.nFeatures;
      personName = _controller.nPostedPersonName;
      personPhone = _controller.nPostedPersonPhone;
      personImage = _controller.nPostedPersonProfilePic;
      createdAt = _controller.nCreatedAt;
      type = _controller.nType;
      aDdress = _controller.nAdress;
      dEscrption = _controller.nDescription;
    } else {}
    title = _controller.nTitle;
    bathRoom = _controller.nBath;
    bedRoom = _controller.nBed;
    price = _controller.nPrice;
    area = _controller.nArea;
    images = _controller.nImages;
    features = _controller.nFeatures;
    personName = _controller.nPostedPersonName;
    personPhone = _controller.nPostedPersonPhone;
    personImage = _controller.nPostedPersonProfilePic;
    createdAt = _controller.nCreatedAt;
    type = _controller.nType;
    aDdress = _controller.nAdress;
    dEscrption = _controller.nDescription;
  }

  @override
  initState() {
    gotcallf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: images!.length,
                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Image.network(
                    images![itemIndex],
                    fit: BoxFit.fill,
                  ),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    aspectRatio: 375 / 279,
                    initialPage: 2,
                    onPageChanged: (index, _) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24..w, vertical: 58..h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          // color: Colors.white,
                          size: 20.r,
                        ),
                      ),
                      CircleAvatar(
                        radius: 15.r,
                        backgroundColor: const Color(0xff2F3571),
                        child: CircleAvatar(
                          radius: 13.r,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              "assets/images/X.png",
                              color: AppColors().mainColor2,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 238..h, left: 26.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 15.h),
                      SizedBox(
                        width: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: images!.map(
                            (image) {
                              int index = images!.indexOf(image);
                              return _current == index
                                  ? Container(
                                      width: 19.0..w,
                                      height: 19.0..h,
                                      margin: EdgeInsets.symmetric(horizontal: 10.0..w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: AppColors().mainColor2, width: 2.w),
                                      ),
                                      child: Center(
                                        child: Container(
                                            width: 8.0..w,
                                            height: 8.0..h,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle, color: AppColors().mainColor2)),
                                      ),
                                    )
                                  : Container(
                                      width: 8.0..w,
                                      height: 8.0..h,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffC0C0C0),
                                      ),
                                    );
                            },
                          ).toList(),
                        ),
                      ),
                      CustomCard(
                        height: 21.h,
                        width: 59.w,
                        cardColor: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        cardChild: Center(
                          child: CustomText(
                            text: type,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            fontColor: Color(0xffD80027),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10..w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10..h),
                  CustomText(
                    text: title,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                  ),
                  SizedBox(height: 8..h),
                  CustomText(
                    text: "\$$price",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                  SizedBox(height: 8..h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      CustomText(
                        text: aDdress,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        fontColor: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xffE5E5E5)),
                  SizedBox(height: 10..h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/bed 1.png",
                            height: 25..h,
                            width: 28..w,
                          ),
                          SizedBox(height: 10..h),
                          CustomText(
                            text: "$bedRoom Beds",
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/2.png",
                            height: 25..h,
                            width: 28..w,
                          ),
                          SizedBox(height: 10..h),
                          CustomText(
                            text: "$bathRoom Baths",
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/1.png",
                            height: 25..h,
                            width: 28..w,
                          ),
                          SizedBox(height: 10..h),
                          CustomText(
                            text: area,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xffE5E5E5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Area unit",
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                      CustomText(
                        text: area,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        fontColor: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xffE5E5E5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Furnished",
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                      CustomText(
                        text: "UnFurnished",
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        fontColor: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xffE5E5E5)),
                  CustomText(
                    text: "Features",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                  SizedBox(height: 10..h),
                  Wrap(
                    // direction: Axis.horizontal,
                    spacing: 10..w, runSpacing: 5..h,
                    children: List.generate(
                      features!.length,
                      (index) => CustomCard(
                        cardColor: Colors.white,
                        border: Border.all(color: Color(0xff9098B1), width: 2),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: .7,
                            blurRadius: 1.5,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50..r),
                        cardChild: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                          child: CustomText(
                            text: features![index],
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontColor: Color(0xff9098B1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(color: Color(0xffE5E5E5)),
                  CustomText(
                    text: "Brief Description",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                  SizedBox(height: 10..h),
                  CustomText(
                    text: dEscrption,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontColor: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(height: 10..h),
                  CustomText(
                    text: "Search on Map",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                  SizedBox(
                    height: 185.h,
                    width: double.maxFinite,
                    child: Image.asset("assets/images/maps.PNG"),
                  ),
                  SizedBox(height: 20..h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Posted By",
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                      CustomText(
                        text: createdAt,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        fontColor: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  SizedBox(height: 10..h),
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            personImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 20..w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: personName,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                          // SizedBox(height: 5..h),
                          // CustomText(
                          //   text: "Member since March 2022",
                          //   fontWeight: FontWeight.w400,
                          //   fontSize: 14.sp,
                          // ),
                          SizedBox(height: 5..h),
                          InkWell(
                            onTap: () => Get.to(OwnerProfile()),
                            child: CustomText(
                              text: "View Profile and adds",
                              fontWeight: FontWeight.w700,
                              fontSize: 17.sp,
                              fontColor: AppColors().mainColor2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20..h),
                ],
              ),
            ),
            CustomCard(
              height: 84..h,
              width: double.maxFinite,
              cardColor: Colors.black.withOpacity(0.6),
              cardChild: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomCard(
                    height: 55..h,
                    width: 162..w,
                    cardColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    cardChild: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/images/sms.png",
                            height: 20..h,
                            width: 20..h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
                              if (isLogin == false) {
                                Get.to(LoginScreen());
                              } else {
                                if (CheckUserId == userID) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: CustomText(
                                    text: "User can't send the message",
                                  )));
                                } else {
                                  ChatRoomLauncher().sendMessage(context, _controller);
                                }
                              }
                            },
                            child: CustomText(
                              text: "Message",
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              fontColor: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final Uri launchOnPhone = Uri(scheme: "tel", path: personPhone);
                      await canLaunchUrl(launchOnPhone)
                          ? await launchUrl(launchOnPhone)
                          : print("Some error on launching on phone");
                    },
                    child: CustomCard(
                      height: 55..h,
                      width: 162..w,
                      cardColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      cardChild: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/call.png",
                              height: 20..h,
                              width: 20..h,
                            ),
                            CustomText(
                              text: "Contact",
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              fontColor: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
