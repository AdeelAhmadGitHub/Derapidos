import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/controllers/r_s_controller/add_property_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';
import '../../../component/custom_card.dart';
import '../../../consts/app_consts.dart';
import '../../../controllers/r_s_controller/home_controller.dart';
import '../r_s_bottom_nev_bar/r_s_bottom_nev_bar_screen.dart';

class RSFilterScreen extends StatefulWidget {
  RSFilterScreen({Key? key}) : super(key: key);

  @override
  State<RSFilterScreen> createState() => _RSFilterScreenState();
}

class _RSFilterScreenState extends State<RSFilterScreen> {
  final controller = Get.put(AddPropertyController());
  final _controller = Get.put(RSHomeController());

  String? areaF = '', priceMaximum = '', areato = '', priceFrom = '';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPropertyController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () => Navigator.pop(
              context,
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: CustomText(
            text: "Filter",
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            fontColor: Colors.black,
          ),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  _controller.userID = "";
                  _controller.listing_type = "";
                  _controller.category_id = "";
                  _controller.price_min = "";
                  _controller.price_max = "";
                  _controller.statusIsfurneshed = "";
                  _controller.bedrooms = "";
                  _controller.bathrooms = "";
                  _controller.area_unit = "";
                  _controller.area_start = "";
                  _controller.area_end = "";
                  Get.off(RSBottomNevBar());
                },
                child: CustomText(
                  text: "Clear all",
                  fontSize: 20.sp,
                  fontColor: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 10.w)
          ],
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

                    SizedBox(height: 20..h),
                    CustomText(
                      text: "Price",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 5..h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "From",
                              fontSize: 14.sp,
                            ),
                            SizedBox(height: 5.h),
                            CustomCard(
                              height: 34.h,
                              width: 150.w,
                              border: Border.all(color: const Color(0xff9098B1)),
                              borderRadius: BorderRadius.circular(10),
                              cardChild: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      priceMaximum = value;
                                      controller.priceMin.value = value;
                                    },
                                  )),
                            ),
                            SizedBox(height: 5.h),
                            CustomText(
                              text: "\$100",
                              fontSize: 10.sp,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "To",
                              fontSize: 14.sp,
                            ),
                            SizedBox(height: 5.h),
                            CustomCard(
                              height: 34.h,
                              width: 150.w,
                              border: Border.all(color: const Color(0xff9098B1)),
                              borderRadius: BorderRadius.circular(10),
                              cardChild: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      priceFrom = value;
                                      controller.priceMax.value = value;
                                    },
                                  )),
                            ),
                            SizedBox(height: 5.h),
                            CustomText(
                              text: "\$100,000,00",
                              fontSize: 10.sp,
                            ),
                          ],
                        ),
                      ],
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
                            const Divider(color: Color(0xff9098B1)),
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

                    // SizedBox(height: 10..h),
                    const Divider(color: Color(0xff9098B1)),
                    CustomText(
                      text: "Area",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 5..h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "From",
                              fontSize: 14.sp,
                            ),
                            SizedBox(height: 5.h),
                            CustomCard(
                              height: 34.h,
                              width: 150.w,
                              border: Border.all(color: const Color(0xff9098B1)),
                              borderRadius: BorderRadius.circular(10),
                              cardChild: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      areaF = value;
                                      controller.areaFrom.value = value;
                                    },
                                  )),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "To",
                              fontSize: 14.sp,
                            ),
                            SizedBox(height: 5.h),
                            CustomCard(
                              height: 34.h,
                              width: 150.w,
                              border: Border.all(color: const Color(0xff9098B1)),
                              borderRadius: BorderRadius.circular(10),
                              cardChild: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      areato = value;
                                      controller.areaTo.value = value;
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 45..h),
                    GestureDetector(
                      onTap: () {
                        _controller.price_min = controller.priceMin.value;
                        _controller.price_max = controller.priceMax.value;
                        _controller.area_start = controller.areaTo.value;
                        _controller.area_end = controller.areaFrom.value;
                        _controller.area_unit = controller.areaUnitValue;
                        _controller.bedrooms = controller.bedRoomValue;
                        _controller.bathrooms = controller.bathRoomValue;
                        _controller.statusIsfurneshed = controller.isfurneshedValueSet;
                        _controller.listing_type = controller.saleRenttype;
                        _controller.category_id = controller.isCategoryValue;
                        Get.off(RSBottomNevBar());
                      },
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
                        ),
                      ),
                    ),
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

// CustomText(
// text: "Posted By",
// fontSize: 18.sp,
// fontWeight: FontWeight.w500,
// ),
// Row(
// children: [
// Row(
// children: [
// Radio(
// // fillColor:
// //     MaterialStateProperty.resolveWith((Set states) {
// //   if (states.contains(MaterialState.disabled)) {
// //     return Colors.orange.withOpacity(.32);
// //   }
// //   return Colors.green;
// // }),
// hoverColor: Colors.red,
// focusColor: Colors.green,
// value: 1,
// groupValue: _value,
// onChanged: (value) {
// setState(() {
// _value = value as int;
// });
// }),
// SizedBox(width: 20.w),
// CustomText(
// text: "Owner",
// fontSize: 16.sp,
// )
// ],
// ),
// SizedBox(width: 52.w),
// Row(
// children: [
// Radio(
// value: 2,
// groupValue: _value,
// onChanged: (value) {
// setState(() {
// _value = value as int;
// });
// }),
// SizedBox(width: 20.w),
// CustomText(
// text: "Agent",
// fontSize: 16.sp,
// )
// ],
// ),
// ],
// ),
// const Divider(color: Color(0xff9098B1)),
