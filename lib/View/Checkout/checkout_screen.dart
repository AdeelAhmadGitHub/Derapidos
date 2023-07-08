import 'package:derapidos/consts/app_consts.dart';
import 'package:derapidos/controllers/cart_controller.dart';
import 'package:derapidos/models/cart_details.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Custom Widget/button.dart';
import '../Custom Widget/custom_text.dart';
import '../Order Placed/order_placed.dart';

enum OS {
  credit,
  cash,
}

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  OS? _os = OS.credit;
  // var cartController = Get.put(CartController());
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF8F8F8F4),
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
          child: Container(
            padding: const EdgeInsets.only(top: 20).r,
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: "Checkout",
                          fontColor: const Color(0xff444444),
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  // height: MediaQuery.of(context).size.height,
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Container(height: 4.h);
                    },
                    itemCount: cartController.cartDetails!.details!.length,
                    itemBuilder: (context, index) {
                      Details? details = cartController.cartDetails!.details![index];
                      return Column(
                        children: [
                          Container(
                            //height: 111.h,
                            width: 315.w,
                            decoration: BoxDecoration(
                              color: const Color(0xfffFFFFFF),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Image.asset("assets/images/Chef_Burger.png",
                                    SizedBox(
                                      height: 60.h,
                                      width: 80.w,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.r),
                                          bottomLeft: Radius.circular(8.r),
                                          topRight: Radius.circular(8.r),
                                          bottomRight: Radius.circular(8.r),
                                        ),
                                        child: Image.network(
                                          "${details.productImage}",
                                          // height: 111.h,
                                          // width: 92.w,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),

                                    // SizedBox(width: 10.h),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: "${details.productName}",
                                          // text: "Chef’s Burger",
                                          fontColor: const Color(0xff000000),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                        // SizedBox(height: 5.h),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: (Get.width * 0.38).w,
                                              child: CustomText(
                                                text: "${details.productDescription}",
                                                // text: "Bread, grilled meat, lettuce,\nSandwich feature two savery\n flame-grilled beef patties",
                                                fontColor: const Color(0xff868686),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 12).r,
                                              child: Container(
                                                height: 17.h,
                                                width: 46.w,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xffF4F4F4),
                                                  borderRadius: BorderRadius.circular(2.r),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(width: 5.w),
                                                    CustomText(
                                                      text: "${details.quantity}",
                                                      // text: "2",
                                                      fontColor: AppColors().mainColor2,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 10.sp,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h),
                                        CustomText(
                                          text: "\$${details.productPrice}",
                                          //  text: "\$16.19",
                                          fontColor: AppColors().mainColor2,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const SizedBox(height: 50),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                cartController.currentAddress == null
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Delivery Address",
                              fontColor: const Color(0xff444444),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                            CustomText(
                              text: "Change",
                              fontColor: AppColors().mainColor2,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                      ),
                cartController.currentAddress == null ? Container() : SizedBox(height: 20.h),
                cartController.currentAddress == null
                    ? Container()
                    : Container(
                        height: 107.h,
                        width: 315.w,
                        decoration: BoxDecoration(
                          color: const Color(0xfffFFFFFF),
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 5.0,
                              color: Color(0xffE5E5E5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0).r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Deliver To: Home",
                                fontColor: const Color(0xff444444),
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                              SizedBox(height: 10.h),
                              CustomText(
                                text: "${cartController.currentAddress!.mobile}",
                                // text: "(+1) 331 623 8413",
                                fontColor: const Color(0xff444444),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                              SizedBox(height: 4.h),
                              CustomText(
                                text: "${cartController.currentAddress!.address}",
                                // text: "3 Newbridge Court",
                                fontColor: const Color(0xff444444),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                              SizedBox(height: 4.h),
                              CustomText(
                                text: "${cartController.currentAddress!.city} "
                                    "${cartController.currentAddress!.country}",

                                //  text: "Chino Hills, CA 91709, United States",
                                fontColor: const Color(0xff444444),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                SizedBox(height: 20.h),

                // Container(
                //   height: 111.h,
                //   width: 315.w,
                //   decoration: BoxDecoration(
                //     color: const Color(0xfffFFFFFF),
                //     borderRadius: BorderRadius.circular(5.r),
                //     boxShadow: const [
                //       BoxShadow(
                //         offset: Offset(0, 0),
                //         blurRadius: 5.0,
                //         color: Color(0xffE5E5E5),
                //       ),
                //     ],
                //   ),
                //   child: Column(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Image.asset(
                //             "assets/images/Chef_Burger.png",
                //             height: 111.h,
                //             width: 92.w,
                //             fit: BoxFit.fill,
                //           ),
                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               CustomText(
                //                 text: "Chef’s Burger",
                //                 fontColor: const Color(0xff000000),
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14.sp,
                //               ),
                //               SizedBox(height: 5.h),
                //               CustomText(
                //                 text:
                //                     "Bread, grilled meat, lettuce,\nSandwich feature two savery\n flame-grilled beef patties",
                //                 fontColor: const Color(0xff868686),
                //                 fontWeight: FontWeight.w400,
                //                 fontSize: 11.sp,
                //               ),
                //               SizedBox(height: 5.h),
                //               CustomText(
                //                 text: "\$16.19",
                //                 fontColor: const Color(0xff5D3EBF),
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 14.sp,
                //               ),
                //             ],
                //           ),
                //           Column(
                //             children: [
                //               Container(
                //                 height: 31.h,
                //                 width: 30.w,
                //                 decoration: BoxDecoration(
                //                     color: const Color(0xffFEBD00),
                //                     borderRadius:
                //                         BorderRadius.circular(3.r)),
                //                 child: const Icon(
                //                   Icons.favorite_border,
                //                   size: 14,
                //                   color: Colors.white,
                //                 ),
                //               ),
                //               const SizedBox(
                //                 height: 50,
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(right: 12).r,
                //                 child: Container(
                //                   height: 17.h,
                //                   width: 31.w,
                //                   decoration: BoxDecoration(
                //                       color: const Color(0xffF4F4F4),
                //                       borderRadius:
                //                           BorderRadius.circular(2.r)),
                //                   child: const Icon(
                //                     Icons.add,
                //                     size: 7,
                //                     color: const Color(0xff5D3EBF),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 30, right: 30).r,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       CustomText(
                //         text: "Delivery Address",
                //         fontColor: const Color(0xff444444),
                //         fontWeight: FontWeight.w500,
                //         fontSize: 16.sp,
                //       ),
                //       CustomText(
                //         text: "Change",
                //         fontColor: const Color(0xff5D3EBF),
                //         fontWeight: FontWeight.w400,
                //         fontSize: 12.sp,
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // Container(
                //   height: 107.h,
                //   width: 315.w,
                //   decoration: BoxDecoration(
                //     color: const Color(0xfffFFFFFF),
                //     borderRadius: BorderRadius.circular(8.r),
                //     boxShadow: [
                //       const BoxShadow(
                //         offset: Offset(0, 0),
                //         blurRadius: 5.0,
                //         color: Color(0xffE5E5E5),
                //       ),
                //     ],
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(12.0).r,
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         CustomText(
                //           text: "Deliver To: Home",
                //           fontColor: const Color(0xff444444),
                //           fontWeight: FontWeight.w600,
                //           fontSize: 14.sp,
                //         ),
                //         SizedBox(
                //           height: 10.h,
                //         ),
                //         CustomText(
                //           text: "(+1) 331 623 8413",
                //           fontColor: const Color(0xff444444),
                //           fontWeight: FontWeight.w400,
                //           fontSize: 12.sp,
                //         ),
                //         SizedBox(
                //           height: 4.h,
                //         ),
                //         CustomText(
                //           text: "3 Newbridge Court",
                //           fontColor: const Color(0xff444444),
                //           fontWeight: FontWeight.w400,
                //           fontSize: 12.sp,
                //         ),
                //         SizedBox(height: 4.h),
                //         CustomText(
                //           text: "Chino Hills, CA 91709, United States",
                //           fontColor: const Color(0xff444444),
                //           fontWeight: FontWeight.w400,
                //           fontSize: 12.sp,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),

                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Payment Method",
                        fontColor: const Color(0xff444444),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20).r,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio<OS>(
                          activeColor: AppColors().mainColor2,
                          value: OS.credit,
                          groupValue: _os,
                          onChanged: (OS? value) {
                            _os = value;

                            cartController.paymentMethod = 1;
                            cartController.paymentMethodType = "Credit Card";
                            setState(() {});
                          },
                        ),
                        CustomText(
                          text: "Credit Card",
                          fontColor: const Color(0xff444444),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        Radio<OS>(
                          activeColor: AppColors().mainColor2,
                          value: OS.cash,
                          groupValue: _os,
                          onChanged: (OS? value) {
                            _os = value;

                            cartController.paymentMethod = 2;
                            cartController.paymentMethodType = "Cash on Delivery";
                            setState(() {});
                          },
                        ),
                        CustomText(
                          text: "Cash on Delivery",
                          fontColor: const Color(0xff444444),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Item Total",
                              fontColor: const Color(0xff868686),
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                            CustomText(
                              text: "\$${cartController.itemTotal.toStringAsFixed(2)}",
                              // text: "\$32.38",
                              fontColor: const Color(0xff444444),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ],
                        )),
                        SizedBox(height: 8.h),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Discount",
                              fontColor: const Color(0xff868686),
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                            CustomText(
                              text: "\$${cartController.discount.toStringAsFixed(2)}",
                              //  text: "\$0.00",
                              fontColor: const Color(0xff444444),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ],
                        )),
                        SizedBox(height: 8.h),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Taxes",
                              fontColor: const Color(0xff868686),
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                            CustomText(
                              text: "\$${cartController.tax.toStringAsFixed(2)}",
                              // text: "\$2.62",
                              fontColor: const Color(0xff444444),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ],
                        )),
                        SizedBox(height: 8.h),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Delivery Charges",
                              fontColor: const Color(0xff868686),
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                            CustomText(
                              text: "\$${cartController.deliveryCharges.toStringAsFixed(2)}",
                              // text: "\$5.00",
                              fontColor: const Color(0xff444444),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Total",
                        fontColor: const Color(0xff444444),
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                      CustomText(
                        text: "\$${cartController.checkoutTotal.toStringAsFixed(2)}",
                        // text: "\$40.00",
                        fontColor: const Color(0xff444444),
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ],
                  )),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                  child: MyCustomButton(
                    onPressed: () async {
                      showLoading(context);
                      var res = await cartController.checkOutNow(context);
                      Get.back();
                      if (res!) {
                        Get.off(const OrderPlaced());
                      } else {
                        showSnackBar(context, 'Checkout Operation Failed');
                      }
                    },
                    height: 45.h,
                    width: 315.w,
                    buttonColor: const Color(0xffEC2547),
                    text: "Confirm Order",
                    textColor: const Color(0xffFFFFFF),
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
