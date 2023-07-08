import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/controllers/orders_controller.dart';
import 'package:derapidos/models/orders.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../consts/app_consts.dart';
import '../Custom Widget/custom_text.dart';
import 'order_details.dart';
import 'orderdetails_cancelled.dart';
import 'orderdetails_processing.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with TickerProviderStateMixin {
  late TabController tabController;
  bool noMore = true;
  final ordersController = Get.put(OrdersController());
  ScrollController scrollController = ScrollController();
  nextScreen() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      Get.to(LoginScreen());
    } else {
      await ordersController.getAllOrders();
      if (ordersController.deliveredOrders!.data!.orderList!.length > 8 ||
          ordersController.processingOrders!.data!.orderList!.length > 8 ||
          ordersController.cancelledOrders!.data!.orderList!.length > 8) {
        noMore = false;
      }
      scrollController.addListener(() {
        if (scrollController.position.maxScrollExtent == scrollController.offset) {
          fetchMoreGetGift();
        }
      });
    }
  }

  @override
  initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);

    nextScreen();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GetX<OrdersController>(
      builder: (controller) {
        return ordersController.loading.value
            ? const Scaffold(body: Center(child: CircularProgressIndicator()))
            : Scaffold(
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
                  child: Container(
                    padding: const EdgeInsets.only(top: 20).r,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: TabBar(
                              controller: tabController,
                              isScrollable: false,
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ).r,
                              // labelPadding: const EdgeInsets.only(
                              //         left: 5.0, right: 5.0)
                              //     .r,
                              indicatorPadding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                              indicatorColor: Colors.transparent,
                              labelColor: Colors.white,
                              indicator: BoxDecoration(
                                color: AppColors().mainColor2,
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              unselectedLabelColor: const Color(0xffC0C0C0),
                              unselectedLabelStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              tabs: const [
                                Tab(
                                  text: "Delivered",
                                ),
                                Tab(
                                  text: "Processing",
                                ),
                                Tab(
                                  text: "Cancelled",
                                ),
                              ]),
                        ),
                        SizedBox(height: 20.h),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              /// Delivered Orders
                              Container(
                                padding: const EdgeInsets.only(left: 20, right: 20).r,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  controller: scrollController,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  itemCount: controller.deliveredList.length + 1, // 5,
                                  itemBuilder: (BuildContext context, int index) {
                                    if (index >= controller.deliveredList.length) {
                                      return Center(
                                          child: noMore
                                              ? CustomText(
                                                  text: 'No More Item',
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                )
                                              : Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                      width: 20.w,
                                                      height: 20.h,
                                                      child: const CircularProgressIndicator()),
                                                ));
                                    } else {
                                      var order = controller.deliveredList[index];
                                      return Card(
                                        color: const Color(0xffFFFFFF),
                                        child: Container(
                                          height: 96.h,
                                          width: double.infinity.w,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFFFFFF),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    // Image.asset("assets/images/order_photo.png",
                                                    Container(
                                                      height: 35.h,
                                                      width: 40.w,
                                                      // margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(shape: BoxShape.circle),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(100),
                                                        child: Image.network(
                                                          "${order.marketImage}",
                                                          height: 96.h,
                                                          width: 99.w,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10..w),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(
                                                          width: 250,
                                                          child: Row(
                                                            children: [
                                                              CustomText(
                                                                text:
                                                                    "${order.marketName}", // "Chef’s Burger",
                                                                fontColor: const Color(0xff444444),
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14.sp,
                                                              ),
                                                              Flexible(
                                                                child: CustomText(
                                                                  text:
                                                                      "(${order.marketAddress})", // "Chef’s Burger",
                                                                  textOverflow: TextOverflow.ellipsis,
                                                                  fontColor: const Color(0xff444444),
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 12.sp,
                                                                ),
                                                              ),
                                                              // SizedBox(width: 20.w),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 5..h),
                                                        Row(
                                                          children: [
                                                            CustomText(
                                                              text:
                                                                  "${order.deliveryDate} - ${order.deliveryTime}", // "06-23-2021",
                                                              fontColor: const Color(0xffC0C0C0),
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 10.sp,
                                                            ),
                                                            SizedBox(width: 10..w),
                                                            CustomText(
                                                              text: "${order.orderTotal} CFA", // "\$45.99",
                                                              fontColor: AppColors().mainColor2,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 10.sp,
                                                            ),
                                                          ],
                                                        ),
                                                        // Padding(
                                                        //   padding: const EdgeInsets.only(
                                                        //     left: 10,
                                                        //     right: 15,
                                                        //   ).r,
                                                        //   child: Row(
                                                        //     children: [
                                                        //       RichText(
                                                        //         textAlign: TextAlign.center,
                                                        //         text: TextSpan(
                                                        //           text: "Quantity:",
                                                        //           style: TextStyle(
                                                        //             color: const Color(0xff9B9B9B),
                                                        //             fontSize: 12.sp,
                                                        //             fontFamily: 'DMSans',
                                                        //             fontWeight: FontWeight.w400,
                                                        //           ),
                                                        //           children: <TextSpan>[
                                                        //             TextSpan(
                                                        //               text: " ${order.quantity}", // " 2",
                                                        //               style: TextStyle(
                                                        //                 color: const Color(0xff444444),
                                                        //                 fontSize: 12.sp,
                                                        //                 fontFamily: 'DMSans',
                                                        //                 fontWeight: FontWeight.w400,
                                                        //               ),
                                                        //             ),
                                                        //           ],
                                                        //         ),
                                                        //       ),
                                                        //       SizedBox(width: 10.w),
                                                        //       RichText(
                                                        //         textAlign: TextAlign.center,
                                                        //         text: TextSpan(
                                                        //           text: "Status:",
                                                        //           style: TextStyle(
                                                        //             color: const Color(0xff9B9B9B),
                                                        //             fontSize: 12.sp,
                                                        //             fontFamily: 'DMSans',
                                                        //             fontWeight: FontWeight.w400,
                                                        //           ),
                                                        //           children: <TextSpan>[
                                                        //             TextSpan(
                                                        //               text:
                                                        //                   " ${order.status!.split(' ').last}", // " Processing",
                                                        //               style: TextStyle(
                                                        //                 color: const Color(0xff444444),
                                                        //                 fontSize: 12.sp,
                                                        //                 fontFamily: 'DMSans',
                                                        //                 fontWeight: FontWeight.w400,
                                                        //               ),
                                                        //             ),
                                                        //           ],
                                                        //         ),
                                                        //       ),
                                                        //     ],
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 5..w),
                                                    Icon(Icons.arrow_forward_ios_sharp, size: 14.r)
                                                  ],
                                                ),
                                                SizedBox(height: 8..h),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 30.h,
                                                      width: 140.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(7.r),
                                                          border: Border.all(
                                                            color: AppColors().mainColor2,
                                                          )),
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
                                                    ),
                                                    Container(
                                                      height: 30.h,
                                                      width: 140.w,
                                                      decoration: BoxDecoration(
                                                          color: AppColors().mainColor2,
                                                          borderRadius: BorderRadius.circular(7.r)),
                                                      child: InkWell(
                                                        onTap: () {
                                                          controller.currentOrderId = order.id;
                                                          print('order Id >> ${controller.currentOrderId}');
                                                          Get.to(const OrderDetails(
                                                            isChecked: "",
                                                          ));
                                                        },
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Icon(
                                                                Icons.restart_alt_rounded,
                                                                color: Colors.white,
                                                                size: 17..r,
                                                              ),
                                                              SizedBox(width: 5..w),
                                                              CustomText(
                                                                textAlign: TextAlign.center,
                                                                text: "Reorder",
                                                                fontColor: const Color(0xffFFFFFF),
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 9.sp,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),

                              /// Processing Orders
                              Container(
                                padding: const EdgeInsets.only(left: 20, right: 20).r,
                                child: ListView.builder(
                                  controller: scrollController,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  itemCount: controller.processingList.length + 1,
                                  // ordersController.processingOrders!.data!.orderList!.length + 1, // 5,
                                  itemBuilder: (BuildContext context, int index) {
                                    if (index >= controller.processingList.length) {
                                      return Center(
                                          child: noMore
                                              ? CustomText(
                                                  text: 'No More Item',
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                )
                                              : Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                      width: 20.w,
                                                      height: 20.h,
                                                      child: const CircularProgressIndicator()),
                                                ));
                                    } else {
                                      var order = controller.processingList[index];
                                      //ordersController.processingOrders!.data!.orderList![index];
                                      return Card(
                                        color: const Color(0xffFFFFFF),
                                        child: Container(
                                          height: 96.h,
                                          width: double.infinity.w,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFFFFFF),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    // Image.asset("assets/images/order_photo.png",
                                                    Container(
                                                      height: 35.h,
                                                      width: 40.w,
                                                      // margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(shape: BoxShape.circle),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(100),
                                                        child: Image.network(
                                                          "${order.marketImage}",
                                                          height: 96.h,
                                                          width: 99.w,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10..w),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(
                                                          width: 250,
                                                          child: Row(
                                                            children: [
                                                              CustomText(
                                                                text:
                                                                    "${order.marketName}", // "Chef’s Burger",
                                                                fontColor: const Color(0xff444444),
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14.sp,
                                                              ),
                                                              Flexible(
                                                                child: CustomText(
                                                                  text:
                                                                      "(${order.marketAddress})", // "Chef’s Burger",
                                                                  textOverflow: TextOverflow.ellipsis,
                                                                  fontColor: const Color(0xff444444),
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 12.sp,
                                                                ),
                                                              ),
                                                              // SizedBox(width: 20.w),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 5..h),
                                                        Row(
                                                          children: [
                                                            CustomText(
                                                              text: "${order.deliveryDate}", // "06-23-2021",
                                                              fontColor: const Color(0xffC0C0C0),
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 10.sp,
                                                            ),
                                                            SizedBox(width: 10..w),
                                                            CustomText(
                                                              text: "${order.orderTotal} CFA", // "\$45.99",
                                                              fontColor: AppColors().mainColor2,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 10.sp,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 5..w),
                                                    Icon(Icons.arrow_forward_ios_sharp, size: 14.r)
                                                  ],
                                                ),
                                                SizedBox(height: 8..h),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      height: 30.h,
                                                      width: 140.w,
                                                      decoration: BoxDecoration(
                                                          color: AppColors().mainColor2,
                                                          borderRadius: BorderRadius.circular(7.r)),
                                                      child: InkWell(
                                                        onTap: () {
                                                          controller.currentOrderId = order.id;
                                                          print('order Id >> ${controller.currentOrderId}');
                                                          Get.to(const OrderDetails(isChecked: "processing"));
                                                        },
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              // Icon(
                                                              //   Icons.restart_alt_rounded,
                                                              //   color: Colors.white,
                                                              //   size: 17..r,
                                                              // ),
                                                              SizedBox(width: 5..w),
                                                              CustomText(
                                                                textAlign: TextAlign.center,
                                                                text: "Details",
                                                                fontColor: const Color(0xffFFFFFF),
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 9.sp,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),

                              ///  Cancelled Orders
                              Container(
                                // height: MediaQuery.of(context).size.height,
                                padding: const EdgeInsets.only(left: 20, right: 20).r,
                                child: ListView.builder(
                                  controller: scrollController,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  itemCount: controller.cancelledlist.length + 1,
                                  // ordersController.processingOrders!.data!.orderList!.length + 1, // 5,
                                  itemBuilder: (BuildContext context, int index) {
                                    if (index >= controller.cancelledlist.length) {
                                      return Center(
                                          child: noMore
                                              ? CustomText(
                                                  text: 'No More Item',
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                )
                                              : Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                      width: 20.w,
                                                      height: 20.h,
                                                      child: const CircularProgressIndicator()),
                                                ));
                                    } else {
                                      var order = controller.cancelledlist[index];
                                      //ordersController.processingOrders!.data!.orderList![index];
                                      return Card(
                                        color: const Color(0xffFFFFFF),
                                        child: Container(
                                          height: 96.h,
                                          width: double.infinity.w,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFFFFFF),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    // Image.asset("assets/images/order_photo.png",
                                                    Container(
                                                      height: 35.h,
                                                      width: 40.w,
                                                      // margin: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(shape: BoxShape.circle),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(100),
                                                        child: Image.network(
                                                          "${order.marketImage}",
                                                          height: 96.h,
                                                          width: 99.w,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10..w),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(
                                                          width: 250,
                                                          child: Row(
                                                            children: [
                                                              CustomText(
                                                                text:
                                                                    "${order.marketName}", // "Chef’s Burger",
                                                                fontColor: const Color(0xff444444),
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14.sp,
                                                              ),
                                                              Flexible(
                                                                child: CustomText(
                                                                  text:
                                                                      "(${order.marketAddress})", // "Chef’s Burger",
                                                                  textOverflow: TextOverflow.ellipsis,
                                                                  fontColor: const Color(0xff444444),
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 12.sp,
                                                                ),
                                                              ),
                                                              // SizedBox(width: 20.w),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 5..h),
                                                        Row(
                                                          children: [
                                                            CustomText(
                                                              text: "${order.deliveryDate}", // "06-23-2021",
                                                              fontColor: const Color(0xffC0C0C0),
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 10.sp,
                                                            ),
                                                            SizedBox(width: 10..w),
                                                            CustomText(
                                                              text: "${order.orderTotal} CFA", // "\$45.99",
                                                              fontColor: AppColors().mainColor2,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 10.sp,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 5..w),
                                                    Icon(Icons.arrow_forward_ios_sharp, size: 14.r)
                                                  ],
                                                ),
                                                SizedBox(height: 8..h),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      height: 30.h,
                                                      width: 140.w,
                                                      decoration: BoxDecoration(
                                                          color: AppColors().mainColor2,
                                                          borderRadius: BorderRadius.circular(7.r)),
                                                      child: InkWell(
                                                        onTap: () {
                                                          controller.currentOrderId = order.id;
                                                          print('order Id >> ${controller.currentOrderId}');
                                                          Get.to(const OrderDetails(isChecked: "processing"));
                                                        },
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              // Icon(
                                                              //   Icons.restart_alt_rounded,
                                                              //   color: Colors.white,
                                                              //   size: 17..r,
                                                              // ),
                                                              SizedBox(width: 5..w),
                                                              CustomText(
                                                                textAlign: TextAlign.center,
                                                                text: "Details",
                                                                fontColor: const Color(0xffFFFFFF),
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 9.sp,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
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

  fetchMoreGetGift() async {
    noMore = false;
    setState(() {});
    if (ordersController.deliveredOrders!.data!.currentPage! <
            ordersController.deliveredOrders!.data!.lastPage! ||
        ordersController.processingOrders!.data!.currentPage! <
            ordersController.processingOrders!.data!.lastPage! ||
        ordersController.cancelledOrders!.data!.currentPage! <
            ordersController.cancelledOrders!.data!.lastPage!) {
      ordersController.getProcessingPage = ordersController.getProcessingPage + 1;
    } else {
      noMore = true;
      setState(() {});
      return;
    }
    ordersController.isProcessing = false;
    await ordersController.getAllOrders();
    setState(() {});
  }
}
