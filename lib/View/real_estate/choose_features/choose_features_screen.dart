import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:derapidos/consts/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/r_s_controller/choose_feature_controller.dart';

class ChooseFeatureScreen extends StatelessWidget {
  ChooseFeatureScreen({Key? key}) : super(key: key);

  var controller = Get.put(ChooseFeatureController());
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseFeatureController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5..w),
              child: Column(
                children: [
                  CustomCard(
                    height: 80..h,
                    cardColor: Colors.black12,
                    cardChild: Row(
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.close,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        CustomText(
                          text: "Choose Feature",
                          fontSize: 16.sp,
                          fontColor: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomCard(
                    height: 40..h,
                    width: 320..w,
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(5),
                    cardChild: const Center(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 0.5..h,
                          color: Colors.black,
                        );
                      },
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemCount: controller.featuresList!.value.realEstateFeatures!.length,
                      itemBuilder: (context, index) => Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                myIndex = index;
                                controller.selectedFeatures(index);
                              },
                              child: CustomCard(
                                height: 40..h,
                                // cardColor: controller.featuresAddList![index].selectedFeature.value
                                //     ? Colors.grey.shade300
                                //     : Colors.white,
                                cardChild: Row(
                                  children: [
                                    CustomText(
                                      text: controller.featuresList!.value.realEstateFeatures![index].name,
                                      fontSize: 18.sp,
                                      fontColor: controller.featuresAddList![index].selectedFeature.value
                                          ? Colors.black
                                          : Colors.black54,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => Get.back(
                  result: controller.featuresAddList!
                      .where((element) => element.selectedFeature.value == true)
                      .map((e) => e.name)
                      .toList()),
              child: CustomCard(
                height: 40..h,
                width: 330..w,
                cardColor: AppColors().mainColor2,
                borderRadius: BorderRadius.circular(8),
                cardChild: Center(
                    child: CustomText(
                  text: "Conform",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  fontColor: Colors.white,
                )),
              ),
            ),
            SizedBox(height: 10.h)
          ],
        ),
      );
    });
  }
}
