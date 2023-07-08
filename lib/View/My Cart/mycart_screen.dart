import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/View/Shipping%20Address/shipping_address.dart';
import 'package:derapidos/controllers/cart_controller.dart';
import 'package:derapidos/models/cart_details.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:derapidos/View/Checkout/checkout_screen.dart';
import 'package:derapidos/View/Custom%20Widget/custom_text.dart';

import '../../consts/app_consts.dart';

class MycartScreen extends StatefulWidget {
  const MycartScreen({Key? key}) : super(key: key);

  @override
  State<MycartScreen> createState() => _MycartScreenState();
}

class _MycartScreenState extends State<MycartScreen> {
  int? selectedIndex;
  int index = 0;
  int checkedIndex = 0;
  var cartController = Get.put(CartController());
  nextScreen() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      Get.to(LoginScreen());
    } else {
      cartController.getCartData();
    }
  }

  @override
  initState() {
    // cartController.getCartDetail();
    // cartController.getShippingAddresses();
    nextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<CartController>(
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
            child: cartController.loading.value
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 5).r,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Items",
                                  fontColor: const Color(0xff444444),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          cartController.cartDetails!.details!.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: CustomText(
                                    text: "No Cart Item Found",
                                    fontColor: const Color(0xff444444),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                  ),
                                )
                              : Flexible(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) {
                                      return Container(height: 4.h);
                                    },
                                    itemCount: cartController.cartDetails!.details!.length,
                                    itemBuilder: (context, index) {
                                      Details? details = cartController.cartDetails!.details![index];
                                      return Column(
                                        children: [
                                          Dismissible(
                                              key: UniqueKey(),
                                              onUpdate: (details) {
                                                //
                                              },
                                              onDismissed: (direction) async {
                                                showLoading(context);
                                                var check = await cartController.removeItem(details.cartId);
                                                Get.back();
                                                if (check!) {
                                                  showSnackBar(context, 'Product removed Successfully');
                                                  await cartController.getCartData();
                                                  // cartController.cartDetails!.details!
                                                  //     .removeAt(index);
                                                  // setState(() {});
                                                  // Get.off(const MycartScreen());
                                                } else {
                                                  showSnackBar(context, 'Some Error Occur');
                                                }
                                              },
                                              background: Container(
                                                color: Colors.red,
                                                padding: const EdgeInsets.all(8.0),
                                                alignment: Alignment.centerRight,
                                                child: const Icon(Icons.delete),
                                              ),
                                              direction: DismissDirection.endToStart,
                                              child: Container(
                                                  // height: 111.h,
                                                  width: 315.w,
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
                                                  child: Column(children: [
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          // Image.asset(
                                                          //   "assets/images/Chef_Burger.png",
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
                                                                fit: BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              CustomText(
                                                                text: "${details.productName}",
                                                                fontColor: const Color(0xff000000),
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14.sp,
                                                              ),
                                                              SizedBox(height: 3.h),
                                                              SizedBox(
                                                                // height: 50.h,
                                                                width: (Get.width * 0.38).w,
                                                                child: CustomText(
                                                                  text: "${details.productDescription}",
                                                                  // text: "Bread, grilled meat, lettuce,\nSandwich feature two savery\n flame-grilled beef patties",
                                                                  fontColor: const Color(0xff868686),
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 11.sp,
                                                                ),
                                                              ),
                                                              SizedBox(height: 3.h),
                                                              CustomText(
                                                                text: "\CFA ${details.productPrice}",
                                                                //  text: "\$16.19",
                                                                fontColor: AppColors().mainColor2,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 10.sp,
                                                              ),
                                                            ],
                                                          ),
                                                          Column(children: [
                                                            // Container(
                                                            //   height: 30.h,
                                                            //   width: 30.w,
                                                            //   decoration: BoxDecoration(
                                                            //       color: const Color(
                                                            //           0xffFEBD00),
                                                            //       borderRadius:
                                                            //           BorderRadius
                                                            //               .circular(
                                                            //                   3.r)),
                                                            //   child: const Icon(
                                                            //     Icons
                                                            //         .favorite_border,
                                                            //     size: 14,
                                                            //     color: Colors
                                                            //         .white,
                                                            //   ),
                                                            // ),
                                                            // const SizedBox(height: 50),






                                                            Padding(
                                                                padding: const EdgeInsets.only(right: 12).r,
                                                                child: Container(
                                                                    height: 25.h,
                                                                    width: 60.w,
                                                                    decoration: BoxDecoration(
                                                                      color: const Color(0xffF4F4F4),
                                                                      borderRadius:
                                                                          BorderRadius.circular(2.r),
                                                                    ),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          InkWell(
                                                                              onTap: () async {
                                                                                // remove quantity
                                                                                // details.quantity = '4';
                                                                                int? quantity = int.parse(
                                                                                    details.quantity!);
                                                                                if (quantity > 1) {
                                                                                  quantity = quantity - 1;
                                                                                  details.quantity =
                                                                                      quantity.toString();
                                                                                  setState(() {});
                                                                                  await controller
                                                                                      .updateCartDetail(
                                                                                          quantity, details);
                                                                                  setState(() {});
                                                                                }
                                                                              },
                                                                              child: Icon(
                                                                                Icons.remove,
                                                                                size: 18,
                                                                                color: AppColors().mainColor2,
                                                                              )),
                                                                          SizedBox(width: 5.w),
                                                                          CustomText(
                                                                            text: "${details.quantity}",
                                                                            // text: "2",
                                                                            fontColor: AppColors().mainColor2,
                                                                            fontWeight: FontWeight.w500,
                                                                            fontSize: 10.sp,
                                                                          ),
                                                                          SizedBox(width: 5.w),
                                                                          InkWell(
                                                                              onTap: () async {
                                                                                // add quantity
                                                                                // details.quantity = '4';
                                                                                int? quantity = int.parse(
                                                                                    details.quantity!);
                                                                                quantity = quantity + 1;
                                                                                details.quantity =
                                                                                    quantity.toString();
                                                                                setState(() {});
                                                                                await controller
                                                                                    .updateCartDetail(
                                                                                        quantity, details);
                                                                                setState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                Icons.add,
                                                                                size: 18,
                                                                                color: AppColors().mainColor2,
                                                                              ))
                                                                        ])))
                                                          ])
                                                        ])
                                                  ])))
                                        ],
                                      );
                                    },
                                  ),
                                ),
                          SizedBox(height: 10.h),
                          cartController.currentAddress == null
                              ? Container()
                              : Padding(
                                  padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "Delivery Address",
                                        fontColor: const Color(0xff444444),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(ShippingAddress());
                                        },
                                        child: CustomText(
                                          text: "Change",
                                          fontColor: AppColors().mainColor2,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          cartController.currentAddress == null ? Container() : SizedBox(height: 10.h),
                          cartController.currentAddress == null
                              ? Container()
                              : Padding(
                                  padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                                  child: Container(
                                    width: double.infinity.w,
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
                                ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Details",
                                  fontColor: const Color(0xff444444),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 29.h,
                                    width: 146.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF4F4F4),
                                      borderRadius: BorderRadius.circular(8.0.r),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 5),
                                          blurRadius: 10.0,
                                          color: Color(0xffF4F4F4),
                                        ),
                                      ],
                                    ),
                                    child: TextField(
                                      controller: TextEditingController(
                                        text: controller.currentCoupon == null
                                            ? ""
                                            : "${controller.currentCoupon!.code}",
                                      ),
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        fillColor: const Color(0XffF4F4F4),
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(3.0.r),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(3.0.r)),
                                        contentPadding: EdgeInsets.only(left: 12.w),
                                        hintText: controller.currentCoupon == null
                                            ? "No Code Available"
                                            : "Add Promo code",
                                        hintStyle: const TextStyle(
                                          color: Color(0xff444444),
                                          fontFamily: 'DMSans',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        controller.code = value;
                                        print(controller.code);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 29.h,
                                    width: 82.w,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        await controller.applyCouponCode();
                                        if (controller.appliedCoupon != null) {
                                          cartController.discount = cartController.discount +
                                              controller.appliedCoupon!.data!.discount!;
                                          cartController.checkoutTotal = controller
                                                  .appliedCoupon?.data?.totalAfterDiscount
                                                  ?.toDouble() ??
                                              cartController.checkoutTotal;
                                          setState(() {});
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: AppColors().mainColor2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2.0.r),
                                        ),
                                      ),
                                      child: CustomText(
                                        text: "Apply Code",
                                        fontColor: const Color(0xffFFFFFF),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 9.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w),
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
                                      text: "\CFA ${cartController.itemTotal.toStringAsFixed(2)}",
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
                                      text: "\CFA ${cartController.discount.toStringAsFixed(2)}",
                                      // text: "\$0.00",
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
                                      text:
                                          // "${cartController.tax.toStringAsFixed(2)}%",
                                          "\CFA ${cartController.tax.toStringAsFixed(2)}",
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
                                        text: "\CFA ${cartController.deliveryCharges.toStringAsFixed(2)}",
                                        // text: "\$5.00",
                                        fontColor: const Color(0xff444444),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Total",
                                  fontColor: Color(0xff444444),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                ),
                                CustomText(
                                  text: "\CFA ${cartController.checkoutTotal.toStringAsFixed(2)}",
                                  //  text: "\$40.00",
                                  fontColor: const Color(0xff444444),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                            child: Container(
                              height: 45.h,
                              width: double.infinity.w,
                              child: ElevatedButton.icon(
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 15).r,
                                  child: const Icon(
                                    Icons.shopping_cart,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  Get.off(const CheckoutScreen());
                                },
                                label: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Checkout",
                                      style: TextStyle(
                                        color: const Color(0xffFFFFFF),
                                        fontSize: 14.sp,
                                        fontFamily: 'DMSans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15).r,
                                      child: Text(
                                        "\CFA ${cartController.checkoutTotal.toStringAsFixed(2)}",
                                        //  "\$40.00",
                                        style: TextStyle(
                                          color: const Color(0xffFFFFFF),
                                          fontSize: 14.sp,
                                          fontFamily: 'DMSans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  // backgroundColor: Color(0xff5D3EBF),
                                  primary: AppColors().mainColor2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0.r),
                                  ),
                                ),
                              ),
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
