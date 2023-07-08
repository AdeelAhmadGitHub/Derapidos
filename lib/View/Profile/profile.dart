import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/View/Orders/orders_screen.dart';
import 'package:derapidos/View/Shipping%20Address/shipping_address.dart';
import 'package:derapidos/View/Track%20Order/track_order_screen.dart';
import 'package:derapidos/View/delete_account_screen.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../consts/app_consts.dart';
import '../Custom Widget/custom_text.dart';
import '../Edit_Profile/edit_profile.dart';
import '../Payment Methods/payment_method.dart';
import '../Setting/setting.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool status = false;
  var homeController = Get.put(HomeController());

  gotcallf() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      //log('datansdlaslasljlajlaajlaJLas');
      Get.to(LoginScreen());
    } else {
      //log('uytrtyuiolkjhgcvbnm');

      homeController.getProfile();
      homeController.profileLoading.value = false;
    }
  }

  @override
  initState() {
    gotcallf();
    super.initState();
  }

  final String url = "https://www.freeprivacypolicy.com/live/ee399581-b200-40ca-8232-e59eb6a0a0dc";

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        return homeController.profileLoading.value
            ? const CircularProgressIndicator()
            : Scaffold(
                backgroundColor: Colors.white,
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
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // SizedBox(height: 10.h),
                        Container(
                          height: 190.h,
                          width: double.infinity.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                          decoration: const BoxDecoration(
                            color: Color(0xffffffff),
                            // borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 5.0,
                                color: Color(0xffE5E5E5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 80.h,
                                    width: 87.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        "${homeController.userProfile?.userData?.profilePic ?? ""}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                    width: 200.w,
                                    child: Center(
                                      child: CustomText(
                                        // text: "Alexandra",
                                        text: "${homeController.userProfile?.userData?.name ?? ""}",
                                        fontColor: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(height: 25.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.email_outlined,
                                    size: 20,
                                    color: const Color(0xff9098B1),
                                  ),
                                  SizedBox(width: 8.w),
                                  SizedBox(
                                    width: Get.width * 0.47,
                                    child: CustomText(
                                      // text: "alexandra23@gmail.com",
                                      text: "${homeController.userProfile?.userData?.email ?? ""}",
                                      fontColor: const Color(0xff9098B1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(height: 25.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.phone_android_outlined,
                                    size: 20,
                                    color: const Color(0xff9098B1),
                                  ),
                                  SizedBox(width: 8.w),
                                  SizedBox(
                                    width: Get.width * 0.47,
                                    child: CustomText(
                                      // text: "(+1) 331 623 8413",
                                      text: "${homeController.userProfile?.userData?.phone ?? "--"}",
                                      fontColor: const Color(0xff9098B1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     CustomText(
                        //       text: "Profile",
                        //       fontColor: const Color(0xff444444),
                        //       fontWeight: FontWeight.w700,
                        //       fontSize: 24.sp,
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 20.h),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () {
                        //         Get.to(const EditProfile());
                        //       },
                        //       child: CustomText(
                        //         text: "Edit Profile",
                        //         fontColor: const Color(0xff5D3EBF),
                        //         fontWeight: FontWeight.w500,
                        //         fontSize: 14.sp,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          // height: 45.h,
                          width: double.infinity.w,
                          decoration: BoxDecoration(
                            color: const Color(0xfffffffff),
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 5.0,
                                color: Color(0xffE5E5E5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 12.h),
                              GestureDetector(
                                onTap: () {
                                  Get.to(ShippingAddress());
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 20.r,
                                      color: Color(0xff9098B1),
                                    ),
                                    SizedBox(width: 10.w),
                                    CustomText(
                                      text: "My Addresses",
                                      fontColor: const Color(0xff9098B1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                    Spacer(),
                                    const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 20,
                                      color: Color(0xffC0C0C0),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(height: 25.h),
                              // GestureDetector(
                              //   onTap: () {
                              //     Get.to(const PaymentMethod());
                              //   },
                              //   child: Container(
                              //     padding:
                              //         const EdgeInsets.only(left: 15, right: 15).r,
                              //     height: 45.h,
                              //     width: 315.w,
                              //     decoration: BoxDecoration(
                              //       color: const Color(0xfffffffff),
                              //       borderRadius: BorderRadius.circular(8.r),
                              //       boxShadow: const [
                              //         BoxShadow(
                              //           offset: Offset(0, 0),
                              //           blurRadius: 5.0,
                              //           color: Color(0xffE5E5E5),
                              //         ),
                              //       ],
                              //     ),
                              //     child: Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         CustomText(
                              //           text: "Payment Methods",
                              //           fontColor: const Color(0xff9098B1),
                              //           fontWeight: FontWeight.w400,
                              //           fontSize: 14.sp,
                              //         ),
                              //         const Icon(
                              //           Icons.arrow_forward_ios_outlined,
                              //           size: 20,
                              //           color: Color(0xffC0C0C0),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 12.h),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Container(
                              //     padding:
                              //         const EdgeInsets.only(left: 15, right: 15).r,
                              //     height: 45.h,
                              //     width: 315.w,
                              //     decoration: BoxDecoration(
                              //       color: const Color(0xfffffffff),
                              //       borderRadius: BorderRadius.circular(8.r),
                              //       boxShadow: const [
                              //         BoxShadow(
                              //           offset: Offset(0, 0),
                              //           blurRadius: 5.0,
                              //           color: Color(0xffE5E5E5),
                              //         ),
                              //       ],
                              //     ),
                              //     child: Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         CustomText(
                              //           text: "Billing History",
                              //           fontColor: const Color(0xff9098B1),
                              //           fontWeight: FontWeight.w400,
                              //           fontSize: 14.sp,
                              //         ),
                              //         const Icon(
                              //           Icons.arrow_forward_ios_outlined,
                              //           size: 20,
                              //           color: Color(0xffC0C0C0),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Notifications",
                                      fontColor: const Color(0xff9098B1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                    FlutterSwitch(
                                      activeColor: AppColors().mainColor2,
                                      width: 25.0.w,
                                      height: 16.0.h,
                                      valueFontSize: 10.0,
                                      toggleSize: 10.0,
                                      value: status,
                                      borderRadius: 8.0,
                                      //  padding: 8.0,
                                      showOnOff: false,
                                      onToggle: (val) {
                                        setState(() {
                                          status = val;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Divider(height: 25.h),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const Setting());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Settings",
                                      fontColor: const Color(0xff9098B1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 20,
                                      color: Color(0xffC0C0C0),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(height: 25.h),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const OrdersScreen());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Track Order",
                                      fontColor: const Color(0xff9098B1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 20,
                                      color: Color(0xffC0C0C0),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(height: 25.h),

                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Container(
                              //     padding:
                              //         const EdgeInsets.only(left: 15, right: 15).r,
                              //     height: 45.h,
                              //     width: 315.w,
                              //     decoration: BoxDecoration(
                              //       color: const Color(0xfffffffff),
                              //       borderRadius: BorderRadius.circular(8.r),
                              //       boxShadow: const [
                              //         BoxShadow(
                              //           offset: Offset(0, 0),
                              //           blurRadius: 5.0,
                              //           color: Color(0xffE5E5E5),
                              //         ),
                              //       ],
                              //     ),
                              //     child: Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         CustomText(
                              //           text: "Support",
                              //           fontColor: const Color(0xff9098B1),
                              //           fontWeight: FontWeight.w400,
                              //           fontSize: 14.sp,
                              //         ),
                              //         const Icon(
                              //           Icons.arrow_forward_ios_outlined,
                              //           size: 20,
                              //           color: Color(0xffC0C0C0),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 12.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // CustomText(

                                      // ),
                                      GestureDetector(
                                        onTap: () async {
                                          await launchUrl(Uri.parse(url));
                                        },
                                        child: CustomText(
                                          text: "About us",
                                          textAlign: TextAlign.start,
                                          fontColor: const Color(0xff8F9394),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                  GestureDetector(
                                    onTap: () async {
                                      await launchUrl(Uri.parse(url));
                                    },
                                    child: CustomText(
                                      text: "Contact us",
                                      textAlign: TextAlign.start,
                                      fontColor: const Color(0xff8F9394),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  GestureDetector(
                                    onTap: () async {
                                      await launchUrl(Uri.parse(url));
                                    },
                                    child: CustomText(
                                      text: "Help",
                                      textAlign: TextAlign.start,
                                      fontColor: const Color(0xff8F9394),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  GestureDetector(
                                    onTap: () async {
                                      await launchUrl(Uri.parse(url));
                                    },
                                    child: CustomText(
                                      text: "Privacy Policy",
                                      textAlign: TextAlign.start,
                                      fontColor: const Color(0xff8F9394),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  GestureDetector(
                                    onTap: () => Get.to(DeleteAccountScreen()),
                                    child: CustomText(
                                      text: "Delete my Account",
                                      textAlign: TextAlign.start,
                                      fontColor: const Color(0xff8F9394),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),

                                  // CustomText(
                                  //   text: "Terms and conditions",
                                  //   fontColor: const Color(0xff8F9394),
                                  //   fontWeight: FontWeight.w500,
                                  //   fontSize: 14.sp,
                                  // ),
                                  // SizedBox(height: 12.h),
                                  InkWell(
                                    onTap: () {
                                      UserPreferences.setLoginCheck(false);
                                      Get.offAll(LoginScreen());
                                    },
                                    child: CustomText(
                                      text: "Logout",
                                      fontColor: const Color(0xff8F9394),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
