import 'package:derapidos/View/real_estate/filter/filter_screen.dart';
import 'package:derapidos/controllers/r_s_controller/recommended_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../component/custom_card.dart';
import '../../../consts/app_consts.dart';
import '../../../controllers/r_s_controller/near_from_you_controller.dart';
import '../../Custom Widget/custom_text.dart';
import '../details/details_screen.dart';

class RecommendedScreen extends StatelessWidget {
  RecommendedScreen({Key? key}) : super(key: key);

  final _controller = Get.put(RecommendedFromYouController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 35.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10..w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18.r,
                  ),
                ),
                Flexible(
                  child: CustomCard(
                    height: 45.h,
                    width: 253.w,
                    cardColor: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 4.r)],
                    cardChild: Center(
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: const Color(0xffC0C0C0),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 25,
                            color: AppColors().mainColor2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                    child: Image.asset(
                      "assets/images/cc.png",
                      height: 30..h,
                      width: 30..w,
                    ),
                    onTap: () => _controller.doRotate.value = !_controller.doRotate.value),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Obx(
            () => Wrap(
              spacing: 20,
              children: List.generate(
                2,
                (index) => InkWell(
                    onTap: () {
                      _controller.isSelected.value = index;
                      if (_controller.isSelected.value == 0) {
                        Get.to(RSFilterScreen());
                      }
                    },
                    child: CustomCard(
                      height: 36.h,
                      width: 130.w,
                      cardColor: Colors.white,
                      border: Border.all(
                          color: _controller.isSelected.value == index
                              ? AppColors().mainColor2.withOpacity(.62)
                              : const Color(0xff9098B1)),
                      borderRadius: BorderRadius.circular(50),
                      cardChild: Center(
                        child: CustomText(
                          text: _controller.filterList[index],
                          fontSize: 15.sp,
                          fontColor: _controller.isSelected.value == index
                              ? AppColors().mainColor2.withOpacity(.62)
                              : Colors.black,
                        ),
                      ),
                    )),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => _controller.doRotate.value ? ViewTypeOfList1() : ViewTypeOfList2(),
            ),
          ),
        ],
      ),
    );
  }
}

class ViewTypeOfList1 extends StatelessWidget {
  const ViewTypeOfList1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: 10,
      itemBuilder: (context, index) => CustomCard(
        height: 240.h,
        // width: 244.w,
        cardColor: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)],
        cardChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 180..h,
                  width: double.maxFinite,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/11223.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomCard(
                        height: 21.h,
                        width: 59.w,
                        cardColor: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        cardChild: Center(
                          child: CustomText(
                            text: "Rent",
                            fontSize: 15.sp,
                            fontColor: AppColors().mainColor2,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10..h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Gorgious Villa",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      Image.asset(
                        "assets/images/short.png",
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  SizedBox(height: 5..h),
                  CustomText(
                    text: "\$27500",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    fontColor: AppColors().mainColor2,
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/bed.png",
                            height: 20.h,
                            width: 20.w,
                          ),
                          SizedBox(width: 5.w),
                          CustomText(
                            text: "2",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                      SizedBox(width: 20.w),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/bathtub.png",
                            height: 20.h,
                            width: 20.w,
                          ),
                          SizedBox(width: 5.w),
                          CustomText(
                            text: "2",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(width: 20.w),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/area.png",
                            height: 20.h,
                            width: 20.w,
                          ),
                          SizedBox(width: 5.w),
                          CustomText(
                            text: "2000 sqft",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 10.r,
                      ),
                      SizedBox(width: 5.w),
                      SizedBox(
                        width: 129.w,
                        child: CustomText(
                          text: "Majeedhee Magu Rd, Malé...",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
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
  }
}

class ViewTypeOfList2 extends StatelessWidget {
  const ViewTypeOfList2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10..w, vertical: 10.h),
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10..h);
      },
      itemBuilder: (context, index) => InkWell(
        onTap: () => Get.to(RSDetailScreen()),
        child: CustomCard(
          height: 112.h,
          width: 244.w,
          cardColor: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 1..r, blurRadius: 5..r)],
          cardChild: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              Stack(
                children: [
                  SizedBox(
                    width: 113.w,
                    height: double.maxFinite,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r),
                      ),
                      child: Image.asset(
                        "assets/images/rs.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4.h,
                    left: 50.w,
                    child: CustomCard(
                        height: 21.h,
                        width: 59.w,
                        cardColor: Colors.white,
                        borderRadius: BorderRadius.circular(6.r),
                        cardChild: Center(
                          child: CustomText(
                            text: "Rant",
                            fontSize: 15.sp,
                            fontColor: AppColors().mainColor2,
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomText(
                            text: "Appartment",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          Image.asset(
                            "assets/images/short.png",
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 10.r,
                          ),
                          SizedBox(width: 5.w),
                          SizedBox(
                            width: 129.w,
                            child: CustomText(
                              text: "Majeedhee Magu Rd, Malé...",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/bed.png",
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(width: 5.w),
                              CustomText(
                                text: "2",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                          SizedBox(width: 10.w),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/bathtub.png",
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(width: 5.w),
                              CustomText(
                                text: "2",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          SizedBox(width: 10.w),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/area.png",
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(width: 5.w),
                              CustomText(
                                text: "2000 sqft",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      CustomText(
                        text: "\$27500",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        fontColor: AppColors().mainColor2,
                      ),
                      SizedBox(height: 7.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
