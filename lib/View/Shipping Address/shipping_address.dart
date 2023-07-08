import 'package:derapidos/models/shipping_addresses.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../consts/app_consts.dart';
import '../../controllers/address_controller.dart';
import '../Custom Widget/custom_text.dart';
import 'add_shipping_address.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  // bool isSelected = false;
  // bool iisSelected = false;
  var addressController = Get.put(AddressController());

  @override
  initState() {
    addressController.getAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AddressController>(
      builder: (controller) {
        return Scaffold(
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
            child: controller.loading.value
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Color(0xff444444),
                                  ),
                                  iconSize: 16,
                                  onPressed: () {
                                    // Get.off(const SigninScreen());
                                    Get.back();
                                  },
                                ),
                                CustomText(
                                  text: "Shipping Addresses",
                                  fontColor: const Color(0xff444444),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.sp,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40.h),
                          Wrap(
                            children: controller.shippingAddresses!.addresses!.map(
                              (address) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                                  child: Container(
                                    padding:
                                        const EdgeInsets.only(left: 18, right: 18, top: 16, bottom: 16).r,
                                    height: 180.h,
                                    width: 315.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0.r),
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
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              text: address.fullName, //  "Jane Doe",
                                              fontColor: const Color(0xff444444),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp,
                                            ),
                                            // CustomText(
                                            //   text: "Edit",
                                            //   fontColor:
                                            //       const Color(0xff5D3EBF),
                                            //   fontWeight: FontWeight.w400,
                                            //   fontSize: 14.sp,
                                            // ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        CustomText(
                                          text: address.mobile, // "(+1) 331 623 8413",
                                          fontColor: const Color(0xff444444),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                        ),
                                        SizedBox(height: 5.h),
                                        Container(
                                          height: 42.h,
                                          width: 231.w,
                                          child: CustomText(
                                            text: "${address.address}\n${address.city}, ${address.country}",
                                            // "3 Newbridge Court\nChino Hills, CA 91709, United State",
                                            fontColor: const Color(0xff444444),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(height: 15.h),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 20.h,
                                                width: 20.w,
                                                child: Checkbox(
                                                  checkColor: const Color(0xffFFFFFF),
                                                  activeColor: AppColors().mainColor2,
                                                  side: const BorderSide(
                                                    color: Color(0xffC0C0C0),
                                                    width: 1,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(4.r)),
                                                  value: address.activeStatus == '1',
                                                  onChanged: (newValue) async {
                                                    // setState(() {
                                                    //   isSelected = newValue!;
                                                    // });
                                                    await activateAddress(context, address.id!);
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              CustomText(
                                                text: "Use as the shipping address",
                                                fontColor: const Color(0xff444444),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                          // SizedBox(height: 20.h),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only(left: 30, right: 30).r,
                          //   child: Container(
                          //     padding: const EdgeInsets.only(
                          //             left: 18, right: 18, top: 16, bottom: 16)
                          //         .r,
                          //     height: 160.h,
                          //     width: 315.w,
                          //     decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(10.0.r),
                          //       boxShadow: const [
                          //         BoxShadow(
                          //           offset: Offset(0, 0),
                          //           blurRadius: 5.0,
                          //           color: Color(0xffE5E5E5),
                          //         ),
                          //       ],
                          //     ),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             CustomText(
                          //               text: "Jane Doe",
                          //               fontColor: const Color(0xff444444),
                          //               fontWeight: FontWeight.w600,
                          //               fontSize: 14.sp,
                          //             ),
                          //             CustomText(
                          //               text: "Edit",
                          //               fontColor: const Color(0xff5D3EBF),
                          //               fontWeight: FontWeight.w400,
                          //               fontSize: 14.sp,
                          //             ),
                          //           ],
                          //         ),
                          //         SizedBox(height: 10.h),
                          //         CustomText(
                          //           text: "(+1) 331 623 8413",
                          //           fontColor: const Color(0xff444444),
                          //           fontWeight: FontWeight.w400,
                          //           fontSize: 14.sp,
                          //         ),
                          //         SizedBox(height: 5.h),
                          //         Container(
                          //           height: 42.h,
                          //           width: 231.w,
                          //           child: CustomText(
                          //             text:
                          //                 "3 Newbridge Court\nChino Hills, CA 91709, United States",
                          //             fontColor: const Color(0xff444444),
                          //             fontWeight: FontWeight.w400,
                          //             fontSize: 14.sp,
                          //           ),
                          //         ),
                          //         SizedBox(height: 15.h),
                          //         Container(
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.start,
                          //             children: [
                          //               Container(
                          //                 height: 20.h,
                          //                 width: 20.w,
                          //                 child: Checkbox(
                          //                   checkColor: const Color(0xffFFFFFF),
                          //                   activeColor:
                          //                       const Color(0xff5D3EBF),
                          //                   side: const BorderSide(
                          //                     color: Color(0xffC0C0C0),
                          //                     width: 1,
                          //                   ),
                          //                   shape: RoundedRectangleBorder(
                          //                       borderRadius:
                          //                           BorderRadius.circular(4)),
                          //                   value: iisSelected,
                          //                   onChanged: (newValue) {
                          //                     setState(() {
                          //                       iisSelected = newValue!;
                          //                     });
                          //                   },
                          //                 ),
                          //               ),
                          //               SizedBox(width: 10.w),
                          //               CustomText(
                          //                 text: "Use as the shipping address",
                          //                 fontColor: const Color(0xff444444),
                          //                 fontWeight: FontWeight.w400,
                          //                 fontSize: 14.sp,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
          ),
          floatingActionButton: Container(
            padding: const EdgeInsets.only(bottom: 60.0, right: 40.0).r,
            child: FloatingActionButton(
              elevation: 0.2,
              backgroundColor: AppColors().mainColor2,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Get.to(const AddingShippingAddress());
              },
            ),
          ),
        );
      },
    );
  }

  Future activateAddress(BuildContext context, int addressId) async {
    showLoading(context);
    var res = await addressController.activateShippingAddress(addressId);
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
    if (res!) {
      showSnackBar(context, 'Address is activated succesfully');
      addressController.loading.value = true;
      setState(() {});
      addressController.getAddresses();
    } else {
      showSnackBar(context, 'Some Error Occur');
    }
  }
}
