import 'dart:async';

import 'package:custom_clippers/Clippers/directional_wave_clipper.dart';
import 'package:custom_clippers/enum/enums.dart';
import 'package:derapidos/View/Custom%20Widget/button.dart';
import 'package:derapidos/View/NavigationBar/navigationbar_screen.dart';
import 'package:derapidos/controllers/cart_controller.dart';
import 'package:derapidos/utils/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../consts/app_consts.dart';
import '../../controllers/satrt_controller.dart';
import '../Custom Widget/custom_text.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  CartController cartController = Get.put(CartController());
  // late GoogleMapController mapController;
  // late LocationData currentLocation;
  //
  // final Completer<GoogleMapController> controller = Completer();
  // static const LatLng sourceLocation = LatLng(37.58975225, -125.265974);
  // static const LatLng destnatoin = LatLng(30.900392868816304, 72.63279232461296);

  @override
  initState() {
    cartController.trackOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<CartController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xff444444),
              ),
              iconSize: 16,
              onPressed: () {
                // Get.off(const SigninScreen());
                Get.back();
                // cartController.trackOrder();
              },
            ),
            titleSpacing: 4,
            title: CustomText(
              text: "Track Order",
              fontColor: const Color(0xff444444),
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
            ),
          ),
          body: controller.trackOrderLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: 300,
                          child: Image.asset(
                            "assets/images/mm.png",
                            fit: BoxFit.fill,
                          ),
                          // child: GoogleMap(
                          //   initialCameraPosition: CameraPosition(target: sourceLocation),
                          // ),
                        ),
                        // Container(
                        //   padding: const EdgeInsets.only(left: 10).r,
                        //   child: Row(
                        //     children: [
                        //       IconButton(
                        //         icon: const Icon(
                        //           Icons.arrow_back_ios_new,
                        //           color: Color(0xff444444),
                        //         ),
                        //         iconSize: 16,
                        //         onPressed: () {
                        //           // Get.off(const SigninScreen());
                        //           Get.back();
                        //           // cartController.trackOrder();
                        //         },
                        //       ),
                        //       CustomText(
                        //         text: "Track Order",
                        //         fontColor: const Color(0xff444444),
                        //         fontWeight: FontWeight.w700,
                        //         fontSize: 20.sp,
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        // SizedBox(height: 20.h),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(children: [
                            //  controller.orderTracking!.trackData!.map((track) { return
                            for (int i = 0; i < controller.orderTracking!.trackData!.length; i++)
                              Container(
                                padding: const EdgeInsets.only(left: 20, right: 20).r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 35),
                                      child: i != 0
                                          ? Column(
                                              children: List.generate(
                                                  4,
                                                  (index) => Container(
                                                        height: 10,
                                                        width: 2,
                                                        color: Colors.black.withOpacity(0.5),
                                                      )),
                                            )
                                          : SizedBox(),
                                    ),
                                    ListTile(
                                      leading: Container(
                                        height: 34.h,
                                        width: 34.w,
                                        decoration: BoxDecoration(
                                          color: AppColors().mainColor2,
                                          borderRadius: BorderRadius.circular(4.r),
                                        ),
                                        child: const Icon(
                                          Icons.check_outlined,
                                          size: 20,
                                          color: Color(0xffFFFFFF),
                                        ),
                                      ),
                                      title: Padding(
                                        padding: const EdgeInsets.only(top: 11).r,
                                        child: CustomText(
                                          text: "${controller.orderTracking!.trackData![i].status}",
                                          // text: "Order Recieved",
                                          fontColor: const Color(0xff444444),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "Your Order has been recieved",
                                        style: TextStyle(
                                          color: const Color(0xff9B9B9B),
                                          fontFamily: "DMSans",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                      trailing: Text(
                                        "${controller.orderTracking!.trackData![i].time}",
                                        // "07:33",
                                        style: TextStyle(
                                          color: const Color(0xff9B9B9B),
                                          fontFamily: "DMSans",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                      isThreeLine: true,
                                    ),
                                    controller.orderTracking!.trackData![i].status == "Your Driver"
                                        ? Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 35),
                                                child: Column(
                                                  children: List.generate(
                                                      4,
                                                      (index) => Container(
                                                            height: 10,
                                                            width: 2,
                                                            color: Colors.black.withOpacity(0.5),
                                                          )),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10).r,
                                                child: Container(
                                                  padding: const EdgeInsets.all(8.0).r,
                                                  height: 68.h,
                                                  width: 267.w,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xffFFFFFF),
                                                    borderRadius: BorderRadius.circular(8).r,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        offset: Offset(0, 0),
                                                        blurRadius: 5.0,
                                                        color: Color(0xffE5E5E5),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      CustomText(
                                                        text: "Your Driver",
                                                        fontColor: const Color(0xffC0C0C0),
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 8.sp,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          CustomText(
                                                            text: "Gustavo Lubin",
                                                            fontColor: const Color(0xff444444),
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 14.sp,
                                                          ),
                                                          Container(
                                                            height: 28.h,
                                                            width: 28.w,
                                                            decoration: BoxDecoration(
                                                                color: AppColors().mainColor2,
                                                                shape: BoxShape.circle),
                                                            child: const Icon(
                                                              Icons.call_outlined,
                                                              size: 12,
                                                              color: Color(0xffFFFFFF),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      CustomText(
                                                        text: "Delivery time 7:55 am ",
                                                        fontColor: AppColors().mainColor2,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 10.sp,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              )
                          ]
                              // ;}).toList(),
                              ),
                        ),
                        for (int i = 0; i < controller.orderTracking!.trackData!.length; i++)
                          controller.orderTracking!.trackData![i].status != "Order Received"
                              ? SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: SizedBox(
                                    height: 45.h,
                                    width: double.infinity.w,
                                    child: controller.cancelLoading.value
                                        ? Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 24.h,
                                                  width: 24.w,
                                                  child: const CircularProgressIndicator(
                                                    strokeWidth: 2.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : MyCustomButton(
                                            onPressed: () async {
                                              await controller.cancelOrder();
                                              Get.offAll(const NavigationbarScreen());
                                            },
                                            height: 45.h,
                                            width: 142.w,
                                            buttonColor: const Color(0xffEC2547),
                                            text: "Cancel Order",
                                            textColor: const Color(0xffFFFFFF),
                                            fontSize: 14.sp,
                                          ),
                                  ),
                                )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
