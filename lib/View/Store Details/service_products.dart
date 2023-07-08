import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/View/Product%20Details/product_details.dart';
import 'package:derapidos/View/list/burger_list.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/models/restaurant_detail.dart';
import 'package:derapidos/models/suggested_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../consts/app_consts.dart';

class ServiceProducts extends StatefulWidget {
  const ServiceProducts({Key? key}) : super(key: key);

  @override
  State<ServiceProducts> createState() => _ServiceProductsState();
}

class _ServiceProductsState extends State<ServiceProducts> {
  // var homeController = Get.put(HomeController());
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        height: 300,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: controller.restaurantDetails!.data!.productList!.data!.length,
          itemBuilder: (BuildContext context, int index) {
            StoreProduct storeProduct = controller.restaurantDetails!.data!.productList!.data![index];
            return Card(
              color: const Color(0xffffffff),
              child: Container(
                height: 111.h,
                // width: 315.w,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
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
                        // Image.asset(burgerListModel[index].imageName,
                        SizedBox(
                          height: 111.h,
                          width: 92.w,
                          child: Image.network(
                            storeProduct.image!,
                            height: 111.h,
                            width: 92.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width - 100.w, //* 0.68,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10).r,
                                    child: CustomText(
                                      text: "${storeProduct.name}",
                                      // text: "Chef’s Burger",
                                      fontColor: const Color(0xff000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  // SizedBox(width: 60.h),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 30.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFEBD00),
                                        borderRadius: BorderRadius.circular(3.r),
                                      ),
                                      child: const Icon(
                                        Icons.favorite_border,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12).r,
                              child: SizedBox(
                                height: 30.h,
                                width: Get.width - 120.w,
                                // width: Get.width * 0.6,
                                child: CustomText(
                                  text: "${storeProduct.description}",
                                  // text: burgerListModel[index].text,
                                  fontColor: const Color(0xff868686),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12).r,
                                  child: CustomText(
                                    text: "\$${storeProduct.price}",
                                    // text: burgerListModel[index].text1,
                                    fontColor: const Color(0xffEC2547),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(width: 96.w),
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
      ),
    );
  }
}
