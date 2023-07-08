import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Custom Widget/custom_text.dart';
import '../../Product Details/product_details.dart';
import '../../list/burger_list.dart';

class Chicken extends StatelessWidget {
  const Chicken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: burgerListModel.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: const Color(0xfffFFFFFF),
            child: Container(
              height: 111.h,
              width: 315.w,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        burgerListModel[index].imageName,
                        height: 111.h,
                        width: 92.w,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10).r,
                                child: CustomText(
                                  text: "Chef’s Burger",
                                  fontColor: const Color(0xff000000),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(
                                width: 60.h,
                              ),
                              Container(
                                height: 30.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFEBD00),
                                    borderRadius: BorderRadius.circular(3.r)),
                                child: const Icon(
                                  Icons.favorite_border,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12).r,
                            child: CustomText(
                              text: burgerListModel[index].text,
                              fontColor: const Color(0xff868686),
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12).r,
                                child: CustomText(
                                  text: burgerListModel[index].text1,
                                  fontColor: const Color(0xffEC2547),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(
                                width: 96.w,
                              ),
                              Container(
                                height: 17.h,
                                width: 31.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xffF4F4F4),
                                    borderRadius: BorderRadius.circular(3.r)),
                                child: Center(
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(
                                      Icons.add,
                                      size: 10,
                                      color: Color(0xffEC2547),
                                    ),
                                    onPressed: () {
                                      Get.to(const ProductDetails());
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
