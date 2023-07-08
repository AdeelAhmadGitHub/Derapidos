import 'package:derapidos/controllers/address_controller.dart';
import 'package:derapidos/models/shipping_addresses.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/app_consts.dart';
import '../Custom Widget/button.dart';
import '../Custom Widget/custom_text.dart';

class AddingShippingAddress extends StatefulWidget {
  const AddingShippingAddress({Key? key}) : super(key: key);

  @override
  State<AddingShippingAddress> createState() => _AddingShippingAddressState();
}

class _AddingShippingAddressState extends State<AddingShippingAddress> {
  // bool isSelected = false;
  // bool iisSelected = false;
  // var addressController = Get.put(AddressController());
  // AddressController addressController = Get.find();
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
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
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
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 30, right: 30).r,
                              child: Container(
                                height: 62.h,
                                width: 315.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0.r),
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
                                    cursorColor: const Color(0xffC0C0C0),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      floatingLabelAlignment: FloatingLabelAlignment.start,
                                      contentPadding:
                                          const EdgeInsets.symmetric(horizontal: 13, vertical: 4).r,
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Full name",
                                      hintStyle: const TextStyle(
                                        color: Color(0xff4B5F61),
                                        fontFamily: "DMSans",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.newAddress!.fullName = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Padding(
                              padding: const EdgeInsets.only(left: 30, right: 30).r,
                              child: Container(
                                height: 62.h,
                                width: 315.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0.r),
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
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4)
                                          .r, // const EdgeInsets.all(13).r,
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Mobile/Fax Number",
                                      hintStyle: const TextStyle(
                                        color: Color(0xff4B5F61),
                                        fontFamily: "DMSans",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.newAddress!.mobile = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(left: 30, right: 30).r,
                              child: Container(
                                height: 60.h,
                                width: 315.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0).r,
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
                                    //keyboardType: TextInputType.,
                                    cursorColor: const Color(0xffC0C0C0),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      floatingLabelAlignment: FloatingLabelAlignment.start,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4)
                                          .r, // const EdgeInsets.all(13).r,
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      labelText: "Address",
                                      labelStyle: const TextStyle(
                                        decorationColor: Color(0xff4B5F61),
                                        color: Color(0xff4B5F61),
                                        fontFamily: "DMSans",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.newAddress!.address = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
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
                                    cursorColor: const Color(0xffC0C0C0),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      floatingLabelAlignment: FloatingLabelAlignment.start,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4)
                                          .r, // const EdgeInsets.all(13).r,
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      labelText: "City/Town",
                                      labelStyle: const TextStyle(
                                        decorationColor: Color(0xff4B5F61),
                                        color: Color(0xff4B5F61),
                                        fontFamily: "DMSans",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.newAddress!.city = value;
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
                                    cursorColor: const Color(0xffC0C0C0),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      floatingLabelAlignment: FloatingLabelAlignment.start,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4)
                                          .r, // const EdgeInsets.all(13).r,
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      labelText: "State/Province/Region",
                                      labelStyle: const TextStyle(
                                        decorationColor: Color(0xff4B5F61),
                                        color: Color(0xff4B5F61),
                                        fontFamily: "DMSans",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.newAddress!.state = value;
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
                                  borderRadius: BorderRadius.circular(8.0).r,
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
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4)
                                          .r, // const EdgeInsets.all(13).r,
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      labelText: "Zip Code (Postal Code)",
                                      labelStyle: const TextStyle(
                                        decorationColor: const Color(0xff4B5F61),
                                        color: const Color(0xff4B5F61),
                                        fontFamily: "DMSans",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.newAddress!.zipcode = value;
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
                                  borderRadius: BorderRadius.circular(8.0).r,
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
                                    cursorColor: const Color(0xffC0C0C0),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      floatingLabelAlignment: FloatingLabelAlignment.start,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4)
                                          .r, // const EdgeInsets.all(13).r,
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      labelText: "Country",
                                      labelStyle: const TextStyle(
                                        decorationColor: Color(0xff4B5F61),
                                        color: Color(0xff4B5F61),
                                        fontFamily: "DMSans",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.newAddress!.country = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40.h),
                            controller.newLoading.value
                                ? const Center(child: CircularProgressIndicator())
                                : Padding(
                                    padding: const EdgeInsets.only(left: 30, right: 30).r,
                                    child: MyCustomButton(
                                      onPressed: () async {
                                        await addNewAddress(controller);
                                      },
                                      height: 45.h,
                                      width: 315.w,
                                      text: "Save Address",
                                      textColor: const Color(0xffFFFFFF),
                                      fontSize: 14.sp,
                                    ),
                                  ),
                          ]),
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future addNewAddress(AddressController controller) async {
    controller.newLoading.value = true;
    var res = await controller.addShippingAddress();
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
    if (res!) {
      showSnackBar(context, 'Address is added succesfully');
      controller.newLoading.value = false;
      setState(() {});
      controller.getAddresses();
    } else {
      showSnackBar(context, 'Some Error Occur');
    }
  }
}
