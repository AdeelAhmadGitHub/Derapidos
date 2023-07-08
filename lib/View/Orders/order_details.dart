import 'package:derapidos/View/Rating&Reviews/ratting_reviews_screen.dart';
import 'package:derapidos/View/Track%20Order/track_order_screen.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:derapidos/controllers/cart_controller.dart';
import 'package:derapidos/controllers/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../consts/app_consts.dart';
import '../Custom Widget/button.dart';
import '../Custom Widget/custom_text.dart';
import '../My Cart/mycart_screen.dart';
import '../Rating&Reviews/add_review.dart';
import '../Reviews/reviews_screen.dart';

class OrderDetails extends StatefulWidget {
  final String? isChecked;
  const OrderDetails({Key? key, required this.isChecked}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  // var ordersController = Get.put(OrdersController());
  CartController cartController = Get.put(CartController());
  OrdersController ordersController = Get.find();
  @override
  initState() {
    ordersController.getOrderDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<OrdersController>(
      builder: (controller) {
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
            child: controller.odLoading.value
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Container(
                      // padding: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80..h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0.1, blurRadius: 1)],
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10..w),
                                Container(
                                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                                    BoxShadow(
                                        color: AppColors().mainColor2, spreadRadius: 00.1, blurRadius: 3)
                                  ]),
                                  child: CircleAvatar(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        "${controller.orderDetail!.orderData!.marketImage}",
                                        height: 96.h,
                                        width: 99.w,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10..w),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "${controller.orderDetail!.orderData!.deliveryDate}",
                                      // text: "06-23-2021",
                                      fontColor: AppColors().mainColor2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                    ),
                                    CustomText(
                                      text:
                                          "${controller.orderDetail!.orderData!.shippingAddress!.first.address}",
                                      // text: "06-23-2021",
                                      // fontColor: AppColors().mainColor2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20..h),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: CustomText(
                                    text: "Order Status",
                                    // text: "Chef’s Burger",
                                    fontColor: const Color(0xff444444),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                widget.isChecked == "processing"
                                    ? GestureDetector(
                                        onTap: () {
                                          cartController.ordertracId = controller.orderDetail!.orderData!.id;
                                          Get.to(TrackOrderScreen());
                                        },
                                        child: CustomText(
                                          text: "Track Order",
                                          // text: "Chef’s Burger",
                                          fontColor: const Color(0xff444444),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.sp,
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                          SizedBox(height: 10..h),
                          Container(
                            height: 80..h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0.1, blurRadius: 1)],
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10..w),
                                Container(
                                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                                    BoxShadow(
                                        color: AppColors().mainColor2, spreadRadius: 00.1, blurRadius: 3)
                                  ]),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.network(
                                          "${controller.orderDetail!.orderData!.marketImage}",
                                          height: 96.h,
                                          width: 99.w,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10..w),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "${controller.orderDetail!.orderData!.status}",
                                      // text: "Delivered",
                                      fontColor: const Color(0xffFFBA49),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.sp,
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: "${controller.orderDetail!.orderData!.marketName}",
                                          // text: "Chef’s Burger",
                                          fontColor: const Color(0xff444444),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                        SizedBox(
                                          width: 170,
                                          child: CustomText(
                                            text: "(${controller.orderDetail!.orderData!.marketAddress})",
                                            textOverflow: TextOverflow.ellipsis,
                                            // text: "Chef’s Burger",
                                            fontColor: const Color(0xff444444),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomText(
                                      text: "${controller.orderDetail!.orderData!.deliveryDate}",
                                      fontColor: const Color(0xffC0C0C0),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                          ///Delivered
                          SizedBox(height: 20..h),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomText(
                              text: "Rider",
                              // text: "Chef’s Burger",
                              fontColor: const Color(0xff444444),
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 10..h),
                          Container(
                            height: 80..h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0.1, blurRadius: 1)],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10..w),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                                      BoxShadow(
                                          color: AppColors().mainColor2, spreadRadius: 0.01, blurRadius: 3)
                                    ]),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: Image.network(
                                            "${controller.orderDetail!.orderData!.driverProfilePic}",
                                            height: 96.h,
                                            width: 99.w,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10..w),
                                  CustomText(
                                    text: "${controller.orderDetail!.orderData!.driverName}",
                                    // text: "Chef’s Burger",
                                    fontColor: const Color(0xff444444),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                  ),
                                  Spacer(),
                                  controller.orderDetail!.orderData!.status == "Delivered"
                                      ? Container(
                                          height: 30.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(7.r),
                                            border: Border.all(
                                              color: AppColors().mainColor2,
                                            ),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              controller.customerId =
                                                  controller.orderDetail!.orderData!.userId;
                                              // Get.to(const RattingReviewsScreen());
                                              await showCustomDialog(context);
                                            },
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: AppColors().mainColor2,
                                                    size: 17..r,
                                                  ),
                                                  SizedBox(width: 5..w),
                                                  CustomText(
                                                    textAlign: TextAlign.center,
                                                    text: "Rate",
                                                    fontColor: AppColors().mainColor2,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 9.sp,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20..h),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomText(
                              text: "Restaurant",
                              // text: "Chef’s Burger",
                              fontColor: const Color(0xff444444),
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 10..h),
                          Container(
                            height: 80..h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0.1, blurRadius: 1)],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10..w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                                      BoxShadow(
                                          color: AppColors().mainColor2, spreadRadius: 00.1, blurRadius: 3)
                                    ]),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/images/fork.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10..w),
                                  CustomText(
                                    text: "${controller.orderDetail!.orderData!.marketName}",
                                    // text: "Chef’s Burger",
                                    fontColor: const Color(0xff444444),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: CustomText(
                                      text: "(${controller.orderDetail!.orderData!.marketAddress})",
                                      // text: "Chef’s Burger",
                                      textOverflow: TextOverflow.ellipsis,
                                      fontColor: const Color(0xff444444),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Spacer(),
                                  controller.orderDetail!.orderData!.status == "Delivered"
                                      ? Container(
                                          height: 30.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(7.r),
                                            border: Border.all(
                                              color: AppColors().mainColor2,
                                            ),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              controller.customerId =
                                                  controller.orderDetail!.orderData!.userId;
                                              // Get.to(const RattingReviewsScreen());
                                              await showCustomDialog(context);
                                            },
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: AppColors().mainColor2,
                                                    size: 17..r,
                                                  ),
                                                  SizedBox(width: 5..w),
                                                  CustomText(
                                                    textAlign: TextAlign.center,
                                                    text: "Rate",
                                                    fontColor: AppColors().mainColor2,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 9.sp,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20..h),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomText(
                              text: "Basket",
                              // text: "Chef’s Burger",
                              fontColor: const Color(0xff444444),
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 10..h),

                          Container(
                            // height: 80..h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0.1, blurRadius: 1)],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 15..h, left: 10..w, right: 10..w, bottom: 15),
                              child: Column(
                                  children: controller.orderDetail!.orderData!.items!.map(
                                (item) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                                            BoxShadow(
                                                color: AppColors().mainColor2,
                                                spreadRadius: 0.01,
                                                blurRadius: 3)
                                          ]),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: Image.network(
                                                "${item.productImage}",
                                                height: 94.h,
                                                width: 99.w,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10..w),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                // SizedBox(width: 38.w),
                                                Container(
                                                  padding: const EdgeInsets.only(right: 15).r,
                                                  child: CustomText(
                                                    text: "${item.productName}",
                                                    // text: "06-23-2021",
                                                    fontColor: const Color(0xff444444),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "Quantity:",
                                                    style: TextStyle(
                                                      color: const Color(0xff9B9B9B),
                                                      fontSize: 12.sp,
                                                      fontFamily: 'DMSans',
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: " ${item.quantity}",
                                                        // text: " 2",
                                                        style: TextStyle(
                                                          color: const Color(0xff444444),
                                                          fontSize: 12.sp,
                                                          fontFamily: 'DMSans',
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ).toList()),
                              // List.generate(
                              //   2,
                              //   (index) => Column(
                              //     children: [
                              //       Row(
                              //         children: [
                              //           Container(
                              //             decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                              //               BoxShadow(
                              //                   color: AppColors().mainColor2,
                              //                   spreadRadius: 00.1,
                              //                   blurRadius: 3)
                              //             ]),
                              //             child: CircleAvatar(
                              //               child: ClipRRect(
                              //                 borderRadius: BorderRadius.circular(100),
                              //                 child:
                              //             ),
                              //           ),
                              //           SizedBox(width: 10..w),
                              //           Column(
                              //             crossAxisAlignment: CrossAxisAlignment.start,
                              //             children: [
                              //               CustomText(
                              //                 text: "Chef’s Burger",
                              //                 fontColor: const Color(0xff444444),
                              //                 fontWeight: FontWeight.w700,
                              //                 fontSize: 14.sp,
                              //               ),
                              //               RichText(
                              //                 textAlign: TextAlign.center,
                              //                 text: TextSpan(
                              //                   text: "Quantity:",
                              //                   style: TextStyle(
                              //                     color: const Color(0xff9B9B9B),
                              //                     fontSize: 12.sp,
                              //                     fontFamily: 'DMSans',
                              //                     fontWeight: FontWeight.w400,
                              //                   ),
                              //                   children: <TextSpan>[
                              //                     TextSpan(
                              //                       text: " 2",
                              //                       style: TextStyle(
                              //                         color: const Color(0xff444444),
                              //                         fontSize: 12.sp,
                              //                         fontFamily: 'DMSans',
                              //                         fontWeight: FontWeight.w400,
                              //                       ),
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ],
                              //       ),
                              //       SizedBox(height: 10..h),
                              //     ],
                              //   ),
                              // ),
                            ),
                          ),

                          SizedBox(height: 20..h),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomText(
                              text: "Payment details",
                              // text: "Chef’s Burger",
                              fontColor: const Color(0xff444444),
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 10..h),
                          Container(
                            height: 380..h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0.1, blurRadius: 1)],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10..w, vertical: 10..h),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: "Other amount",
                                        // text: "Chef’s Burger",
                                        fontColor: const Color(0xff444444),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.sp,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10..h),
                                  Container(
                                    height: 100.h,
                                    width: 370..w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7.r),
                                      border: Border.all(color: Colors.black38),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                text: "Basket",
                                                // text: "Chef’s Burger",
                                                fontColor: const Color(0xff444444),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                              CustomText(
                                                text: "${controller.orderDetail!.orderData!.itemTotal} CFA",
                                                // text: "Chef’s Burger",
                                                fontColor: const Color(0xff444444),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10..h),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                text: "Tax",
                                                // text: "Chef’s Burger",
                                                fontColor: const Color(0xff444444),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                              CustomText(
                                                text: "${controller.orderDetail!.orderData!.tax} CFA",
                                                // text: "Chef’s Burger",
                                                fontColor: const Color(0xff444444),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10..h),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                text: "Delivery Fee",
                                                // text: "Chef’s Burger",
                                                fontColor: const Color(0xff444444),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                              CustomText(
                                                text: "${controller.orderDetail!.orderData!.deliveryFee} CFA",
                                                // text: "Chef’s Burger",
                                                fontColor: const Color(0xff444444),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10..h),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                text: "Total amount ",
                                                // text: "Chef’s Burger",
                                                fontColor: AppColors().mainColor2,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                              CustomText(
                                                text: "${controller.orderDetail!.orderData!.orderTotal} CFA",
                                                // text: "Chef’s Burger",
                                                fontColor: AppColors().mainColor2,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: "Savings",
                                        // text: "Chef’s Burger",
                                        fontColor: const Color(0xff444444),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.sp,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10..h),
                                  Container(
                                    height: 100.h,
                                    width: 370..w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7.r),
                                      border: Border.all(color: Colors.black38),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                text: "Discount",
                                                // text: "Chef’s Burger",
                                                fontColor: const Color(0xff444444),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                              CustomText(
                                                text: "${controller.orderDetail!.orderData!.discount} CFA",
                                                // text: "Chef’s Burger",
                                                fontColor: const Color(0xff444444),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10..h),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                text: "Delivery Fee",
                                                // text: "Chef’s Burger",
                                                fontColor: const Color(0xff444444),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                              CustomText(
                                                text: "0 CFA",
                                                // text: "Chef’s Burger",
                                                fontColor: const Color(0xff444444),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10..h),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                text: "Total Savings ",
                                                // text: "Chef’s Burger",
                                                fontColor: AppColors().mainColor2,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                              CustomText(
                                                text: "${controller.orderDetail!.orderData!.discount} CFA",
                                                // text: "Chef’s Burger",
                                                fontColor: AppColors().mainColor2,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20..h),
                          controller.orderDetail!.orderData!.status == "Delivered"
                              ? GestureDetector(
                                  onTap: () {
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible: false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          insetPadding: EdgeInsets.zero,
                                          contentPadding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                                          elevation: 15,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                          title: Text('Alert!!'),
                                          titleTextStyle: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          content: const Text('Are you sure'),
                                          contentTextStyle: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                          actions: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10, bottom: 15),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: AppColors().mainColor2, blurRadius: 2),
                                                      ],
                                                    ),
                                                    child: TextButton(
                                                      child: Text(
                                                        'No',
                                                        style: TextStyle(color: AppColors().mainColor2),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  Container(
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                      color: AppColors().mainColor2,
                                                      borderRadius: BorderRadius.circular(10),
                                                      boxShadow: [
                                                        BoxShadow(color: Colors.grey, blurRadius: 2),
                                                      ],
                                                    ),
                                                    child: TextButton(
                                                      child: Text(
                                                        'Yes',
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                      onPressed: () {
                                                        controller.customerId =
                                                            controller.orderDetail!.orderData!.userId;
                                                        controller.orderId =
                                                            controller.orderDetail!.orderData!.id;
                                                        ordersController.getReorder();
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10..w),
                                    child: CustomCard(
                                      height: 40..h,
                                      width: double.maxFinite,
                                      cardColor: AppColors().mainColor2,
                                      borderRadius: BorderRadius.circular(10),
                                      cardChild: Center(
                                        child: CustomText(
                                          text: "Reorder",
                                          // text: "Chef’s Burger",
                                          fontColor: Colors.white,
                                          // const Color(0xff444444),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(height: 40..h),
                          // Container(
                          //   child: Row(
                          //     children: [
                          //       IconButton(
                          //         icon: const Icon(
                          //           Icons.arrow_back_ios_new,
                          //           color: Color(0xff444444),
                          //         ),
                          //         iconSize: 13,
                          //         onPressed: () {
                          //           // Get.off(const SigninScreen());
                          //           Get.back();
                          //         },
                          //       ),
                          //       CustomText(
                          //         text: "Order Details",
                          //         fontColor: const Color(0xff444444),
                          //         fontWeight: FontWeight.w700,
                          //         fontSize: 20.sp,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 40.h),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 30, right: 30).r,
                          //   child: Container(
                          //     child: Column(
                          //       children: [
                          //         Container(
                          //             child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             CustomText(
                          //               text: "Order number:",
                          //               fontColor: const Color(0xff868686),
                          //               fontWeight: FontWeight.w400,
                          //               fontSize: 16.sp,
                          //             ),
                          //             CustomText(
                          //               text: "${controller.orderDetail!.orderData!.orderNo}",
                          //               // text: "123456789",
                          //               fontColor: const Color(0xff222222),
                          //               fontWeight: FontWeight.w700,
                          //               fontSize: 16.sp,
                          //             ),
                          //           ],
                          //         )),
                          //         SizedBox(height: 12.h),
                          //         Container(
                          //             child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             CustomText(
                          //               text: "Tracking number:",
                          //               fontColor: const Color(0xff868686),
                          //               fontWeight: FontWeight.w400,
                          //               fontSize: 16.sp,
                          //             ),
                          //             CustomText(
                          //               text: "${controller.orderDetail!.orderData!.trackingNo}",
                          //               // text: "US123456789",
                          //               fontColor: const Color(0xff222222),
                          //               fontWeight: FontWeight.w700,
                          //               fontSize: 16.sp,
                          //             ),
                          //           ],
                          //         )),
                          //         SizedBox(height: 12.h),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(height: 12.h),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.only(left: 30, right: 30).r,
                          //       child: Container(
                          //         child: CustomText(
                          //           text: "Items",
                          //           fontColor: const Color(0xff444444),
                          //           fontWeight: FontWeight.w700,
                          //           fontSize: 18.sp,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 20.h),
                          // // cartController!.cartDetails!.details!.isEmpty
                          // //     ? Padding(
                          // //   padding: const EdgeInsets.only(bottom: 8.0),
                          // //   child: CustomText(
                          // //     text: "No Item Found",
                          // //     fontColor: const Color(0xff444444),
                          // //     fontWeight: FontWeight.w500,
                          // //     fontSize: 15.sp,
                          // //   ),
                          // // )
                          // //     :
                          // SizedBox(
                          //   height: controller.orderDetail!.orderData!.items!.length > 1 ? 170.h : 100.h,
                          //   child: ListView(
                          //       children: controller.orderDetail!.orderData!.items!.map(
                          //     (item) {
                          //       return Padding(
                          //         padding: const EdgeInsets.all(4.0),
                          //         child: Container(
                          //           height: 94.h,
                          //           width: 315.w,
                          //           decoration: BoxDecoration(
                          //             color: const Color(0xffFFFFFF),
                          //             borderRadius: BorderRadius.circular(8.r),
                          //             boxShadow: const [
                          //               BoxShadow(
                          //                 offset: Offset(0, 0),
                          //                 blurRadius: 5.0,
                          //                 color: Color(0xffE5E5E5),
                          //               ),
                          //             ],
                          //           ),
                          //           child: Column(
                          //             children: [
                          //               Row(
                          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                 children: [
                          //                   SizedBox(
                          //                     height: 94.h,
                          //                     width: 99.w,
                          //                     // child: Image.asset("assets/images/OrderDetail.png",
                          //                     // child:
                          //                   ),
                          //                   Column(
                          //                     crossAxisAlignment: CrossAxisAlignment.start,
                          //                     children: [
                          //                       Row(
                          //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                         children: [
                          //                           SizedBox(width: 38.w),
                          //                           Container(
                          //                             padding: const EdgeInsets.only(right: 15).r,
                          //                             child: CustomText(
                          //                               text: "${item.productName}",
                          //                               // text: "06-23-2021",
                          //                               fontColor: const Color(0xffC0C0C0),
                          //                               fontWeight: FontWeight.w400,
                          //                               fontSize: 10.sp,
                          //                             ),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                       Padding(
                          //                         padding: const EdgeInsets.only(left: 10, right: 10).r,
                          //                         child: Row(
                          //                           children: [
                          //                             RichText(
                          //                               textAlign: TextAlign.center,
                          //                               text: TextSpan(
                          //                                 text: "Quantity:",
                          //                                 style: TextStyle(
                          //                                   color: const Color(0xff9B9B9B),
                          //                                   fontSize: 12.sp,
                          //                                   fontFamily: 'DMSans',
                          //                                   fontWeight: FontWeight.w400,
                          //                                 ),
                          //                                 children: <TextSpan>[
                          //                                   TextSpan(
                          //                                     text: " ${item.quantity}",
                          //                                     // text: " 2",
                          //                                     style: TextStyle(
                          //                                       color: const Color(0xff444444),
                          //                                       fontSize: 12.sp,
                          //                                       fontFamily: 'DMSans',
                          //                                       fontWeight: FontWeight.w400,
                          //                                     ),
                          //                                   ),
                          //                                 ],
                          //                               ),
                          //                             ),
                          //                             SizedBox(width: 10.w),
                          //                             RichText(
                          //                               textAlign: TextAlign.center,
                          //                               text: TextSpan(
                          //                                 text: "Size: ",
                          //                                 style: TextStyle(
                          //                                   color: const Color(0xff9B9B9B),
                          //                                   fontSize: 12.sp,
                          //                                   fontFamily: 'DMSans',
                          //                                   fontWeight: FontWeight.w400,
                          //                                 ),
                          //                                 children: <TextSpan>[
                          //                                   TextSpan(
                          //                                     text: "${item.size}",
                          //                                     // text: "Large",
                          //                                     style: TextStyle(
                          //                                       color: const Color(0xff444444),
                          //                                       fontSize: 12.sp,
                          //                                       fontFamily: 'DMSans',
                          //                                       fontWeight: FontWeight.w400,
                          //                                     ),
                          //                                   ),
                          //                                 ],
                          //                               ),
                          //                             ),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                       Padding(
                          //                         padding:
                          //                             const EdgeInsets.only(left: 10, right: 10, top: 15).r,
                          //                         child: Row(
                          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                           children: [
                          //                             RichText(
                          //                               textAlign: TextAlign.center,
                          //                               text: TextSpan(
                          //                                 text: "Extras:",
                          //                                 style: TextStyle(
                          //                                   color: const Color(0xff9B9B9B),
                          //                                   fontSize: 12.sp,
                          //                                   fontFamily: 'DMSans',
                          //                                   fontWeight: FontWeight.w400,
                          //                                 ),
                          //                                 children: <TextSpan>[
                          //                                   TextSpan(
                          //                                     text: "${item.totalExtrasQuantity}",
                          //                                     // text: " 0",
                          //                                     style: TextStyle(
                          //                                       color: const Color(0xff444444),
                          //                                       fontSize: 12.sp,
                          //                                       fontFamily: 'DMSans',
                          //                                       fontWeight: FontWeight.w400,
                          //                                     ),
                          //                                   ),
                          //                                 ],
                          //                               ),
                          //                             ),
                          //                             SizedBox(width: 100.w),
                          //                             CustomText(
                          //                               text: "\CFA ${item.price}",
                          //                               // text: "\$45.99",
                          //                               fontColor: const Color(0xff000000),
                          //                               fontWeight: FontWeight.w700,
                          //                               fontSize: 14.sp,
                          //                             ),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //   ).toList()),
                          // ),
                          // Container(
                          //   height: 94.h,
                          //   width: 315.w,
                          //   decoration: BoxDecoration(
                          //     color: const Color(0xffFFFFFF),
                          //     borderRadius: BorderRadius.circular(8.r),
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
                          //             "assets/images/OrderDetail.png",
                          //             height: 94.h,
                          //             width: 99.w,
                          //             fit: BoxFit.fill,
                          //           ),
                          //           Column(
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             children: [
                          //               Row(
                          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                 children: [
                          //                   Padding(
                          //                     padding: const EdgeInsets.all(10.0).r,
                          //                     child: CustomText(
                          //                       text: "Chef’s Burger",
                          //                       fontColor: const Color(0xff444444),
                          //                       fontWeight: FontWeight.w700,
                          //                       fontSize: 14.sp,
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     width: 38.w,
                          //                   ),
                          //                   Container(
                          //                     padding: const EdgeInsets.only(right: 15).r,
                          //                     child: CustomText(
                          //                       text: "06-23-2021",
                          //                       fontColor: const Color(0xffC0C0C0),
                          //                       fontWeight: FontWeight.w400,
                          //                       fontSize: 10.sp,
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //               Padding(
                          //                 padding: const EdgeInsets.only(left: 10, right: 10).r,
                          //                 child: Row(
                          //                   children: [
                          //                     SizedBox(width: 10.w),
                          //                     RichText(
                          //                       textAlign: TextAlign.center,
                          //                       text: TextSpan(
                          //                         text: "Size: ",
                          //                         style: TextStyle(
                          //                           color: const Color(0xff9B9B9B),
                          //                           fontSize: 12.sp,
                          //                           fontFamily: 'DMSans',
                          //                           fontWeight: FontWeight.w400,
                          //                         ),
                          //                         children: <TextSpan>[
                          //                           TextSpan(
                          //                             text: "Large",
                          //                             style: TextStyle(
                          //                               color: const Color(0xff444444),
                          //                               fontSize: 12.sp,
                          //                               fontFamily: 'DMSans',
                          //                               fontWeight: FontWeight.w400,
                          //                             ),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding: const EdgeInsets.only(left: 10, right: 10, top: 15).r,
                          //                 child: Row(
                          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                   children: [
                          //                     RichText(
                          //                       textAlign: TextAlign.center,
                          //                       text: TextSpan(
                          //                         text: "Extras:",
                          //                         style: TextStyle(
                          //                           color: const Color(0xff9B9B9B),
                          //                           fontSize: 12.sp,
                          //                           fontFamily: 'DMSans',
                          //                           fontWeight: FontWeight.w400,
                          //                         ),
                          //                         children: <TextSpan>[
                          //                           TextSpan(
                          //                             text: " 0",
                          //                             style: TextStyle(
                          //                               color: const Color(0xff444444),
                          //                               fontSize: 12.sp,
                          //                               fontFamily: 'DMSans',
                          //                               fontWeight: FontWeight.w400,
                          //                             ),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     ),
                          //                     SizedBox(
                          //                       width: 100.w,
                          //                     ),
                          //                     CustomText(
                          //                       text: "\$45.99",
                          //                       fontColor: const Color(0xff000000),
                          //                       fontWeight: FontWeight.w700,
                          //                       fontSize: 14.sp,
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 20.h),
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left: 30, right: 30).r,
                          //     child: Container(
                          //       child: CustomText(
                          //         text: "Order information",
                          //         fontColor: const Color(0xff444444),
                          //         fontWeight: FontWeight.w700,
                          //         fontSize: 18.sp,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(height: 20.h),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 30, right: 30).r,
                          //   child: Container(
                          //     child: Column(
                          //       children: [
                          //         Container(
                          //             child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             CustomText(
                          //               text: "Shipping address:",
                          //               fontColor: const Color(0xff868686),
                          //               fontWeight: FontWeight.w400,
                          //               fontSize: 16.sp,
                          //             ),
                          //             CustomText(
                          //               text:
                          //                   "${controller.orderDetail!.orderData!.shippingAddress!.first.address}",
                          //               // text: "3 Newbridge Court,CA 91709,\n United States",
                          //               fontColor: const Color(0xff222222),
                          //               fontWeight: FontWeight.w500,
                          //               fontSize: 12.sp,
                          //             ),
                          //           ],
                          //         )),
                          //         SizedBox(height: 12.h),
                          //         Container(
                          //             child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             CustomText(
                          //               text: "Payment method:",
                          //               fontColor: const Color(0xff868686),
                          //               fontWeight: FontWeight.w400,
                          //               fontSize: 16.sp,
                          //             ),
                          //             // SizedBox(width: 22.w),
                          //             // Image.asset(
                          //             //   "assets/images/MasteCard.png",
                          //             //   height: 25.h,
                          //             //   width: 32,
                          //             //   fit: BoxFit.fill,
                          //             // ),
                          //             // SizedBox(width: 8.w),
                          //             CustomText(
                          //               text: "${controller.orderDetail!.orderData!.paymentMethod}",
                          //               // text: "**** **** **** "
                          //               //     "${controller.orderDetail!.orderData!.paymentCardNumberLastfourdigits}",
                          //               // text: "**** **** **** 3947",
                          //               fontColor: const Color(0xff222222),
                          //               fontWeight: FontWeight.w500,
                          //               fontSize: 12.sp,
                          //             ),
                          //           ],
                          //         )),
                          //         SizedBox(height: 12.h),
                          //         Container(
                          //             child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             CustomText(
                          //               text: "Resturant:",
                          //               fontColor: const Color(0xff868686),
                          //               fontWeight: FontWeight.w400,
                          //               fontSize: 16.sp,
                          //             ),
                          //             CustomText(
                          //               text: "${controller.orderDetail!.orderData!.marketName}",
                          //               // text: "Burger King",
                          //               fontColor: const Color(0xff444444),
                          //               fontWeight: FontWeight.w500,
                          //               fontSize: 16.sp,
                          //             ),
                          //           ],
                          //         )),
                          //         SizedBox(height: 12.h),
                          //         Container(
                          //             child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             CustomText(
                          //               text: "Discount::",
                          //               fontColor: const Color(0xff868686),
                          //               fontWeight: FontWeight.w400,
                          //               fontSize: 16.sp,
                          //             ),
                          //             CustomText(
                          //               text: "${controller.orderDetail!.orderData!.discount}",
                          //               // text: "10%, Personal promo code",
                          //               fontColor: const Color(0xff444444),
                          //               fontWeight: FontWeight.w500,
                          //               fontSize: 16.sp,
                          //             ),
                          //           ],
                          //         )),
                          //         SizedBox(height: 12.h),
                          //         Container(
                          //             child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             CustomText(
                          //               text: "Total:",
                          //               fontColor: const Color(0xff444444),
                          //               fontWeight: FontWeight.w700,
                          //               fontSize: 18.sp,
                          //             ),
                          //             CustomText(
                          //               text: "${controller.orderDetail!.orderData!.itemTotal}",
                          //               // text: "\$40.00",
                          //               fontColor: const Color(0xff444444),
                          //               fontWeight: FontWeight.w700,
                          //               fontSize: 18.sp,
                          //             ),
                          //           ],
                          //         )),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(height: 40.h),
                          // "${controller.orderDetail!.orderData!.status}" == "Cancelled"
                          //     ? Container(
                          //         padding: const EdgeInsets.only(left: 30, right: 30).r,
                          //         height: 45.h,
                          //         width: double.infinity.w,
                          //         // width: 142.w,
                          //         // child: MyCustomButton(
                          //         //   onPressed: () {
                          //         //     // controller.customerId = controller.orderDetail!.orderData!.userId;
                          //         //     // Get.to(const RattingReviewsScreen());
                          //         //   },
                          //         //   height: 45.h,
                          //         //   width: 142.w,
                          //         //   // buttonColor: const Color(0xffEC2547),
                          //         //   text: "Rate",
                          //         //   textColor: const Color(0xffFFFFFF),
                          //         //   fontSize: 14.sp,
                          //         // ),
                          //       )
                          //     : "${controller.orderDetail!.orderData!.status}" == "Delivered"
                          //         ? Container(
                          //             padding: const EdgeInsets.only(left: 30, right: 30).r,
                          //             height: 45.h,
                          //             width: double.infinity.w,
                          //             // width: 142.w,
                          //             // child: MyCustomButton(
                          //             //   onPressed: () {
                          //             //     controller.customerId = controller.orderDetail!.orderData!.userId;
                          //             //     Get.to(const RattingReviewsScreen());
                          //             //     // Get.to(const ReviewsScreen());
                          //             //   },
                          //             //   height: 45.h,
                          //             //   width: 142.w,
                          //             //   // buttonColor: const Color(0xffEC2547),
                          //             //   text: "Rate",
                          //             //   textColor: const Color(0xffFFFFFF),
                          //             //   fontSize: 14.sp,
                          //             // ),
                          //           )
                          //         : Container(
                          //             padding: const EdgeInsets.only(left: 30, right: 30).r,
                          //             height: 45.h,
                          //             width: double.infinity.w,
                          //             child: MyCustomButton(
                          //               onPressed: () {
                          //                 cartController.orderId = controller.orderDetail!.orderData!.id;
                          //                 Get.to(TrackOrderScreen());
                          //               },
                          //               height: 45.h,
                          //               width: 142.w,
                          //               // buttonColor: const Color(0xffEC2547),
                          //               text: "Track Order",
                          //               textColor: const Color(0xffFFFFFF),
                          //               fontSize: 14.sp,
                          //             ),
                          //           ),
                          // Container(
                          //   padding: const EdgeInsets.only(left: 30, right: 30).r,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Container(
                          //         height: 45.h,
                          //         width: 142.w,
                          //         child: MyCustomButton(
                          //           onPressed: () {
                          //             Get.to(const MycartScreen());
                          //           },
                          //           height: 45.h,
                          //           width: 142.w,
                          //           buttonColor: const Color(0xffEC2547),
                          //           text: "Reorder",
                          //           textColor: const Color(0xffFFFFFF),
                          //           fontSize: 14.sp,
                          //         ),
                          //       ),
                          //       Container(
                          //         height: 45.h,
                          //         width: 142.w,
                          //         child: MyCustomButton(
                          //           onPressed: () {
                          //             Get.to(const ReviewsScreen());
                          //           },
                          //           height: 45.h,
                          //           width: 142.w,
                          //           buttonColor: const Color(0xffEC2547),
                          //           text: "Rate",
                          //           textColor: const Color(0xffFFFFFF),
                          //           fontSize: 14.sp,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 40.h),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}

Future<dynamic> showCustomDialog(BuildContext context) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
    // backgroundColor: Colors.black,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      // var rating = 3.0;
      return SingleChildScrollView(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: const AddReview(),
        ),
      );
    },
  );
}
