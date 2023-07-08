import 'package:derapidos/consts/app_consts.dart';
import 'package:derapidos/controllers/cart_controller.dart';
import 'package:derapidos/controllers/favorites_controller.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/models/cart_item.dart';
import 'package:derapidos/theme.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Custom Widget/button.dart';
import '../Custom Widget/custom_text.dart';
import '../My Cart/mycart_screen.dart';
import 'my_controller.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int? selectedIndex = 0;
  int checkedIndex = 0;
  final MyController c = Get.put(MyController());
  var homeController = Get.put(HomeController());
  var cartController = Get.put(CartController());
  var favoritesController = Get.put(FavoritesController());

  @override
  initState() {
    homeController.getProductDetailScreenData();
    cartController.cartItem = CartItem(quantity: 0, extras: []).obs;
    cartController.total = 0.0;
    // setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
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
          body: homeController.pdLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
            child: Container(
              child: Column(children: [
                Container(
                  height: 265.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.r),
                      topLeft: Radius.circular(8.r),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                    ),
                    image: DecorationImage(
                      // image: AssetImage("assets/images/Product Image.png"),
                      image: NetworkImage("${homeController.productDetail!
                          .detail!.image}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      bottom: 130,
                    ).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          color: AppTheme.whiteColor,
                          icon: const Icon(
                            Icons.arrow_back_ios_outlined,
                            size: 12,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          onPressed: () {
                            // Get.off(const SigninScreen());
                            Get.back();
                          },
                        ),
                        // InkWell(
                        //   onTap: () async {
                        //     await makeItFavorite(context);
                        //   },
                        //   child: Container(
                        //     height: 30.h,
                        //     width: 30.w,
                        //     decoration: BoxDecoration(
                        //       color: const Color(0xffFEBD00),
                        //       borderRadius: BorderRadius.circular(3.r),
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(8.0).r,
                        //       child: const Icon(
                        //         Icons.favorite_border,
                        //         size: 14,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "${homeController.productDetail!. //
                            detail!.name}",
                            // text: "Chef’s Burger",
                            fontColor: const Color(0xff000000),
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                          CustomText(
                            text: "\$${homeController.productDetail!. //
                            detail!.price}",
                            // text: "\$16.19",
                            fontColor: AppColors().mainColor2,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          // const Icon(
                          //   Icons.star,
                          //   color: Color(0xffFFC107),
                          //   size: 10,
                          // ),
                          // SizedBox(width: 16.w),
                          // CustomText(
                          //   text: "${homeController.productDetail!. //
                          //       detail!.averageRating}",
                          //   // text: "4.5",
                          //   fontColor: const Color(0xff9A9A9A),
                          //   fontWeight: FontWeight.w400,
                          //   fontSize: 12.sp,
                          // ),
                          // SizedBox(width: 2.w),
                          // Container(
                          //   width: 3.w,
                          //   height: 3.h,
                          //   decoration: const BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     color: Color(0xffC4C4C4),
                          //   ),
                          // ),
                          // SizedBox(width: 2.w),
                          // CustomText(
                          //   text: "${homeController.productDetail!. //
                          //       detail!.totalReviews} Reviews",
                          //   // text: "415 Reviews",
                          //   fontColor: const Color(0xff9A9A9A),
                          //   fontWeight: FontWeight.w400,
                          //   fontSize: 12.sp,
                          // ),
                          // const Icon(
                          //   Icons.keyboard_arrow_down_sharp,
                          //   size: 15,
                          //   color: Color(0xff9098B1),
                          // ),
                          // SizedBox(width: 15.w),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            // height: 32.h,
                            width: 300.w,
                            child: CustomText(
                              text: "${homeController.productDetail!. //
                              detail!.description}",
                              // text: "Bread, grilled meat, lettuce, Sandwich feature two and savery flame-grilled beef patties.",
                              fontColor: const Color(0xff868686),
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      (homeController.productDetail!.detail!.productSize!
                          .isEmpty)
                          ? Container()
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: CustomText(
                              text: "Size",
                              fontColor: const Color(0xff444444),
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      (homeController.productDetail!.detail!.productSize!
                          .isEmpty)
                          ? Container()
                          : SizedBox(height: 15.h),
                      // Container(
                      //   child: Row(
                      //     children: [
                      //         GestureDetector(
                      //         onTap: () {
                      //           setState(() {
                      //             selectedIndex = 0;
                      //           });
                      //         },
                      //         child: Card(
                      //          // color: selectedIndex == index? Color(0xffEC2547) : Color(0xfffFFFFFF),
                      //           child: Container(
                      //             height: 40.h,
                      //             width: 80.w,
                      //             decoration: BoxDecoration(
                      //               color: selectedIndex == index? Color(0xffEC2547) : Color(0xfffFFFFFF),
                      //               borderRadius: BorderRadius.circular(4.0),
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                   offset: Offset(0,0),
                      //                   blurRadius: 5.0,
                      //                   color: Color(0xffE5E5E5),
                      //                 ),
                      //               ],
                      //             ),
                      //             child: Padding(
                      //               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      //               child: CustomText(
                      //                 text: "Small",
                      //                 fontColor:  selectedIndex == index? Color(0xfffFFFFFF)  : Color(0xff444444),
                      //                 fontWeight: FontWeight.w500,
                      //                 fontSize: 12.sp,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //
                      //       SizedBox(width: 8.w,),
                      //       Container(
                      //         height: 40.h,
                      //         width: 80.w,
                      //         decoration: BoxDecoration(
                      //           color: selectedIndex == index? Color(0xffEC2547) : Color(0xfffFFFFFF),
                      //           borderRadius: BorderRadius.circular(4.0),
                      //           boxShadow: [
                      //             BoxShadow(
                      //               offset: Offset(0,0),
                      //               blurRadius: 5.0,
                      //               color: Color(0xffE5E5E5),
                      //             ),
                      //           ],
                      //         ),
                      //         child: Padding(
                      //           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      //           child: CustomText(
                      //             text: "Medium",
                      //             fontColor:  selectedIndex == index? Color(0xfffFFFFFF)  : Color(0xff444444),
                      //             fontWeight: FontWeight.w500,
                      //             fontSize: 12.sp,
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(width: 8.w,),
                      //       Container(
                      //         height: 40.h,
                      //         width: 80.w,
                      //         decoration: BoxDecoration(
                      //           color: selectedIndex == index? Color(0xffEC2547) : Color(0xfffFFFFFF),
                      //           borderRadius: BorderRadius.circular(4.0),
                      //           boxShadow: [
                      //             BoxShadow(
                      //               offset: Offset(0,0),
                      //               blurRadius: 5.0,
                      //               color: Color(0xffE5E5E5),
                      //             ),
                      //           ],
                      //         ),
                      //         child: Padding(
                      //           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      //           child: CustomText(
                      //             text: "Small",
                      //             fontColor:  selectedIndex == index? Color(0xfffFFFFFF)  : Color(0xff444444),
                      //             fontWeight: FontWeight.w500,
                      //             fontSize: 12.sp,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      (homeController.productDetail!.detail!.productSize!
                          .isEmpty)
                          ? Container()
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            // padding: const EdgeInsets.only(left: 15),
                            height: 45.h,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                              homeController.productDetail!.detail!.productSize!
                                  .length,
                              // sizeListModel.length,
                              itemBuilder: (BuildContext context, int index) {
                                var size =
                                homeController.productDetail!.detail!
                                    .productSize![index];
                                return GestureDetector(
                                  child: Card(
                                    color: Colors.transparent,
                                    elevation: 0,
                                    child: Container(
                                      height: 37.h,
                                      width: 81.w,
                                      decoration: BoxDecoration(
                                        color: selectedIndex == index
                                            ? AppColors().mainColor2
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            10.r),
                                        border: Border.all(
                                          width: 1,
                                          color: const Color(0xffE5E5E5),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(0, 0),
                                            blurRadius: 0.0,
                                            color: Color(0xffE5E5E5),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: CustomText(
                                          text: size,
                                          // sizeListModel[index].text,
                                          fontColor: selectedIndex == index
                                              ? const Color(0xffffffff)
                                              : const Color(0xff444444),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                      homeController.currentSize = size;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Extras",
                          fontColor: const Color(0xff444444),
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Wrap(
                    children: homeController.productDetail!.detail!
                        .productExtras!.map((extra) {
                      var extraQ = 0;
                      for (var element in cartController.cartItem.value
                          .extras!) {
                        if (element.extrasId.toString() == extra.extraId) {
                          extraQ = element.extrasQuantity!;
                          // extraQ = extraQ + 1;
                        }
                      }
                      return homeController.currentSize!.toLowerCase() !=
                          extra.sizeName!.toLowerCase()
                          ? Container()
                          : Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30).r,
                              child: Container(
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: "${extra.name}",
                                      // text: "Fries",
                                      fontColor: const Color(0xff868686),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                    SizedBox(width: 15.w),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 15.0, right: 15.0).r,
                                        child: const Divider(
                                          color: Color(0xffC0C0C0),
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15.w),
                                    CustomText(
                                      text: "\$${extra.price}",
                                      // text: "\$6.00",
                                      fontColor: const Color(0xff868686),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                    SizedBox(width: 70.w),
                                    Row(
                                      children: [
                                        Container(
                                          height: 21.h,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffffffff),
                                            borderRadius: BorderRadius.circular(
                                                2.r),
                                            boxShadow: const [
                                              BoxShadow(
                                                offset: Offset(0, 0),
                                                blurRadius: 5.0,
                                                color: Color(0xffE5E5E5),
                                              ),
                                            ],
                                          ),
                                          child: InkWell(
                                            child: Icon(Icons.remove,
                                                size: 12,
                                                color: AppColors().mainColor2),
                                            onTap: () {
                                              // c.decrement();
                                              cartController.removeExtra(
                                                  int.parse(extra.extraId!));
                                              cartController
                                                  .calculateTotal(
                                                  homeController.productDetail);
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        // Obx(
                                        //   () =>
                                        CustomText(
                                          // text: "${c.fries.toString()}",
                                          text: "$extraQ",
                                          fontColor: const Color(0xff444444),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                        // ),
                                        SizedBox(width: 6.w),
                                        Container(
                                          height: 21.h,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                            color: AppColors().mainColor2,
                                            borderRadius: BorderRadius.circular(
                                                2.r),
                                          ),
                                          child: InkWell(
                                            child: const Icon(
                                              Icons.add,
                                              size: 12,
                                              color: Color(0xffFFFFFF),
                                            ),
                                            onTap: () {
                                              // c.increment();
                                              // cartController.cartItem
                                              //     .value.extras!
                                              //     .add(Extra(
                                              //   extrasId: int.parse(
                                              //       extra.extraId!),
                                              // ));
                                              cartController.addExtra(
                                                  int.parse(extra.extraId!));
                                              cartController
                                                  .calculateTotal(
                                                  homeController.productDetail);
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                          ],
                        ),
                      );
                    }).toList()),
                // Container(
                //   child: Column(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(left: 30, right: 30).r,
                //         child: Container(
                //           child: Row(
                //             children: [
                //               CustomText(
                //                 text: "Fries",
                //                 fontColor: const Color(0xff868686),
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14.sp,
                //               ),
                //               SizedBox(
                //                 width: 15.w,
                //               ),
                //               Expanded(
                //                 child: Container(
                //                     margin: const EdgeInsets.only(
                //                             left: 15.0, right: 15.0)
                //                         .r,
                //                     child: const Divider(
                //                       color: Color(0xffC0C0C0),
                //                       height: 0,
                //                     )),
                //               ),
                //               SizedBox(width: 15.w),
                //               CustomText(
                //                 text: "\$6.00",
                //                 fontColor: const Color(0xff868686),
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14.sp,
                //               ),
                //               SizedBox(width: 70.w),
                //               Row(
                //                 children: [
                //                   Container(
                //                     height: 21.h,
                //                     width: 20.w,
                //                     decoration: BoxDecoration(
                //                       color: const Color(0xfffffffff),
                //                       borderRadius:
                //                           BorderRadius.circular(2.r),
                //                       boxShadow: const [
                //                         BoxShadow(
                //                           offset: Offset(0, 0),
                //                           blurRadius: 5.0,
                //                           color: Color(0xffE5E5E5),
                //                         ),
                //                       ],
                //                     ),
                //                     child: IconButton(
                //                       icon: const Icon(
                //                         Icons.remove,
                //                         size: 7,
                //                         color: Color(app),
                //                       ),
                //                       onPressed: () => c.decrement(),
                //                     ),
                //                   ),
                //                   const SizedBox(
                //                     width: 6,
                //                   ),
                //                   Obx(
                //                     () => CustomText(
                //                       text: "${c.fries.toString()}",
                //                       fontColor: const Color(0xff444444),
                //                       fontWeight: FontWeight.w500,
                //                       fontSize: 14.sp,
                //                     ),
                //                   ),
                //                   SizedBox(width: 6.w),
                //                   Container(
                //                     height: 21.h,
                //                     width: 20.w,
                //                     decoration: BoxDecoration(
                //                       color: const Color(0xfff5d3ebf),
                //                       borderRadius:
                //                           BorderRadius.circular(2.r),
                //                     ),
                //                     child: InkWell(
                //                       child: const Icon(
                //                         Icons.add,
                //                         size: 12,
                //                         color: Color(0xffFFFFFF),
                //                       ),
                //                       onTap: () => c.increment(),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       SizedBox(height: 15.h),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 30, right: 30).r,
                //         child: Container(
                //           child: Row(
                //             children: [
                //               CustomText(
                //                 text: "Cheese",
                //                 fontColor: const Color(0xff868686),
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14.sp,
                //               ),
                //               SizedBox(width: 15.w),
                //               Expanded(
                //                 child: Container(
                //                   margin: const EdgeInsets.only(
                //                           left: 15.0, right: 15.0)
                //                       .r,
                //                   child: const Divider(
                //                     color: Color(0xffC0C0C0),
                //                     height: 0,
                //                   ),
                //                 ),
                //               ),
                //               SizedBox(width: 15.w),
                //               CustomText(
                //                 text: "\$4.00",
                //                 fontColor: const Color(0xff868686),
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14.sp,
                //               ),
                //               SizedBox(width: 70.w),
                //               Row(
                //                 children: [
                //                   Container(
                //                     height: 21.h,
                //                     width: 20.w,
                //                     decoration: BoxDecoration(
                //                       color: const Color(0xfffffffff),
                //                       borderRadius:
                //                           BorderRadius.circular(2.r),
                //                       boxShadow: const [
                //                         BoxShadow(
                //                           offset: Offset(0, 0),
                //                           blurRadius: 5.0,
                //                           color: Color(0xffE5E5E5),
                //                         ),
                //                       ],
                //                     ),
                //                     child: IconButton(
                //                       icon: const Icon(
                //                         Icons.remove,
                //                         size: 7,
                //                         color: Color(0xff5D3EBF),
                //                       ),
                //                       onPressed: () => c.decrementCheese(),
                //                     ),
                //                   ),
                //                   SizedBox(width: 6.w),
                //                   Obx(
                //                     () => CustomText(
                //                       text: "${c.cheese.toString()}",
                //                       fontColor: const Color(0xff444444),
                //                       fontWeight: FontWeight.w500,
                //                       fontSize: 14.sp,
                //                     ),
                //                   ),
                //                   SizedBox(width: 6.w),
                //                   Container(
                //                     height: 21.h,
                //                     width: 20.w,
                //                     decoration: BoxDecoration(
                //                       color: const Color(0xfff5d3ebf),
                //                       borderRadius:
                //                           BorderRadius.circular(2.r),
                //                     ),
                //                     child: IconButton(
                //                       icon: const Icon(
                //                         Icons.add,
                //                         size: 7,
                //                         color: Color(0xffFFFFFF),
                //                       ),
                //                       onPressed: () => c.incrementCheese(),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       SizedBox(height: 15.h),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 30, right: 30).r,
                //         child: Container(
                //           child: Row(
                //             children: [
                //               CustomText(
                //                 text: "Pepsi",
                //                 fontColor: const Color(0xff868686),
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14.sp,
                //               ),
                //               SizedBox(width: 15.w),
                //               Expanded(
                //                 child: Container(
                //                   margin: const EdgeInsets.only(
                //                           left: 15.0, right: 15.0)
                //                       .r,
                //                   child: const Divider(
                //                     color: Color(0xffC0C0C0),
                //                     height: 0,
                //                   ),
                //                 ),
                //               ),
                //               SizedBox(width: 15.w),
                //               CustomText(
                //                 text: "\$2.00",
                //                 fontColor: const Color(0xff868686),
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14.sp,
                //               ),
                //               SizedBox(width: 70.w),
                //               Row(
                //                 children: [
                //                   Container(
                //                     height: 21.h,
                //                     width: 20.w,
                //                     decoration: BoxDecoration(
                //                       color: const Color(0xfffffffff),
                //                       borderRadius:
                //                           BorderRadius.circular(2.r),
                //                       boxShadow: const [
                //                         BoxShadow(
                //                           offset: Offset(0, 0),
                //                           blurRadius: 5.0,
                //                           color: Color(0xffE5E5E5),
                //                         ),
                //                       ],
                //                     ),
                //                     child: IconButton(
                //                       icon: const Icon(
                //                         Icons.remove,
                //                         size: 7,
                //                         color: Color(0xff5D3EBF),
                //                       ),
                //                       onPressed: () => c.decrementPepsi(),
                //                     ),
                //                   ),
                //                   SizedBox(width: 6.w),
                //                   Obx(
                //                     () => CustomText(
                //                       text: "${c.pepsi.toString()}",
                //                       fontColor: const Color(0xff444444),
                //                       fontWeight: FontWeight.w500,
                //                       fontSize: 14.sp,
                //                     ),
                //                   ),
                //                   SizedBox(width: 6.w),
                //                   Container(
                //                     height: 21.h,
                //                     width: 20.w,
                //                     decoration: BoxDecoration(
                //                       color: const Color(0xfff5d3ebf),
                //                       borderRadius:
                //                           BorderRadius.circular(2.r),
                //                     ),
                //                     child: IconButton(
                //                       icon: const Center(
                //                         child: Icon(
                //                           Icons.add,
                //                           size: 7,
                //                           color: Color(0xffFFFFFF),
                //                         ),
                //                       ),
                //                       onPressed: () => c.incrementPepsi(),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                // SizedBox(height: 45.h),
                // Container(
                //   height: 56.h,
                //   width: 315.w,
                //   child: ElevatedButton.icon(
                //     icon: const Icon(
                //       Icons.add_circle_outline_outlined,
                //       size: 20,
                //       color: Color(0xff5D3EBF),
                //     ),
                //     onPressed: () async {
                //       // Get.to(const SignUpScreen());
                //     },
                //     label: Text(
                //       "Add special instructions",
                //       style: TextStyle(
                //         color: const Color(0xff5D3EBF),
                //         fontSize: 14.sp,
                //         fontFamily: 'DMSans',
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //     style: ElevatedButton.styleFrom(
                //       elevation: 0,
                //       // backgroundColor: Color(0xffF4F4F4),
                //       primary: const Color(0xffF4F4F4),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(56.0.r),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 15.h),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 10, bottom: 30).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 56.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: const Color(0xffF4F4F4),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.remove_circle_outline,
                                size: 20,
                                color: AppColors().mainColor2,
                              ),
                              onPressed: () {
                                //
                                if (cartController.cartItem.value.quantity! >=
                                    2) {
                                  cartController.cartItem.value.quantity =
                                      cartController.cartItem.value.quantity! -
                                          1;
                                  cartController.calculateTotal(
                                      homeController.productDetail);
                                  setState(() {});
                                }
                              },
                            ),
                            SizedBox(width: 5.w),
                            Obx(
                                  () =>
                                  CustomText(
                                    text: '${cartController.cartItem.value
                                        .quantity}', // "2",
                                    fontColor: const Color(0xff444444),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                            ),
                            SizedBox(width: 5.w),
                            IconButton(
                              icon: Icon(
                                Icons.add_circle_outline_outlined,
                                size: 20,
                                color: AppColors().mainColor2,
                              ),
                              onPressed: () {
                                //
                                cartController.cartItem.value.quantity =
                                    cartController.cartItem.value.quantity! + 1;
                                cartController.calculateTotal(
                                    homeController.productDetail);
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: 15.w),
                      MyCustomButton(
                        onPressed: () async {
                          // ya add to cart kerney per pop up
                          // toast message a jahey k same restaurant ki products add ker skty hie
                          if (cartController.cartItem.value.quantity == 0) {
                            showSnackBar(context, 'Your Cart is Empty');
                            return;
                          }
                          cartController.cartItem.value.productId =
                              homeController.productDetail!.detail!.id;
                          cartController.cartItem.value.deliveryCharges =
                              double.parse(homeController.productDetail!.detail!
                                  .deliveryFee!);
                          var marketId = homeController.productDetail!.detail!
                              .marketId;
                          var isAllowed = await cartController.checkInCart(
                              marketId);
                          if (!isAllowed!) {
                            //
                            showSnackBar(
                                context, 'Product cannot be Added to Cart');
                            showSnackBar(context,
                                'Please add Product of same Restaurant');
                            return;
                          } else {}
                          showLoading(context);
                          var check = await cartController.addToCart();
                          Get.back();
                          if (check!) {
                            Get.off(const MycartScreen());
                          } else {
                            showSnackBar(context, 'Some Error Occur');
                          }
                        },
                        height: 56.h,
                        width: 160.w,
                        // 163.w,
                        text: "Add to Cart   \$${cartController.total
                            .toStringAsFixed(2)}",
                        // text: "Add to Cart   \$37.38",
                        textColor: const Color(0xffFFFFFF),
                        buttonColor: AppColors().mainColor2,
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }

  Future makeItFavorite(BuildContext context) async {
    showLoading(context);
    favoritesController.assignProductFromProductDetail(
        homeController.productDetail!.detail!);
    var res = await favoritesController.addToFavorites();

    ///
    // var res = await homeController.addToFavorites(
    //     homeController.productDetail!.detail!.id);
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
    if (res!) {
      showSnackBar(context, 'Added to Favorite Successfully');
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// import '../Custom Widget/button.dart';
// import '../Custom Widget/custom_text.dart';
// import '../My Cart/mycart_screen.dart';
// import '../list/size_list.dart';
// import 'my_controller.dart';

// class ProductDetails extends StatefulWidget {
//   const ProductDetails({Key? key}) : super(key: key);

//   @override
//   State<ProductDetails> createState() => _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails> {
//   int? selectedIndex;
//   int checkedIndex = 0;
//   final MyController c = Get.put(MyController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(children: [
//             Container(
//               height: 265.h,
//               width: double.infinity.w,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(8.r),
//                     topLeft: Radius.circular(8.r),
//                     bottomLeft: Radius.zero,
//                     bottomRight: Radius.zero),
//                 image: DecorationImage(
//                   image: AssetImage(
//                     "assets/images/Product Image.png",
//                   ),
//                 ),
//               ),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.only(left: 30, right: 30, bottom: 130).r,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                         Icons.arrow_back_ios_outlined,
//                         size: 12,
//                         color: Color(0xffFFFFFF),
//                       ),
//                       onPressed: () {
//                         // Get.off(const SigninScreen());
//                         Get.back();
//                       },
//                     ),
//                     Container(
//                       height: 30.h,
//                       width: 30.w,
//                       decoration: BoxDecoration(
//                           color: Color(0xffFEBD00),
//                           borderRadius: BorderRadius.circular(3.r)),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0).r,
//                         child: Icon(
//                           Icons.favorite_border,
//                           size: 14,
//                           color: Colors.white,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 30, right: 30).r,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CustomText(
//                         text: "Chef’s Burger",
//                         fontColor: Color(0xff000000),
//                         fontWeight: FontWeight.w700,
//                         fontSize: 20.sp,
//                       ),
//                       CustomText(
//                         text: "\$16.19",
//                         fontColor: Color(0xff5D3EBF),
//                         fontWeight: FontWeight.w700,
//                         fontSize: 20.sp,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 15.h,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 32.h,
//                         width: 301.w,
//                         child: CustomText(
//                           text:
//                               "Bread, grilled meat, lettuce, Sandwich feature two and savery flame-grilled beef patties.",
//                           fontColor: const Color(0xff868686),
//                           fontWeight: FontWeight.w400,
//                           fontSize: 12.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 15.h,
//                   ),
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.star,
//                         color: const Color(0xffFFC107),
//                         size: 10,
//                       ),
//                       // SizedBox(width: 16.w),
//                       CustomText(
//                         text: "4.5",
//                         fontColor: Color(0xff9A9A9A),
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12.sp,
//                       ),
//                       SizedBox(
//                         width: 2.w,
//                       ),
//                       Container(
//                         width: 3.w,
//                         height: 3.h,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Color(0xffC4C4C4),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 2.w,
//                       ),
//                       CustomText(
//                         text: "415 Reviews",
//                         fontColor: Color(0xff9A9A9A),
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12.sp,
//                       ),
//                       Icon(
//                         Icons.keyboard_arrow_down_sharp,
//                         size: 15,
//                         color: Color(0xff9098B1),
//                       ),
//                       SizedBox(
//                         width: 15.w,
//                       ),
//                       Icon(
//                         Icons.delivery_dining_outlined,
//                         size: 15,
//                         color: Color(0xff9098B1),
//                       ),
//                       CustomText(
//                         text: "25mins",
//                         fontColor: Color(0xff9A9A9A),
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12.sp,
//                       ),
//                       SizedBox(
//                         width: 15.w,
//                       ),
//                       Icon(
//                         Icons.delivery_dining_outlined,
//                         size: 15,
//                         color: Color(0xff5D3EBF),
//                       ),
//                       CustomText(
//                         text: "\$5.00",
//                         fontColor: Color(0xff5D3EBF),
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12.sp,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 15.h,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         child: CustomText(
//                           text: "Size",
//                           fontColor: Color(0xff444444),
//                           fontWeight: FontWeight.w700,
//                           fontSize: 18.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 15.h,
//                   ),
//                   // Container(
//                   //   child: Row(
//                   //     children: [
//                   //         GestureDetector(
//                   //         onTap: () {
//                   //           setState(() {
//                   //             selectedIndex = 0;
//                   //           });
//                   //         },
//                   //         child: Card(
//                   //          // color: selectedIndex == index? Color(0xffEC2547) : Color(0xfffFFFFFF),
//                   //           child: Container(
//                   //             height: 40.h,
//                   //             width: 80.w,
//                   //             decoration: BoxDecoration(
//                   //               color: selectedIndex == index? Color(0xffEC2547) : Color(0xfffFFFFFF),
//                   //               borderRadius: BorderRadius.circular(4.0),
//                   //               boxShadow: [
//                   //                 BoxShadow(
//                   //                   offset: Offset(0,0),
//                   //                   blurRadius: 5.0,
//                   //                   color: Color(0xffE5E5E5),
//                   //                 ),
//                   //               ],
//                   //             ),
//                   //             child: Padding(
//                   //               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
//                   //               child: CustomText(
//                   //                 text: "Small",
//                   //                 fontColor:  selectedIndex == index? Color(0xfffFFFFFF)  : Color(0xff444444),
//                   //                 fontWeight: FontWeight.w500,
//                   //                 fontSize: 12.sp,
//                   //               ),
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //
//                   //       SizedBox(width: 8.w,),
//                   //       Container(
//                   //         height: 40.h,
//                   //         width: 80.w,
//                   //         decoration: BoxDecoration(
//                   //           color: selectedIndex == index? Color(0xffEC2547) : Color(0xfffFFFFFF),
//                   //           borderRadius: BorderRadius.circular(4.0),
//                   //           boxShadow: [
//                   //             BoxShadow(
//                   //               offset: Offset(0,0),
//                   //               blurRadius: 5.0,
//                   //               color: Color(0xffE5E5E5),
//                   //             ),
//                   //           ],
//                   //         ),
//                   //         child: Padding(
//                   //           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
//                   //           child: CustomText(
//                   //             text: "Medium",
//                   //             fontColor:  selectedIndex == index? Color(0xfffFFFFFF)  : Color(0xff444444),
//                   //             fontWeight: FontWeight.w500,
//                   //             fontSize: 12.sp,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       SizedBox(width: 8.w,),
//                   //       Container(
//                   //         height: 40.h,
//                   //         width: 80.w,
//                   //         decoration: BoxDecoration(
//                   //           color: selectedIndex == index? Color(0xffEC2547) : Color(0xfffFFFFFF),
//                   //           borderRadius: BorderRadius.circular(4.0),
//                   //           boxShadow: [
//                   //             BoxShadow(
//                   //               offset: Offset(0,0),
//                   //               blurRadius: 5.0,
//                   //               color: Color(0xffE5E5E5),
//                   //             ),
//                   //           ],
//                   //         ),
//                   //         child: Padding(
//                   //           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
//                   //           child: CustomText(
//                   //             text: "Small",
//                   //             fontColor:  selectedIndex == index? Color(0xfffFFFFFF)  : Color(0xff444444),
//                   //             fontWeight: FontWeight.w500,
//                   //             fontSize: 12.sp,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         // padding: const EdgeInsets.only(left: 15),
//                         height: 45.h,
//                         child: ListView.builder(
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: sizeListModel.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               return GestureDetector(
//                                 child: Card(
//                                   color: Colors.transparent,
//                                   elevation: 0,
//                                   child: Container(
//                                     height: 37.h,
//                                     width: 81.w,
//                                     decoration: BoxDecoration(
//                                       color: selectedIndex == index
//                                           ? Color(0xff5D3EBF)
//                                           : Color(0xfffF7F7F7),
//                                       borderRadius: BorderRadius.circular(69.r),
//                                       border: Border.all(
//                                         width: 1,
//                                         color: Color(0xffE5E5E5),
//                                       ),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           offset: Offset(0, 0),
//                                           blurRadius: 0.0,
//                                           color: Color(0xffE5E5E5),
//                                         ),
//                                       ],
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(12).r,
//                                       child: CustomText(
//                                         textAlign: TextAlign.center,
//                                         text: sizeListModel[index].text,
//                                         fontColor: selectedIndex == index
//                                             ? Color(0xfffFFFFFF)
//                                             : Color(0xff444444),
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 12.sp,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   setState(() {
//                                     selectedIndex = index;
//                                   });
//                                 },
//                               );
//                             }),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15.h,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 30, right: 30).r,
//               child: Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     CustomText(
//                       text: "Extras",
//                       fontColor: Color(0xff444444),
//                       fontWeight: FontWeight.w700,
//                       fontSize: 18.sp,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15.h,
//             ),
//             Container(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30, right: 30).r,
//                     child: Container(
//                         child: Row(
//                       children: [
//                         CustomText(
//                           text: "Fries",
//                           fontColor: Color(0xff868686),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14.sp,
//                         ),
//                         SizedBox(
//                           width: 15.w,
//                         ),
//                         Expanded(
//                           child: new Container(
//                               margin:
//                                   const EdgeInsets.only(left: 15.0, right: 15.0)
//                                       .r,
//                               child: Divider(
//                                 color: Color(0xffC0C0C0),
//                                 height: 0,
//                               )),
//                         ),
//                         SizedBox(
//                           width: 15.w,
//                         ),
//                         CustomText(
//                           text: "\$6.00",
//                           fontColor: Color(0xff868686),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14.sp,
//                         ),
//                         SizedBox(
//                           width: 70.w,
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               height: 21.h,
//                               width: 20.w,
//                               decoration: BoxDecoration(
//                                 color: Color(0xfffFFFFFF),
//                                 borderRadius: BorderRadius.circular(2.r),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     offset: Offset(0, 0),
//                                     blurRadius: 5.0,
//                                     color: Color(0xffE5E5E5),
//                                   ),
//                                 ],
//                               ),
//                               child: IconButton(
//                                 icon: Icon(
//                                   Icons.remove,
//                                   size: 7,
//                                   color: Color(0xff5D3EBF),
//                                 ),
//                                 onPressed: () => c.decrement(),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 6,
//                             ),
//                             Obx(
//                               () => CustomText(
//                                 text: "${c.fries.toString()}",
//                                 fontColor: Color(0xff444444),
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 14.sp,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 6.w,
//                             ),
//                             Container(
//                               height: 21.h,
//                               width: 20.w,
//                               decoration: BoxDecoration(
//                                 color: Color(0xfff5D3EBF),
//                                 borderRadius: BorderRadius.circular(2.r),
//                               ),
//                               child: IconButton(
//                                 icon: Icon(
//                                   Icons.add,
//                                   size: 7,
//                                   color: Color(0xffFFFFFF),
//                                 ),
//                                 onPressed: () => c.increment(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//                   ),
//                   SizedBox(
//                     height: 15.h,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30, right: 30).r,
//                     child: Container(
//                         child: Row(
//                       children: [
//                         CustomText(
//                           text: "Cheese",
//                           fontColor: Color(0xff868686),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14.sp,
//                         ),
//                         SizedBox(
//                           width: 15.w,
//                         ),
//                         Expanded(
//                           child: new Container(
//                               margin:
//                                   const EdgeInsets.only(left: 15.0, right: 15.0)
//                                       .r,
//                               child: Divider(
//                                 color: Color(0xffC0C0C0),
//                                 height: 0,
//                               )),
//                         ),
//                         SizedBox(
//                           width: 15.w,
//                         ),
//                         CustomText(
//                           text: "\$4.00",
//                           fontColor: Color(0xff868686),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14.sp,
//                         ),
//                         SizedBox(
//                           width: 70.w,
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               height: 21.h,
//                               width: 20.w,
//                               decoration: BoxDecoration(
//                                 color: Color(0xfffFFFFFF),
//                                 borderRadius: BorderRadius.circular(2.r),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     offset: Offset(0, 0),
//                                     blurRadius: 5.0,
//                                     color: Color(0xffE5E5E5),
//                                   ),
//                                 ],
//                               ),
//                               child: IconButton(
//                                 icon: Icon(
//                                   Icons.remove,
//                                   size: 7,
//                                   color: Color(0xff5D3EBF),
//                                 ),
//                                 onPressed: () => c.decrementCheese(),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 6.w,
//                             ),
//                             Obx(
//                               () => CustomText(
//                                 text: "${c.cheese.toString()}",
//                                 fontColor: Color(0xff444444),
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 14.sp,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 6.w,
//                             ),
//                             Container(
//                               height: 21.h,
//                               width: 20.w,
//                               decoration: BoxDecoration(
//                                 color: Color(0xfff5D3EBF),
//                                 borderRadius: BorderRadius.circular(2.r),
//                               ),
//                               child: IconButton(
//                                 icon: Icon(
//                                   Icons.add,
//                                   size: 7,
//                                   color: Color(0xffFFFFFF),
//                                 ),
//                                 onPressed: () => c.incrementCheese(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//                   ),
//                   SizedBox(
//                     height: 15.h,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30, right: 30).r,
//                     child: Container(
//                         child: Row(
//                       children: [
//                         CustomText(
//                           text: "Pepsi",
//                           fontColor: Color(0xff868686),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14.sp,
//                         ),
//                         SizedBox(
//                           width: 15.w,
//                         ),
//                         Expanded(
//                           child: new Container(
//                               margin:
//                                   const EdgeInsets.only(left: 15.0, right: 15.0)
//                                       .r,
//                               child: Divider(
//                                 color: Color(0xffC0C0C0),
//                                 height: 0,
//                               )),
//                         ),
//                         SizedBox(
//                           width: 15.w,
//                         ),
//                         CustomText(
//                           text: "\$2.00",
//                           fontColor: Color(0xff868686),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14.sp,
//                         ),
//                         SizedBox(
//                           width: 70.w,
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               height: 21.h,
//                               width: 20.w,
//                               decoration: BoxDecoration(
//                                 color: Color(0xfffFFFFFF),
//                                 borderRadius: BorderRadius.circular(2.r),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     offset: Offset(0, 0),
//                                     blurRadius: 5.0,
//                                     color: Color(0xffE5E5E5),
//                                   ),
//                                 ],
//                               ),
//                               child: IconButton(
//                                 icon: Icon(
//                                   Icons.remove,
//                                   size: 7,
//                                   color: Color(0xff5D3EBF),
//                                 ),
//                                 onPressed: () => c.decrementPepsi(),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 6.w,
//                             ),
//                             Obx(
//                               () => CustomText(
//                                 text: "${c.pepsi.toString()}",
//                                 fontColor: Color(0xff444444),
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 14.sp,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 6.w,
//                             ),
//                             Container(
//                               height: 21.h,
//                               width: 20.w,
//                               decoration: BoxDecoration(
//                                 color: Color(0xfff5D3EBF),
//                                 borderRadius: BorderRadius.circular(2.r),
//                               ),
//                               child: IconButton(
//                                 icon: Center(
//                                   child: Icon(
//                                     Icons.add,
//                                     size: 7,
//                                     color: Color(0xffFFFFFF),
//                                   ),
//                                 ),
//                                 onPressed: () => c.incrementPepsi(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 45.h,
//             ),
//             Container(
//               height: 56.h,
//               width: 315.w,
//               child: ElevatedButton.icon(
//                 icon: Icon(
//                   Icons.add_circle_outline_outlined,
//                   size: 20,
//                   color: Color(0xff5D3EBF),
//                 ),
//                 onPressed: () async {
//                   // Get.to(const SignUpScreen());
//                 },
//                 label: Text(
//                   "Add special instructionse",
//                   style: TextStyle(
//                     color: Color(0xff5D3EBF),
//                     fontSize: 14.sp,
//                     fontFamily: 'DMSans',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   elevation: 0,
//                   // backgroundColor: Color(0xffF4F4F4),
//                   primary: Color(0xffF4F4F4),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(56.0.r),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15.h,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30).r,
//               child: Row(
//                 children: [
//                   Container(
//                     height: 56.h,
//                     width: 120.w,
//                     decoration: BoxDecoration(
//                       color: Color(0xffF4F4F4),
//                       borderRadius: BorderRadius.circular(56.r),
//                     ),
//                     child: Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             Icons.remove_circle_outline,
//                             size: 20,
//                             color: Color(0xff5D3EBF),
//                           ),
//                           onPressed: () => null,
//                         ),
//                         SizedBox(
//                           width: 5.w,
//                         ),
//                         CustomText(
//                           text: "2",
//                           fontColor: Color(0xff444444),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14.sp,
//                         ),
//                         SizedBox(
//                           width: 5.w,
//                         ),
//                         IconButton(
//                           icon: Icon(
//                             Icons.add_circle_outline_outlined,
//                             size: 20,
//                             color: Color(0xff5D3EBF),
//                           ),
//                           onPressed: () => null,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15.w,
//                   ),
//                   MyCustomButton(
//                     onPressed: () {
//                       Get.to(MycartScreen());
//                     },
//                     height: 56.h,
//                     width: 163.w,
//                     text: "Add to Cart   \$37.38",
//                     textColor: Color(0xffFFFFFF),
//                     fontSize: 14.sp,
//                   ),
//                 ],
//               ),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
