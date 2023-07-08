import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/View/Product%20Details/product_details.dart';
import 'package:derapidos/View/list/burger_list.dart';
import 'package:derapidos/controllers/favorites_controller.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/models/suggested_products.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../consts/app_consts.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({Key? key}) : super(key: key);

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  //var homeController = Get.put(HomeController());
  var favoritesController = Get.put(FavoritesController());

  @override
  initState() {
    super.initState();
    // homeController.getCategoryProducts();
  }

  Future makeItFavorite(BuildContext context, Product? product) async {
    showLoading(context);
    favoritesController.assignProductFromCategoryProduct(product);
    var res1 = await favoritesController.addToFavorites();
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
    if (res1!) {
      showSnackBar(context, 'Added to Favorite Successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
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
          body: controller.cpLoading.value
              ? const CircularProgressIndicator()
              : Container(
                  // child: ListView.builder(
                  //   shrinkWrap: true,
                  //   scrollDirection: Axis.vertical,
                  //   itemCount: controller
                  //       .categoryProducts!.length, // burgerListModel.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     Product product = controller.categoryProducts![index];
                  //     return InkWell(
                  //       onTap: () {
                  //         // await takePhoto(ImageSource.gallery);
                  //        // homeController.currentProductId = product.id;
                  //         Get.to(ProductDetails());
                  //       },
                  //       child: Card(
                  //         color: const Color(0xffffffff),
                  //         child: Container(
                  //           height: 111.h,
                  //           // width: 315.w,
                  //           decoration: BoxDecoration(
                  //             color: const Color(0xffffffff),
                  //             borderRadius: BorderRadius.circular(8.r),
                  //             boxShadow: const [
                  //               BoxShadow(
                  //                 offset: Offset(0, 0),
                  //                 blurRadius: 5.0,
                  //                 color: Color(0xffE5E5E5),
                  //               ),
                  //             ],
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   // Image.asset(burgerListModel[index].imageName,
                  //                   SizedBox(
                  //                     height: 111.h,
                  //                     width: 92.w,
                  //                     child: Image.network(
                  //                       product.image!,
                  //                       height: 111.h,
                  //                       width: 92.w,
                  //                       fit: BoxFit.fill,
                  //                     ),
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       SizedBox(
                  //                         width: Get.width - 100.w, //* 0.68,
                  //                         child: Row(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.spaceBetween,
                  //                           children: [
                  //                             Padding(
                  //                               padding: const EdgeInsets.only(
                  //                                       left: 10)
                  //                                   .r,
                  //                               child: CustomText(
                  //                                 text: "${product.name}",
                  //                                 // text: "Chef’s Burger",
                  //                                 fontColor:
                  //                                     const Color(0xff000000),
                  //                                 fontWeight: FontWeight.w500,
                  //                                 fontSize: 14.sp,
                  //                               ),
                  //                             ),
                  //                             // SizedBox(width: 60.h),
                  //                             Padding(
                  //                               padding:
                  //                                   const EdgeInsets.all(8.0),
                  //                               child: InkWell(
                  //                                 onTap: () async {
                  //                                   await makeItFavorite(
                  //                                       context, product);
                  //                                 },
                  //                                 child: Container(
                  //                                   height: 30.h,
                  //                                   width: 30.w,
                  //                                   decoration: BoxDecoration(
                  //                                     color: const Color(
                  //                                         0xffFEBD00),
                  //                                     borderRadius:
                  //                                         BorderRadius.circular(
                  //                                             3.r),
                  //                                   ),
                  //                                   child: const Icon(
                  //                                     Icons.favorite_border,
                  //                                     size: 14,
                  //                                     color: Colors.white,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding:
                  //                             const EdgeInsets.only(left: 12).r,
                  //                         child: SizedBox(
                  //                           height: 30.h,
                  //                           width: Get.width - 120.w,
                  //                           // width: Get.width * 0.6,
                  //                           child: CustomText(
                  //                             text: "${product.description}",
                  //                             // text: burgerListModel[index].text,
                  //                             fontColor:
                  //                                 const Color(0xff868686),
                  //                             fontWeight: FontWeight.w500,
                  //                             fontSize: 11.sp,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       SizedBox(height: 8.h),
                  //                       Row(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.end,
                  //                         children: [
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(
                  //                                     left: 12)
                  //                                 .r,
                  //                             child: CustomText(
                  //                               text: "\CFA ${product.price}",
                  //                               // text: burgerListModel[index].text1,
                  //                               fontColor:
                  //                                   const Color(0xffEC2547),
                  //                               fontWeight: FontWeight.w600,
                  //                               fontSize: 14.sp,
                  //                             ),
                  //                           ),
                  //                           SizedBox(width: 96.w),
                  //                           Container(
                  //                             height: 17.h,
                  //                             width: 31.w,
                  //                             decoration: BoxDecoration(
                  //                                 color:
                  //                                     const Color(0xffF4F4F4),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(
                  //                                         3.r)),
                  //                             child: Center(
                  //                               child: IconButton(
                  //                                 padding: EdgeInsets.zero,
                  //                                 icon: const Icon(
                  //                                   Icons.add,
                  //                                   size: 10,
                  //                                   color: Color(0xffEC2547),
                  //                                 ),
                  //                                 onPressed: () {
                  //                                   Get.to(
                  //                                       const ProductDetails());
                  //                                 },
                  //                               ),
                  //                             ),
                  //                           )
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                  ),
        );
      },
    );
  }
}
