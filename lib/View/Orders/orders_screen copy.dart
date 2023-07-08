import 'package:derapidos/controllers/orders_controller.dart';
import 'package:derapidos/models/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../consts/app_consts.dart';
import '../Custom Widget/custom_text.dart';
import 'order_details.dart';
import 'orderdetails_cancelled.dart';
import 'orderdetails_processing.dart';

class OrdersScreenCopied extends StatefulWidget {
  const OrdersScreenCopied({Key? key}) : super(key: key);

  @override
  State<OrdersScreenCopied> createState() => _OrdersScreenCopiedState();
}

class _OrdersScreenCopiedState extends State<OrdersScreenCopied> with TickerProviderStateMixin {
  var ordersController = Get.put(OrdersController());

  @override
  initState() {
    super.initState();
    ordersController.getAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return GetX<OrdersController>(
      builder: (controller) {
        return ordersController.loading.value
            ? const CircularProgressIndicator()
            : Scaffold(
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
                      padding: const EdgeInsets.only(top: 40).r,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Orders",
                                  fontColor: const Color(0xff444444),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24.sp,
                                ),
                                Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      color: AppColors().mainColor2,
                                      borderRadius: BorderRadius.circular(3.r)),
                                  child: const ImageIcon(
                                    AssetImage(
                                      "assets/images/Notificaton.png",
                                    ),
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TabBar(
                                  controller: tabController,
                                  isScrollable: true,
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 10,
                                  ).r,
                                  labelPadding: const EdgeInsets.only(left: 30.0, right: 30.0).r,
                                  indicatorPadding:
                                      const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                                  indicatorColor: Colors.transparent,
                                  labelColor: const Color(0xffFFFFFF),
                                  indicator: BoxDecoration(
                                    color: AppColors().mainColor2,
                                    borderRadius: BorderRadius.circular(29.r),
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
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            width: double.infinity,
                            height: double.maxFinite,
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                /// Delivered Orders
                                Container(
                                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        ordersController.deliveredOrders!.data!.orderList!.length, // 5,
                                    itemBuilder: (BuildContext context, int index) {
                                      Order? order =
                                          ordersController.deliveredOrders!.data!.orderList![index];
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
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    // Image.asset("assets/images/order_photo.png",
                                                    SizedBox(
                                                      height: 96.h,
                                                      width: 99.w,
                                                      child: Image.network(
                                                        "${order.marketImage}",
                                                        height: 96.h,
                                                        width: 99.w,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(
                                                                left: 10,
                                                                right: 12,
                                                                top: 14,
                                                                bottom: 8,
                                                              ).r,
                                                              child: CustomText(
                                                                text:
                                                                    "${order.marketName}", // "Chef’s Burger",
                                                                fontColor: const Color(0xff444444),
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14.sp,
                                                              ),
                                                            ),
                                                            SizedBox(width: 20.w),
                                                            CustomText(
                                                              text: "06-23-2021",
                                                              fontColor: const Color(0xffC0C0C0),
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 10.sp,
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                            left: 10,
                                                            right: 15,
                                                          ).r,
                                                          child: Row(
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
                                                                      text: " 2",
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
                                                              RichText(
                                                                textAlign: TextAlign.center,
                                                                text: TextSpan(
                                                                  text: "Status:",
                                                                  style: TextStyle(
                                                                    color: const Color(0xff9B9B9B),
                                                                    fontSize: 12.sp,
                                                                    fontFamily: 'DMSans',
                                                                    fontWeight: FontWeight.w400,
                                                                  ),
                                                                  children: <TextSpan>[
                                                                    TextSpan(
                                                                      text: "  Delivered",
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
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                                  left: 10, right: 10, top: 10, bottom: 10)
                                                              .r,
                                                          child: Row(
                                                            children: [
                                                              CustomText(
                                                                text: "\$45.99",
                                                                fontColor: const Color(0xff000000),
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14.sp,
                                                              ),
                                                              SizedBox(
                                                                width: 72.w,
                                                              ),
                                                              Container(
                                                                height: 20.h,
                                                                width: 50.w,
                                                                decoration: BoxDecoration(
                                                                    color: AppColors().mainColor2,
                                                                    borderRadius: BorderRadius.circular(3.r)),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    Get.to(const OrderDetails(
                                                                      isChecked: "",
                                                                    ));
                                                                  },
                                                                  child: Center(
                                                                    child: CustomText(
                                                                      textAlign: TextAlign.center,
                                                                      text: "Details",
                                                                      fontColor: const Color(0xffFFFFFF),
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 9.sp,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                /// Processing Orders
                                Container(
                                  padding: const EdgeInsets.only(left: 30, right: 25).r,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        ordersController.processingOrders!.data!.orderList!.length, // 5,
                                    itemBuilder: (BuildContext context, int index) {
                                      Order? order =
                                          ordersController.processingOrders!.data!.orderList![index];
                                      return Card(
                                        color: const Color(0xfffFFFFFF),
                                        child: Container(
                                          height: 96.h,
                                          width: double.maxFinite,
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
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    // Image.asset("assets/images/order_photo.png",
                                                    SizedBox(
                                                      height: 96.h,
                                                      width: 99.w,
                                                      child: Image.network(
                                                        "${order.marketImage}",
                                                        height: 96.h,
                                                        width: 99.w,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(
                                                                      left: 10, right: 12, top: 14, bottom: 8)
                                                                  .r,
                                                              child: CustomText(
                                                                text:
                                                                    "${order.marketName}", // "Chef’s Burger",
                                                                fontColor: const Color(0xff444444),
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14.sp,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 28.w,
                                                            ),
                                                            CustomText(
                                                              text: "${order.deliveryDate}", // "06-23-2021",
                                                              fontColor: const Color(0xffC0C0C0),
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 10.sp,
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(left: 10, right: 15).r,
                                                          child: Row(
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
                                                                      text: "${order.quantity}", // " 2",
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
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              RichText(
                                                                textAlign: TextAlign.center,
                                                                text: TextSpan(
                                                                  text: "Status:",
                                                                  style: TextStyle(
                                                                    color: const Color(0xff9B9B9B),
                                                                    fontSize: 12.sp,
                                                                    fontFamily: 'DMSans',
                                                                    fontWeight: FontWeight.w400,
                                                                  ),
                                                                  children: <TextSpan>[
                                                                    TextSpan(
                                                                      text:
                                                                          "${order.status!.split(' ').last}", // " Processing",
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
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                            left: 10,
                                                            right: 15,
                                                            top: 10,
                                                            bottom: 10,
                                                          ).r,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              CustomText(
                                                                text:
                                                                    "\CFA ${order.orderTotal}", // "\$45.99",
                                                                fontColor: const Color(0xff000000),
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14.sp,
                                                              ),
                                                              SizedBox(
                                                                width: 52.w,
                                                              ),
                                                              Container(
                                                                height: 20.h,
                                                                width: 50.w,
                                                                decoration: BoxDecoration(
                                                                    color: AppColors().mainColor2,
                                                                    borderRadius: BorderRadius.circular(3.r)),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    controller.currentOrderId = order.id;
                                                                    print(
                                                                        'order Id >> ${controller.currentOrderId}');
                                                                    // Get.to(  const OrderdetailsProcessing());
                                                                    Get.to(const OrderDetails(
                                                                      isChecked: "",
                                                                    ));
                                                                  },
                                                                  child: Center(
                                                                    child: CustomText(
                                                                      textAlign: TextAlign.center,
                                                                      text: "Details",
                                                                      fontColor: const Color(0xffFFFFFF),
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 9.sp,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                ///  Cancelled Orders
                                Container(
                                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        ordersController.cancelledOrders!.data!.orderList!.length, // 5,
                                    itemBuilder: (BuildContext context, int index) {
                                      Order? order =
                                          ordersController.cancelledOrders!.data!.orderList![index];
                                      return Card(
                                        color: const Color(0xffFFFFFF),
                                        child: Container(
                                          height: 96.h,
                                          width: double.maxFinite,
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
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/order_photo.png",
                                                      height: 96.h,
                                                      width: 99.w,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(
                                                                    left: 10, right: 12, top: 14, bottom: 8)
                                                                .r,
                                                            child: CustomText(
                                                              text: "Chef’s Burger",
                                                              fontColor: const Color(0xff444444),
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 14.sp,
                                                            ),
                                                          ),
                                                          SizedBox(width: 28.w),
                                                          CustomText(
                                                            text: "06-23-2021",
                                                            fontColor: const Color(0xffC0C0C0),
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ]),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                            left: 10,
                                                            right: 15,
                                                          ).r,
                                                          child: Row(
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
                                                                      text: " 2",
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
                                                              RichText(
                                                                textAlign: TextAlign.center,
                                                                text: TextSpan(
                                                                  text: "Status:",
                                                                  style: TextStyle(
                                                                    color: const Color(0xff9B9B9B),
                                                                    fontSize: 12.sp,
                                                                    fontFamily: 'DMSans',
                                                                    fontWeight: FontWeight.w400,
                                                                  ),
                                                                  children: <TextSpan>[
                                                                    TextSpan(
                                                                      text: " Cancelled",
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
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                                  left: 10, right: 15, top: 10, bottom: 10)
                                                              .r,
                                                          child: Row(
                                                            children: [
                                                              CustomText(
                                                                text: "\$45.99",
                                                                fontColor: const Color(0xff000000),
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14.sp,
                                                              ),
                                                              SizedBox(
                                                                width: 72.w,
                                                              ),
                                                              Container(
                                                                height: 20.h,
                                                                width: 50.w,
                                                                decoration: BoxDecoration(
                                                                    color: AppColors().mainColor2,
                                                                    borderRadius: BorderRadius.circular(3.r)),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    Get.to(const OrderdetailsCancelled());
                                                                  },
                                                                  child: Center(
                                                                    child: CustomText(
                                                                      textAlign: TextAlign.center,
                                                                      text: "Details",
                                                                      fontColor: const Color(0xffFFFFFF),
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 9.sp,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
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
                ),
              );
      },
    );
  }
}
