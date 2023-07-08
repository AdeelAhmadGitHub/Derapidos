import 'package:custom_clippers/Clippers/directional_wave_clipper.dart';
import 'package:custom_clippers/enum/enums.dart';
import 'package:derapidos/consts/app_consts.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../component/custom_card.dart';
import '../../controllers/cart_controller.dart';
import '../../user_prefs/user_prefs.dart';
import '../Custom Widget/custom_text.dart';
import '../Login/login_screen.dart';
import '../Store Details/store_detail_screen.dart';

class AwardsScreen extends StatefulWidget {
  const AwardsScreen({Key? key}) : super(key: key);

  @override
  State<AwardsScreen> createState() => _AwardsScreen();
}

class _AwardsScreen extends State<AwardsScreen> {
  var cartController = Get.put(CartController());
  var homeController = Get.put(HomeController());
  nextScreen() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      Get.to(LoginScreen());
    } else {
      cartController.getAllCoupons();
    }
  }

  @override
  initState() {
    // cartController.getCartDetail();
    // cartController.getShippingAddresses();
    nextScreen();
    super.initState();
  }

  int? selectedIndex;

  // restType() async {
  //   await homeController.getSpecialsBreakfast();
  //   homeController.loadingR.value = false;
  // }

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
      body: GetX<CartController>(
        builder: (cartController) {
          return cartController.allCouponLoading.value
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 10..w, vertical: 10.h),
                        itemCount: cartController.allCouponsModel?.couponList?.length ?? 0,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 10..h);
                        },
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            homeController.currentRestaurantId =
                                cartController.allCouponsModel?.couponList![index].marketId.toString() ?? "";
                            Get.to(const StoreDetailScreen());
                          },
                          child: CustomCard(
                            height: 172..h,
                            width: double.maxFinite,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 0.5, blurRadius: 4)],
                            cardChild: Stack(
                              children: [
                                Container(
                                  height: 170,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12, spreadRadius: 0.5, blurRadius: 4)
                                    ],
                                  ),
                                ),
                                ClipPath(
                                  clipper: DirectionalWaveClipper(verticalPosition: VerticalPosition.BOTTOM),
                                  child: Container(
                                    height: 100,
                                    // width: 300,

                                    decoration: BoxDecoration(
                                      color: AppColors().mainColor2,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration:
                                              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                child: Image.network(
                                                  cartController
                                                          .allCouponsModel?.couponList![index].marketImage ??
                                                      "",
                                                  fit: BoxFit.cover,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.black38, shape: BoxShape.circle),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      CustomText(
                                        text: "${cartController.allCouponsModel?.couponList![index].code}",
                                        fontSize: 15..sp,
                                        fontWeight: FontWeight.w700,
                                        fontColor: Colors.black.withOpacity(0.8),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              CustomText(
                                                text: "Discount",
                                                fontSize: 14..sp,
                                                fontWeight: FontWeight.w400,
                                                fontColor: Colors.black.withOpacity(0.5),
                                              ),
                                              CustomText(
                                                text:
                                                    "${cartController.allCouponsModel?.couponList![index].discount}"
                                                    "${cartController.allCouponsModel?.couponList![index].discountType}",
                                                fontSize: 14..sp,
                                                fontWeight: FontWeight.w400,
                                                fontColor: Colors.black.withOpacity(0.3),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              CustomText(
                                                text: "End Date",
                                                fontSize: 14..sp,
                                                fontWeight: FontWeight.w400,
                                                fontColor: Colors.black.withOpacity(0.5),
                                              ),
                                              CustomText(
                                                text: "${cartController.allCouponsModel?.couponList![index].expireAt}",
                                                fontSize: 14..sp,
                                                fontWeight: FontWeight.w400,
                                                fontColor: Colors.black.withOpacity(0.3),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // CustomCard(
                          //   height: 112.h,
                          //   width: 244.w,
                          //   cardColor: Colors.red,
                          //   borderRadius: BorderRadius.circular(8),
                          //   boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 1..r, blurRadius: 5..r)],
                          //   cardChild: Row(
                          //     // crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       SizedBox(height: 8.h),
                          //       SizedBox(
                          //         width: 113.w,
                          //         height: double.maxFinite,
                          //         child: ClipRRect(
                          //           borderRadius: BorderRadius.only(
                          //             topLeft: Radius.circular(8.r),
                          //             bottomLeft: Radius.circular(8.r),
                          //           ),
                          //           child: Image.network(
                          //             cartController.allCouponsModel?.couponList![index].marketImage ?? "",
                          //             fit: BoxFit.cover,
                          //           ),
                          //         ),
                          //       ),
                          //       Expanded(
                          //         child: Padding(
                          //           padding: EdgeInsets.all(10.0.r),
                          //           child: Column(
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             children: [
                          //               CustomText(
                          //                 text:
                          //                     "Coupon No: ${cartController.allCouponsModel?.couponList![index].code}",
                          //                 fontSize: 17.sp,
                          //               ),
                          //               // SizedBox(height: 10.h),
                          //               // CustomText(
                          //               //   text: "Start Time  10:00 am",
                          //               //   fontSize: 15.sp,
                          //               // ),
                          //               // SizedBox(height: 5.h),
                          //               // CustomText(
                          //               //   text: "End Time  10:00 am",
                          //               //   fontSize: 15.sp,
                          //               // ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                  ],
                );
        },

        // Container(
        //   padding: const EdgeInsets.only(
        //     left: 10,
        //     right: 10,
        //     top: 30,
        //     bottom: 20,
        //   ).r,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       // controller.restaurantTypeModel!.message!.data!.isEmpty
        //       //     ? Center(
        //       //         child: Padding(
        //       //           padding: EdgeInsets.only(top: 230.0.h),
        //       //           child: CustomText(
        //       //             text: "No Restaurant",
        //       //             fontColor: const Color(0xff444444),
        //       //             fontWeight: FontWeight.w500,
        //       //             fontSize: 24.sp,
        //       //           ),
        //       //         ),
        //       //       )
        //       //     :
        //       Row(
        //         children: [
        //           Icon(
        //             Icons.history,
        //             color: AppColors().mainColor2,
        //           ),
        //           SizedBox(width: 10.w),
        //           CustomText(
        //             text: "Order History",
        //             fontColor: AppColors().mainColor2,
        //           ),
        //         ],
        //       ),
        //       Divider(), SizedBox(height: 5.w),
        //       CustomText(text: "You didn't mark order yet"),
        //       SizedBox(height: 15.h),
        //       CustomCard(
        //         height: 40.h,
        //         width: double.maxFinite,
        //         cardColor: Colors.grey.shade300,
        //         cardChild: Row(
        //           children: [
        //             SizedBox(width: 10.w),
        //             CustomText(
        //               text: "About Promo",
        //             ),
        //           ],
        //         ),
        //       ),
        //       SizedBox(height: 10.h),
        //       CustomText(
        //           text:
        //               "• Place 5 orders from selected Derapodis restaurants with online payments and get 50 CFA discount on 6th order\n• Restaurant offers can be used in Müdavim orders.\n• The discount amount is 50 TL. This discount must be used in one go. There is no limit for number of Derapidos discounts you can  get through March.\n• To participate, you can order with online payment method and Restaurant Delivery or Getir Delivery option. All orderscan be placed from different selected restaurants• This promotion is valid between 05.03.2023 00:01 and 10.03.2023 23:59.\n• The discount you have earned can only be used at selected Derapidos restaurants with the online payment method and with Restaurant Delivery option until 23:59 on 31.03.2023.\n• All of the first 5 orders must be delivered in order to qualif for a discounted order.\n• The discount amount will be deducted automatically fromyour basket on the \"Checkout"
        //               "screen.\n• GetirFood reserves the right to change the promotion conditions.Restaurants")
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
