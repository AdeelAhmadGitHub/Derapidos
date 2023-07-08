import 'package:derapidos/controllers/payments_controller.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:awesome_card/awesome_card.dart';

import '../../consts/app_consts.dart';
import '../Custom Widget/button.dart';
import '../Custom Widget/custom_text.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  bool isSelected = false;
  bool iisSelected = false;
  //var _isloading = false;
  var paymentsController = Get.put(PaymentsController());

  @override
  initState() {
    paymentsController.getPaymentCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<PaymentsController>(
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
                : Container(
                    padding: const EdgeInsets.only(top: 20).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10).r,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Color(0xff444444),
                                ),
                                iconSize: 16,
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              CustomText(
                                text: "Payment methods",
                                fontColor: const Color(0xff444444),
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 30, right: 30).r,
                              child: CustomText(
                                text: "Your payment cards",
                                fontColor: const Color(0xff444444),
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),

                        ///SizedBox(height: 20.h,),
                        SizedBox(
                          height: Get.height - 196.h,
                          child: Wrap(
                            children: paymentsController.paymentCards!.cards!.map(
                              (card) {
                                return Container(
                                  child: Column(
                                    children: [
                                      // Container(
                                      //   height: 199.h,
                                      //   width: double.maxFinite,
                                      //   padding: const EdgeInsets.only(
                                      //           left: 30, right: 30)
                                      //       .r,
                                      //   child: Image.asset(
                                      //     "assets/images/Card1.png",
                                      //     fit: BoxFit.fill,
                                      //   ),
                                      // ),
                                      // CreditCard(
                                      //   cardNumber: cardNumber,
                                      //   cardExpiry: expiryDate,
                                      //   cardHolderName: cardHolderName,
                                      //   cvv: cvv,
                                      //   bankName: 'Axis Bank',
                                      //   showBackSide: showBack,
                                      //   frontBackground: CardBackgrounds.black,
                                      //   backBackground: CardBackgrounds.white,
                                      //   showShadow: true,
                                      //   // mask: getCardTypeMask(cardType: CardType.americanExpress),
                                      // ),
                                      SizedBox(height: 20.h),
                                      CreditCard(
                                        cardNumber: "**** **** **** ${card.lastFourCardDigits}",
                                        // "5450 7879 4864 7854",
                                        cardExpiry: "${card.expireDate}",
                                        // "10/25",
                                        cardHolderName: "${card.cardHolderName}",
                                        //  "Card Holder",
                                        cvv: "${card.cvv}",
                                        //  "456",
                                        // bankName: "Axis Bank",
                                        cardType: CardType.other,
                                        // Optional if you want to override Card Type
                                        showBackSide: false,
                                        frontBackground: CardBackgrounds.black,
                                        backBackground: CardBackgrounds.white,
                                        // showShadow: true,
                                        textExpDate: 'Exp. Date',
                                        textName: 'Name',
                                        textExpiry: 'MM/YY',
                                      ),

                                      ///
                                      SizedBox(height: 20.h),
                                      Container(
                                        padding: const EdgeInsets.only(left: 30, right: 30).r,
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
                                                value: isSelected,
                                                onChanged: (newValue) async {
                                                  // setState(() {
                                                  //   isSelected = newValue!;
                                                  // });
                                                  await activateCard(context, card.id!, controller);
                                                },
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            CustomText(
                                              text: "Use as default payment method",
                                              fontColor: const Color(0xff444444),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),

                        // Container(
                        //   height: 199,
                        //   width: double.maxFinite,
                        //   padding: const EdgeInsets.only(left: 30, right: 30).r,
                        //   child: Image.asset(
                        //     "assets/images/Card2.png",
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                        // SizedBox(height: 20.h),
                        // Container(
                        //   padding: const EdgeInsets.only(left: 30, right: 30).r,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       Container(
                        //         height: 20.h,
                        //         width: 20.w,
                        //         child: Checkbox(
                        //           checkColor: const Color(0xffFFFFFF),
                        //           activeColor: const Color(0xff5D3EBF),
                        //           side: const BorderSide(
                        //             color: Color(0xffC0C0C0),
                        //             width: 1,
                        //           ),
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(4.r)),
                        //           value: iisSelected,
                        //           onChanged: (newValue) {
                        //             setState(() {
                        //               iisSelected = newValue!;
                        //             });
                        //           },
                        //         ),
                        //       ),
                        //       SizedBox(width: 10.w),
                        //       CustomText(
                        //         text: "Use as default payment method",
                        //         fontColor: const Color(0xff444444),
                        //         fontWeight: FontWeight.w400,
                        //         fontSize: 14.sp,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(width: 30.w),
                      ],
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
                showCustomDialog(context, controller);
              },
            ),
          ),
        );
      },
    );
  }

  Future activateCard(BuildContext context, int cardId, PaymentsController controller) async {
    showLoading(context);
    var res = await controller.activatePaymentCard(cardId);
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
    if (res!) {
      showSnackBar(context, 'Payment Card is activated succesfully');
      controller.loading.value = true;
      setState(() {});
      controller.getPaymentCards();
    } else {
      showSnackBar(context, 'Some Error Occur');
    }
  }
}

