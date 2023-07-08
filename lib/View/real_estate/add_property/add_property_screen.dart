import 'dart:developer';
import 'dart:io';
import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/View/real_estate/location/location_screen.dart';
import 'package:derapidos/controllers/r_s_controller/choose_feature_controller.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:derapidos/theme.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';
import '../../../component/custom_card.dart';
import '../../../consts/app_consts.dart';
import '../../../controllers/r_s_controller/add_property_controller.dart';
import '../choose_features/choose_features_screen.dart';
import '../r_s_bottom_nev_bar/r_s_bottom_nev_bar_screen.dart';

class AddPropertyScreen extends StatefulWidget {
  AddPropertyScreen({Key? key}) : super(key: key);

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  var controller = Get.put(AddPropertyController());

  var controllerF = Get.put(ChooseFeatureController());

  String? title = '', price = '', area = '', description = '';
  bool? isLogin;
  var _isloading = false;
  nextScreen() async {
    isLogin = await UserPreferences.getLoginCheck() ?? false;
  }

  @override
  initState() {
    nextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPropertyController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          title: CustomText(
            text: "Add Your Property",
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            fontColor: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              CustomCard(
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 2.r, spreadRadius: 1.r)],
                borderRadius: BorderRadius.circular(100.r),
                cardChild: GetBuilder<AddPropertyController>(
                  builder: (c) => FlutterToggleTab(
                    width: 41..w,
                    height: 30..h,
                    selectedIndex: c.tabTextIndexSelected,
                    selectedBackgroundColors: [AppColors().mainColor2],
                    selectedTextStyle: TextStyle(color: Colors.white, fontSize: 16..sp),
                    unSelectedBackgroundColors: const [Colors.white],
                    unSelectedTextStyle: TextStyle(color: Colors.black, fontSize: 16..sp),
                    labels: controller.listTextTabToggle,
                    selectedLabelIndex: (index) => controller.toggle(index),
                    isScroll: false,
                  ),
                ),
              ),
              SizedBox(height: 10..h),
              CustomText(
                text: "Add Images",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 5.h),
              CustomText(
                text: "Upload  up to 20 Images",
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 5..h),
              SizedBox(
                height: 95.h,
                child: Obx(
                  () => ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: 10.h),
                    itemCount:
                        controller.selectedImagesCount.value != 0 ? controller.selectedImagesCount.value : 1,
                    itemBuilder: (context, index) => index != 0
                        ? CustomCard(
                            height: 92..h,
                            width: 153.w,
                            border: Border.all(color: Colors.black),
                            cardChild: Center(
                              child: SizedBox(
                                height: 92..h,
                                width: 153.w,
                                child: Image.file(
                                  File(controller.imagesPath![index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () => controller.selectImages(),
                            child: CustomCard(
                              height: 92..h,
                              width: 153.w,
                              border: Border.all(color: Colors.black),
                              cardChild: Center(
                                child: Image.asset(
                                  "assets/images/71.png",
                                  height: 40.h,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10..h),
                    CustomText(
                      text: "Category",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 5..h),
                    InkWell(
                      onTap: () => controller.updateCategory(),
                      child: GetBuilder<AddPropertyController>(
                        builder: (c) => Row(
                          children: [
                            Image.asset(
                              c.resultFromCategory!.first!,
                              height: 15.h,
                              width: 15.w,
                            ),
                            SizedBox(width: 12.w),
                            CustomText(
                              text: c.resultFromCategory!.last!,
                              fontSize: 14.sp,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 9.r,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(color: Color(0xff9098B1)),
                    SizedBox(height: 20..h),
                    CustomText(
                      text: "Title*",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 10..h),
                    CustomCard(
                      height: 34.h,
                      width: double.maxFinite,
                      border: Border.all(color: const Color(0xff9098B1)),
                      borderRadius: BorderRadius.circular(10),
                      cardChild: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.top,
                          // controller: TextEditingController(),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          onChanged: (value) {
                            title = value;
                            controller.title.value = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20..h),
                    CustomText(
                      text: "Price*",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 10..h),
                    CustomCard(
                      height: 34.h,
                      width: double.maxFinite,
                      border: Border.all(color: const Color(0xff9098B1)),
                      borderRadius: BorderRadius.circular(10),
                      cardChild: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                        child: TextField(
                          // controller: TextEditingController(),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          onChanged: (value) {
                            price = value;
                            controller.price.value = value;
                          },
                        ),
                      ),
                    ),
                    GetBuilder<AddPropertyController>(
                      builder: (c) => Visibility(
                        visible: c.plotsOrNot(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10..h),
                            CustomText(
                              text: "Furnished*",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10..h),
                            Obx(
                              () => Row(
                                children: List.generate(
                                  2,
                                  (index) => Row(
                                    children: [
                                      InkWell(
                                        onTap: () => controller.furnished(index),
                                        child: CustomCard(
                                          height: 30.h,
                                          width: 110.w,
                                          cardColor: controller.isFurnished.value == index
                                              ? AppColors().mainColor2
                                              : const Color(0xffE5E5E5),
                                          borderRadius: BorderRadius.circular(50),
                                          cardChild: Center(
                                            child: CustomText(
                                              text: controller.furnishedType![index],
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                              fontColor: controller.isFurnished.value == index
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20..w),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Divider(color: Color(0xff9098B1)),
                            SizedBox(height: 10..h),
                            CustomText(
                              text: "Bed Rooms*",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10..h),
                            CustomCard(
                              height: 42..h,
                              width: double.maxFinite,
                              border: Border.all(color: const Color(0xffC4C4C4)),
                              cardChild: Obx(
                                () => Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    5,
                                    (index) => Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () => c.updateBedRoom(index),
                                              child: Padding(
                                                padding: controller.isBedroom.value == index
                                                    ? const EdgeInsets.symmetric(vertical: 0)
                                                    : EdgeInsets.symmetric(vertical: 10..h),
                                                child: CustomCard(
                                                  height: 42.h,
                                                  width: 66.5.w,
                                                  border: controller.isBedroom.value == index
                                                      ? Border.all(color: AppColors().mainColor2)
                                                      : controller.isBedroom.value + 1 == index
                                                          ? const Border()
                                                          : Border(
                                                              left: index != 0
                                                                  ? const BorderSide(
                                                                      color: Colors.black, width: 1)
                                                                  : BorderSide.none),
                                                  cardChild: Center(
                                                    child: CustomText(
                                                      text: controller.bedRoom[index],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20..h),
                            CustomText(
                              text: "Bath Rooms*",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10..h),
                            CustomCard(
                              height: 42..h,
                              width: double.maxFinite,
                              border: Border.all(color: const Color(0xffC4C4C4)),
                              cardChild: Obx(
                                () => Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    5,
                                    (index) => Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () => controller.updateBathRoom(index),
                                              child: Padding(
                                                padding: controller.isBathRoom.value == index
                                                    ? const EdgeInsets.symmetric(vertical: 0)
                                                    : EdgeInsets.symmetric(vertical: 10..h),
                                                child: CustomCard(
                                                  height: 42.h,
                                                  width: 66.5.w,
                                                  border: controller.isBathRoom.value == index
                                                      ? Border.all(color: AppColors().mainColor2)
                                                      : controller.isBathRoom.value + 1 == index
                                                          ? const Border()
                                                          : Border(
                                                              left: index != 0
                                                                  ? const BorderSide(
                                                                      color: Colors.black, width: 1)
                                                                  : BorderSide.none),
                                                  cardChild: Center(
                                                    child: CustomText(
                                                      text: controller.bathRoom[index],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10..h),
                            CustomText(
                              text: "Features",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 5..h),
                            GetBuilder<AddPropertyController>(
                              builder: (a) => InkWell(
                                onTap: () {
                                  controllerF.getFeatureList();
                                  a.updateFeature();
                                },
                                child: a.resultFromFeatures.isEmpty
                                    ? Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "None",
                                            fontSize: 14.sp,
                                          ),
                                          Icon(Icons.arrow_forward_ios_outlined, size: 9.r),
                                        ],
                                      )
                                    : SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                            a.resultFromFeatures.length,
                                            (index) => Row(
                                              children: [
                                                CustomText(
                                                  text: a.resultFromFeatures[index],
                                                  fontSize: 14.sp,
                                                ),
                                                CustomText(
                                                  text: ",  ",
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            const Divider(color: Color(0xff9098B1)),
                            CustomText(
                              text: "Floor Level*",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10..h),
                            Obx(
                              () => Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                  controller.floorLevel!.length,
                                  (index) => Row(
                                    children: [
                                      InkWell(
                                        onTap: () => controller.updateFloorLevel(index),
                                        child: CustomCard(
                                          cardColor: Colors.white,
                                          border: Border.all(
                                              color: controller.isFloor.value == index
                                                  ? AppColors().mainColor2
                                                  : Colors.black.withOpacity(0.6)),
                                          borderRadius: BorderRadius.circular(50),
                                          cardChild: Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 7..w, vertical: 7..h),
                                              child: CustomText(
                                                text: controller.floorLevel![index],
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(color: Color(0xff9098B1)),
                    CustomText(
                      text: "Area unit*",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 10..h),
                    Obx(
                      () => Row(
                        children: List.generate(
                          controller.areaUnit!.length,
                          (index) => Row(
                            children: [
                              InkWell(
                                onTap: () => controller.updateUnitArea(index),
                                child: CustomCard(
                                  cardColor: Colors.white,
                                  border: Border.all(
                                      color: controller.isUnitArea.value == index
                                          ? AppColors().mainColor2
                                          : Colors.black.withOpacity(0.6)),
                                  borderRadius: BorderRadius.circular(50),
                                  cardChild: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 7..w, vertical: 7..h),
                                      child: CustomText(
                                        text: controller.areaUnit![index],
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(color: Color(0xff9098B1)),
                    CustomText(
                      text: "Type*",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 10..h),
                    Obx(
                      () => Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          controller.commercialType!.length,
                          (index) => Row(
                            children: [
                              InkWell(
                                onTap: () => controller.updateCommercialType(index),
                                child: CustomCard(
                                  cardColor: Colors.white,
                                  border: Border.all(
                                      color: controller.isCommercialType.value == index
                                          ? AppColors().mainColor2
                                          : Colors.black.withOpacity(0.6)),
                                  borderRadius: BorderRadius.circular(50),
                                  cardChild: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 7..w, vertical: 7..h),
                                      child: CustomText(
                                        text: controller.commercialType![index],
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // SizedBox(height: 10..h),
                    const Divider(color: Color(0xff9098B1)),
                    CustomText(
                      text: "Area*",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 10..h),
                    CustomCard(
                      height: 34.h,
                      width: double.maxFinite,
                      border: Border.all(color: const Color(0xff9098B1)),
                      borderRadius: BorderRadius.circular(10),
                      cardChild: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                        child: TextField(
                          // controller: TextEditingController(),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          onChanged: (value) {
                            area = value;
                            controller.area.value = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10..h),
                    CustomText(
                      text: "Location",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    InkWell(
                      onTap: () => controller.updateLocation(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: controller.resultFromLocation.last.toString(),
                            fontSize: 14.sp,
                          ),
                          Icon(Icons.arrow_forward_ios_outlined, size: 9.r),
                        ],
                      ),
                    ),

                    const Divider(color: Color(0xff9098B1)),
                    SizedBox(height: 10..h),
                    CustomText(
                      text: "Describe what you are selling*",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 10..h),
                    CustomCard(
                      height: 166.h,
                      width: double.maxFinite,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xff9098B1)),
                      cardColor: Colors.white,
                      cardChild: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          // controller: TextEditingController(),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          onChanged: (value) {
                            description = value;
                            controller.description.value = value;
                            print(description);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 45..h),
                    GestureDetector(
                      onTap: () async {
                        if (isLogin == false) {
                          Get.to(LoginScreen());
                        } else {
                          if (controller.title.value.isEmpty) {
                            showSnackBar(context, 'Title is Require');
                            return;
                          }
                          if (controller.price.value.isEmpty) {
                            showSnackBar(context, 'price is Require');
                            return;
                          }
                          if (controller.area.value.isEmpty) {
                            showSnackBar(context, 'Area is Require');
                            return;
                          }
                          if (controller.description.value.isEmpty) {
                            showSnackBar(context, 'Property detail is Require');
                            return;
                          }
                          if (controller.areaUnitValue.isEmpty) {
                            showSnackBar(context, 'Area Unit is Require');
                            return;
                          }
                          if (controller.commercialTypes.isEmpty) {
                            showSnackBar(context, 'Type is Require');
                            return;
                          }
                          if (controller.addressL.isEmpty) {
                            showSnackBar(context, 'Address is Require');
                            return;
                          }
                          if (controller.resultFromFeatures.isEmpty) {
                            showSnackBar(context, 'Features is Require');
                            return;
                          } else {
                            log('data: $title');
                            controller.addPropertyLoader = true;
                            var res = await ApiServices()
                                .saveProperty(
                              controller.title.value,
                              controller.price.value,
                              controller.area.value,
                              controller.description.value,
                              controller.areaUnitValue,
                              controller.bedRoomValue,
                              controller.bathRoomValue,
                              controller.isfurneshedValueSet,
                              controller.saleRenttype,
                              controller.isFloorLevel,
                              controller.commercialTypes,
                              controller.isCategoryValue,
                              controller.addressL,
                              controller.latitudeL,
                              controller.longitudeL,
                              controller.imagesPath ?? [],
                              controller.resultFromFeatures ?? [],
                            )
                                .then((value) {
                              Get.off(RSBottomNevBar());
                              showSnackBar(context, 'Property added successfully');
                            }).onError((error, stackTrace) => showSnackBar(context, 'Some Error Occur'));
                            controller.addPropertyLoader = false;
                            _isloading = false;
                            // _redraw();
                            // if (res != null) {
                            // } else {}
                          }
                        }
                      },
                      child: GestureDetector(
                        child: CustomCard(
                            height: 45.h,
                            width: double.maxFinite,
                            borderRadius: BorderRadius.circular(15),
                            cardColor: AppColors().mainColor2,
                            cardChild: Center(
                              child: CustomText(
                                text: "Apply",
                                fontSize: 14.sp,
                                fontColor: Colors.white,
                              ),
                            )),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppTheme.appColor,
    content: Text(
      text,
      style: TextStyle(
        color: AppTheme.whiteColor,
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
