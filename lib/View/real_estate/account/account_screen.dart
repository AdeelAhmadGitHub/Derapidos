import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/controllers/r_s_controller/profile_controller.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../consts/app_consts.dart';
import 'package:get/get.dart';
import '../edit_profile/rs_edit_profile_screen.dart';
import '../manage_account/manage_account_screen.dart';
import '../my_adds/my_add_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var homeController = Get.put(ProfileController());
  UserProfile? userProfile;
  gotcallf() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      //log('datansdlaslasljlajlaajlaJLas');
      Get.to(LoginScreen());
    } else {
      //log('uytrtyuiolkjhgcvbnm');
      String? data = UserPreferences.getUserData();
      if (data != null) {
        userProfile = UserProfile.fromJson(jsonDecode(data!));
      } else {}
    }
  }

  @override
  initState() {
    gotcallf();
    // print("profile pic ${userProfile!.userData!.profilePic!}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return controller.rsProfileLoading
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: CustomText(
                    text: "Account",
                    fontWeight: FontWeight.w700,
                    fontSize: 21.sp,
                    fontColor: Colors.black,
                  ),
                ),
                body: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 10..w),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 20..h),
                      Row(
                        children: [
                          // SvgPicture.network(
                          //   "${controller.userProfile!.userData!.profilePic}",
                          //   semanticsLabel: 'A shark?!',
                          //   placeholderBuilder: (BuildContext context) => Container(
                          //       padding: const EdgeInsets.all(30.0),
                          //       child: const CircularProgressIndicator()),
                          // ),
                          SizedBox(
                            height: 80.h,
                            width: 87.w,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.network(
                                  "${controller.userProfile!.userData!.profilePic}" ?? "",
                                  loadingBuilder: (context, child, loadingProgress) =>
                                      (loadingProgress == null) ? child : CircularProgressIndicator(),
                                  errorBuilder: (context, error, stackTrace) => Icon(
                                    Icons.person,
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),

                          SizedBox(width: 20..w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: controller.userProfile!.userData!.name ?? "",
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                              SizedBox(height: 22..h),
                              InkWell(
                                onTap: () => Get.to(RsEditProfileScreen()),
                                child: Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17.sp,
                                    color: AppColors().mainColor2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30..h),
                      CustomCard(
                        cardColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 10)],
                        height: 510..h,
                        width: double.maxFinite,
                        cardChild: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20..w, vertical: 28..h),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () => Get.to(ManageAccountScreen()),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: 20..r,
                                      color: Colors.black.withOpacity(.47),
                                    ),
                                    SizedBox(width: 11..w),
                                    CustomCard(
                                        height: 25..h,
                                        width: 2..w,
                                        cardColor: Colors.black.withOpacity(.47),
                                        cardChild: SizedBox()),
                                    SizedBox(width: 15..w),
                                    CustomText(
                                      text: "Manage Account",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16..sp,
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 30..r,
                                      color: Colors.black.withOpacity(.47),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10..h),
                              Divider(color: Color(0xffC4C4C4), thickness: 1.5.h),
                              SizedBox(height: 17..h),
                              InkWell(
                                onTap: () => Get.to(MyAddScreen()),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/addd.png",
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                    SizedBox(width: 11..w),
                                    CustomCard(
                                        height: 25..h,
                                        width: 2..w,
                                        cardColor: Colors.black.withOpacity(.47),
                                        cardChild: SizedBox()),
                                    SizedBox(width: 15..w),
                                    CustomText(
                                      text: "My Ads",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16..sp,
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 30..r,
                                      color: Colors.black.withOpacity(.47),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10..h),
                              Divider(color: Color(0xffC4C4C4), thickness: 1.5.h),
                              SizedBox(height: 17..h),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/alarm.png",
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                  SizedBox(width: 11..w),
                                  CustomCard(
                                      height: 25..h,
                                      width: 2..w,
                                      cardColor: Colors.black.withOpacity(.47),
                                      cardChild: SizedBox()),
                                  SizedBox(width: 15..w),
                                  CustomText(
                                    text: "Notification",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16..sp,
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 30..r,
                                    color: Colors.black.withOpacity(.47),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10..h),
                              Divider(color: Color(0xffC4C4C4), thickness: 1.5.h),
                              SizedBox(height: 17..h),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/language.png",
                                    height: 20.h,
                                    width: 20.w,
                                    color: Colors.black.withOpacity(0.47),
                                  ),
                                  SizedBox(width: 11..w),
                                  CustomCard(
                                      height: 25..h,
                                      width: 2..w,
                                      cardColor: Colors.black.withOpacity(.47),
                                      cardChild: SizedBox()),
                                  SizedBox(width: 15..w),
                                  CustomText(
                                    text: "Languages",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16..sp,
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 30..r,
                                    color: Colors.black.withOpacity(.47),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10..h),
                              Divider(color: Color(0xffC4C4C4), thickness: 1.5.h),
                              SizedBox(height: 17..h),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/privacy.png",
                                    height: 20.h,
                                    width: 20.w,
                                    color: Colors.black.withOpacity(0.47),
                                  ),
                                  SizedBox(width: 11..w),
                                  CustomCard(
                                      height: 25..h,
                                      width: 2..w,
                                      cardColor: Colors.black.withOpacity(.47),
                                      cardChild: SizedBox()),
                                  SizedBox(width: 15..w),
                                  CustomText(
                                    text: "Privacy Policy",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16..sp,
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 30..r,
                                    color: Colors.black.withOpacity(.47),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10..h),
                              Divider(color: Color(0xffC4C4C4), thickness: 1.5.h),
                              SizedBox(height: 17..h),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/share.png",
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                  SizedBox(width: 11..w),
                                  CustomCard(
                                      height: 25..h,
                                      width: 2..w,
                                      cardColor: Colors.black.withOpacity(.47),
                                      cardChild: SizedBox()),
                                  SizedBox(width: 15..w),
                                  CustomText(
                                    text: "Share App",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16..sp,
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 30..r,
                                    color: Colors.black.withOpacity(.47),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