Future<dynamic> showCustomDialog(BuildContext context, PaymentsController controller) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Dialog(
            insetPadding: const EdgeInsets.only(left: 0, right: 0, top: 200, bottom: 0).r,
            backgroundColor: Colors.transparent,
            child: AddPaymentCard(controller: controller),
          ),
        );
      });
}

class AddPaymentCard extends StatefulWidget {
  const AddPaymentCard({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PaymentsController controller;

  @override
  State<AddPaymentCard> createState() => _AddPaymentCardState();
}

class _AddPaymentCardState extends State<AddPaymentCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Container(
          //width: 00.w,
          height: 572.h,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34.0.r),
                topRight: Radius.circular(34.0.r),
              ),
            ),
            color: const Color(0xffFBFBFB),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20.h),
                  Container(
                    height: 6.h,
                    width: 60.w,
                    color: const Color(0xffC0C0C0),
                  ),
                  SizedBox(height: 20.h),
                  CustomText(
                    text: "Add new card",
                    fontColor: const Color(0xff222222),
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30).r,
                    child: Container(
                      height: 60.h,
                      width: 315.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0.r),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5.0,
                            color: Color(0xffE5E5E5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18, left: 5, bottom: 10).r,
                        child: TextField(
                          minLines: 2,
                          maxLines: 9,
                          keyboardType: TextInputType.number,
                          cursorColor: const Color(0xffC0C0C0),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            floatingLabelAlignment: FloatingLabelAlignment.start,
                            contentPadding: const EdgeInsets.all(13).r,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Name on card",
                            hintStyle: TextStyle(
                              color: const Color(0xff4B5F61),
                              fontFamily: "GraphikRegular",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onChanged: (value) {
                            widget.controller.newCard!.cardHolderName = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30).r,
                    child: Container(
                      height: 60.h,
                      width: 315.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0.r),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5.0,
                            color: Color(0xffE5E5E5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18, left: 5, bottom: 10).r,
                        child: TextField(
                          minLines: 2,
                          maxLines: 9,
                          keyboardType: TextInputType.number,
                          cursorColor: const Color(0xffC0C0C0),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            floatingLabelAlignment: FloatingLabelAlignment.start,
                            contentPadding: const EdgeInsets.all(13).r,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            labelText: "Card number",
                            labelStyle: TextStyle(
                              decorationColor: const Color(0xff4B5F61),
                              color: const Color(0xff4B5F61),
                              fontFamily: "GraphikRegular",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onChanged: (value) {
                            widget.controller.newCard!.lastFourCardDigits = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30).r,
                    child: Container(
                      height: 60.h,
                      width: 315.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0.r),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5.0,
                            color: Color(0xffE5E5E5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18, left: 5, bottom: 10).r,
                        child: TextField(
                          minLines: 2,
                          maxLines: 9,
                          keyboardType: TextInputType.number,
                          cursorColor: const Color(0xffC0C0C0),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            floatingLabelAlignment: FloatingLabelAlignment.start,
                            contentPadding: const EdgeInsets.all(13).r,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            labelText: "Expire Date",
                            labelStyle: TextStyle(
                              decorationColor: const Color(0xff4B5F61),
                              color: const Color(0xff4B5F61),
                              fontFamily: "GraphikRegular",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onChanged: (value) {
                            widget.controller.newCard!.expireDate = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30).r,
                    child: Container(
                      height: 60.h,
                      width: 315.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0.r),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5.0,
                            color: Color(0xffE5E5E5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18, left: 5, bottom: 10).r,
                        child: TextField(
                          minLines: 2,
                          maxLines: 9,
                          keyboardType: TextInputType.number,
                          cursorColor: const Color(0xffC0C0C0),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            floatingLabelAlignment: FloatingLabelAlignment.start,
                            contentPadding: const EdgeInsets.all(13).r,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            labelText: "CVV",
                            labelStyle: TextStyle(
                              decorationColor: const Color(0xff4B5F61),
                              color: const Color(0xff4B5F61),
                              fontFamily: "GraphikRegular",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onChanged: (value) {
                            widget.controller.newCard!.cvv = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomText(
                    text: "Set as default payment method",
                    fontColor: const Color(0xff222222),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30).r,
                    child: MyCustomButton(
                      onPressed: () async {
                        // Get.to(const PaymentMethod());
                        await addNewCard(widget.controller);
                      },
                      height: 45.h,
                      width: 315.w,
                      buttonColor: const Color(0xffEC2547),
                      text: "Save Card",
                      textColor: const Color(0xffFFFFFF),
                      fontSize: 14.sp,
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }

  Future addNewCard(PaymentsController controller) async {
    controller.newLoading.value = true;
    var res = await controller.addPaymentCard();
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
    if (res!) {
      showSnackBar(context, 'Address is activated succesfully');
      controller.loading.value = true;
      controller.newLoading.value = false;
      setState(() {});
      controller.getPaymentCards();
    } else {
      showSnackBar(context, 'Some Error Occur');
    }
  }
}
