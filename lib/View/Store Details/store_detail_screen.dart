import 'package:custom_clippers/Clippers/directional_wave_clipper.dart';
import 'package:custom_clippers/Clippers/multiple_points_clipper.dart';
import 'package:custom_clippers/enum/enums.dart';
import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/View/Store%20Details/service_products.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:derapidos/consts/app_consts.dart';
import 'package:derapidos/controllers/favorites_controller.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/models/categories.dart';
import 'package:derapidos/models/restaurant_detail.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/cart_controller.dart';
import '../Custom Widget/custom_text.dart';
import '../My Cart/mycart_screen.dart';
import '../Product Details/product_details.dart';
import '../list/burger_list.dart';
import 'Services/Burgers.dart';
import 'Services/Chicken.dart';
import 'Services/Meale.dart';
import 'Services/Promo.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen({Key? key}) : super(key: key);

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> with TickerProviderStateMixin {
  int currentSelected = 0;
  int rows = 5;

  bool selected = true;
  var homeController = Get.put(HomeController());
  var favoritesController = Get.put(FavoritesController());
  var cartController = Get.put(CartController());

  @override
  initState() {
    gotcallf();

    super.initState();
  }

  gotcallf() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      homeController.getStoreDetail();
    } else {
      cartController.getCartData();
      homeController.getStoreDetail();
    }
  }

  makeItFavorite(BuildContext context, StoreProduct product) async {
    showLoading(context);
    favoritesController.assignProductFromStoreDetail(product);
    var res1 = await favoritesController.addToFavorites();
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
    if (res1!) {
      showSnackBar(context, 'Added to Favorite Successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return GetX<HomeController>(
      builder: (homeController) {
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
          body: homeController.rdLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 320.h,
                        child: Stack(
                          children: [
                            Container(
                              height: 200.h,
                              width: 375.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r),
                                  bottomRight: Radius.circular(15.r),
                                ),
                                image: DecorationImage(
                                  // image: AssetImage("assets/images/StoreImage.png"),
                                  image: NetworkImage("${homeController.restaurantDetails!. //
                                      data!.marketDetails!.bannerImage}"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 150.h,
                              left: 20.w,
                              right: 20.w,
                              child: Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.r),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 5.0,
                                      color: Color(0xffE5E5E5),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0.r),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "${homeController.restaurantDetails!. //
                                                data!.marketDetails!.name}",
                                            // text: "Burger King",
                                            fontColor: const Color(0xff444444),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.sp,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Color(0xffFFC107),
                                              ),
                                              SizedBox(width: 5.w),
                                              CustomText(
                                                text: "${homeController.restaurantDetails!. //
                                                    data!.marketDetails!.averageRating}",
                                                // fontColor: const Color(
                                                //     0xffEC2547),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                              ),
                                              SizedBox(width: 8.w),
                                              CustomText(
                                                text:
                                                    "(${homeController.restaurantDetails!.data!.marketDetails!.totalReviews})",

                                                // fontColor: const Color(
                                                //     0xffEC2547),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4.h),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 9.r,
                                            color: Color(0xff9098B1),
                                          ),
                                          SizedBox(
                                            width: 250.w,
                                            child: CustomText(
                                              text: "${homeController.restaurantDetails!. //
                                                  data!.marketDetails!.address}",
                                              textOverflow: TextOverflow.ellipsis,
                                              // text: "Majeedhee Magu Rd, Malé, Maldives",
                                              fontColor: const Color(0xff9098B1),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          Spacer(),
                                          CustomText(
                                            text: homeController
                                                .restaurantDetails!.data!.marketDetails!.openStatus,
                                            fontColor: Color(0xffFEBD00),
                                            fontSize: 10.sp,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 5.h),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CustomText(
                                                text: "Min.Order",
                                                fontSize: 14..sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              SizedBox(width: 5..w),
                                              CustomText(
                                                text: "${homeController.restaurantDetails!.data!.marketDetails!.minimumOrderPrice} CFA",
                                                fontColor: AppColors().mainColor2,
                                                fontSize: 14..sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              homeController.restaurantDetails!.data!.marketDetails!
                                                          .derapidosDeliveryCharges ==
                                                      "Not"
                                                  ? CustomText(
                                                      text: "",
                                                      fontColor: AppColors().mainColor2,
                                                    )
                                                  : Row(
                                                      children: [
                                                        Row(
                                                          // children: [
                                                          //   Image.asset(
                                                          //     "assets/images/aaa.png",
                                                          //     height: 15.h,
                                                          //     width: 15.w,
                                                          //   ),
                                                          //   SizedBox(width: 5.w),
                                                          //   Image.asset(
                                                          //     "assets/images/ss.png",
                                                          //     height: 15.h,
                                                          //     width: 15.w,
                                                          //   ),
                                                          //   SizedBox(width: 5.w),
                                                          //   Row(
                                                          //     children: [
                                                          //       SizedBox(
                                                          //         width: 25..w,
                                                          //         height: 20..h,
                                                          //         child: CustomText(
                                                          //           text:
                                                          //               "${homeController.restaurantDetails!.data!.marketDetails!.derapidosDeliveryCharges}" ??
                                                          //                   "",
                                                          //           fontSize: 12.sp,
                                                          //           fontWeight: FontWeight.w500,
                                                          //         ),
                                                          //       ),
                                                          //       CustomText(
                                                          //         text: "CFA",
                                                          //         fontSize: 12.sp,
                                                          //         fontWeight: FontWeight.w500,
                                                          //       ),
                                                          //     ],
                                                          //   ),
                                                          // ],
                                                        ),
                                                        SizedBox(width: 10.w),
                                                      ],
                                                    ),
                                              SizedBox(height: 5.h),
                                              homeController.restaurantDetails!.data!.marketDetails!
                                                          .restaurantDeliveryCharges ==
                                                      ""
                                                  ? CustomText(
                                                      text: "",
                                                      fontColor: AppColors().mainColor2,
                                                    )
                                                  : Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              "assets/images/rrrr.png",
                                                              height: 15.h,
                                                              width: 15.w,
                                                            ),
                                                            SizedBox(width: 5.w),
                                                            Image.asset(
                                                              "assets/images/ss.png",
                                                              height: 15.h,
                                                              width: 15.w,
                                                            ),
                                                            SizedBox(width: 5.w),
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 25..w,
                                                                  height: 20..h,
                                                                  child: CustomText(
                                                                    text:
                                                                        "${homeController.restaurantDetails!.data!.marketDetails!.restaurantDeliveryCharges}" ??
                                                                            "",
                                                                    fontSize: 12.sp,
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                ),
                                                                CustomText(
                                                                  text: "CFA",
                                                                  fontSize: 12.sp,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(width: 10.w),
                                                      ],
                                                    ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/ss.png",
                                                height: 18.h,
                                                width: 18.w,
                                              ),
                                              SizedBox(width: 5.w),
                                              CustomText(
                                                text: "CFA",
                                                fontColor: AppColors().mainColor2,
                                                fontSize: 14..sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              CustomText(
                                                text: "${homeController.restaurantDetails!.data!.marketDetails!.time}",
                                                fontColor: AppColors().mainColor2,
                                                fontSize: 14..sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.h),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            // color: Colors.wh,

                            //This is for bottom border that is needed
                            border: Border(
                                bottom: BorderSide(color: Color(0xffC0C0C087).withOpacity(.53), width: 2.sp)),
                          ),
                          child: TabBar(
                              controller: tabController,
                              isScrollable: false,
                              padding: const EdgeInsets.only(
                                left: 0,
                                right: 0,
                              ).r,
                              indicatorColor: AppColors().mainColor2,
                              labelColor: AppColors().mainColor2,
                              labelStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              unselectedLabelColor: Colors.black,
                              unselectedLabelStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              tabs: const [
                                Tab(
                                  text: "Menu",
                                ),
                                Tab(
                                  text: "Ratings",
                                ),
                                Tab(
                                  text: "About",
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 500,
                        width: MediaQuery.of(context).size.width,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 40.h,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      itemCount: homeController.restaurantDetails!.data!.categoryList!.length,
                                      // jobsTypes.length,
                                      itemBuilder: (context, index) {
                                        Category? category =
                                            homeController.restaurantDetails!.data!.categoryList![index];
                                        return GestureDetector(
                                          onTap: () {
                                            currentSelected = index;
                                            homeController.currentCategoryId = category.id.toString();
                                            setState(() {});
                                          },
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 37.h,
                                                width: 81.w,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: currentSelected == index
                                                        ? const Color(0xff95006F)
                                                        : const Color(0xffFFFFFF),
                                                    borderRadius: BorderRadius.circular(10.0.r),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: const Color(0xffE5E5E5),
                                                    ),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        offset: Offset(0, 0),
                                                        blurRadius: 5.0,
                                                        spreadRadius: 0.0,
                                                        color: Color(0xffE5E5E5),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "${category.name}",
                                                      // jobsTypes[index],
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: "DMSans",
                                                        color: currentSelected == index
                                                            ? const Color(0xffFFFFFF)
                                                            : const Color(0xff444444),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(height: 10.h),
                                Expanded(
                                  child: Wrap(
                                    runSpacing: 10,
                                    spacing: 5,
                                    children: homeController.restaurantDetails!.data!.productList!.data!
                                        .map((product) {
                                      return homeController.currentCategoryId != product.categoryId
                                          ? Container()
                                          : InkWell(
                                              onTap: () async {
                                                // await takePhoto(ImageSource.gallery);
                                                bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
                                                if (isLogin == false) {
                                                  //log('datansdlaslasljlajlaajlaJLas');
                                                  Get.to(LoginScreen());
                                                } else {
                                                  //log('uytrtyuiolkjhgcvbnm');
                                                  homeController.currentProductId = product.id;
                                                  Get.to(ProductDetails());
                                                }

                                              },
                                              child: Container(
                                                // height: 111.h,
                                                width: double.maxFinite,
                                                margin: EdgeInsets.symmetric(horizontal: 10),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xffffffff),
                                                  borderRadius: BorderRadius.circular(10.r),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        offset: Offset(0, 0),
                                                        spreadRadius: 2,
                                                        blurRadius: 5.0,
                                                        color: Colors.black12),
                                                  ],
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        // Image.asset(burgerListModel[index].imageName,
                                                        SizedBox(
                                                          height: 80.h,
                                                          width: 120.w,
                                                          // height: 111.h,
                                                          // width: 92.w,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(10),
                                                              bottomLeft: Radius.circular(10),
                                                              topRight: Radius.circular(10),
                                                              bottomRight: Radius.circular(10),
                                                            ),
                                                            child: Image.network(
                                                              product.image!,
                                                              // height: 111.h,
                                                              width: 130.w,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 10.w),
                                                                  child: CustomText(
                                                                    text: "${product.name}",
                                                                    // text: "Chef’s Burger",
                                                                    fontColor: const Color(0xff000000),
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14.sp,
                                                                  ),
                                                                ),
                                                                SizedBox(width: 10.h),
                                                                // Padding(
                                                                //   padding: EdgeInsets.all(8.0.r),
                                                                //   child: InkWell(
                                                                //     onTap: () async {
                                                                //       await makeItFavorite(context, product);
                                                                //     },
                                                                //     child: Container(
                                                                //       height: 30.h,
                                                                //       width: 30.w,
                                                                //       decoration: BoxDecoration(
                                                                //         color: const Color(0xffFEBD00),
                                                                //         borderRadius: BorderRadius.circular(3.r),
                                                                //       ),
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
                                                            Padding(
                                                              padding: EdgeInsets.only(left: 12.w),
                                                              child: SizedBox(
                                                                // height: 30.h,
                                                                width: 190.w,
                                                                // width: Get.width * 0.6,
                                                                child: CustomText(
                                                                  text: "${product.description}",
                                                                  // text: burgerListModel[index].text,
                                                                  fontColor: const Color(0xff868686),
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 11.sp,
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 12.w),
                                                                  child: CustomText(
                                                                    text: "\CFA ${product.price}",
                                                                    // text: burgerListModel[index].text1,
                                                                    fontColor: AppColors().mainColor2,
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 14.sp,
                                                                  ),
                                                                ),
                                                                SizedBox(width: 96.w),
                                                                // InkWell(
                                                                //   onTap: () async {
                                                                //     cartController.cartItem
                                                                //             .value.productId =
                                                                //         product.id;
                                                                //     cartController.cartItem
                                                                //         .value.quantity = 1;
                                                                //     bool? hit =
                                                                //         await cartController
                                                                //             .addToCart();
                                                                //     if (hit!) {
                                                                //       cartController
                                                                //           .getCartData();
                                                                //       showSnackBar(context,
                                                                //           'Add to Cart Successfuly');
                                                                //     } else {
                                                                //       showSnackBar(context,
                                                                //           'Not Add to Cart');
                                                                //     }
                                                                //     print("guyui");
                                                                //   },
                                                                //   child: Container(
                                                                //     height: 17.h,
                                                                //     width: 31.w,
                                                                //     decoration: BoxDecoration(
                                                                //         color: const Color(
                                                                //             0xffF4F4F4),
                                                                //         borderRadius:
                                                                //             BorderRadius
                                                                //                 .circular(
                                                                //                     3.r)),
                                                                //     child: Center(
                                                                //       child: IconButton(
                                                                //         padding:
                                                                //             EdgeInsets.zero,
                                                                //         icon: const Icon(
                                                                //           Icons.add,
                                                                //           size: 10,
                                                                //           color: Color(
                                                                //               0xffEC2547),
                                                                //         ),
                                                                //         onPressed: () async {
                                                                //           cartController
                                                                //                   .cartItem
                                                                //                   .value
                                                                //                   .productId =
                                                                //               product.id;
                                                                //           cartController
                                                                //               .cartItem
                                                                //               .value
                                                                //               .quantity = 1;
                                                                //           bool? hit =
                                                                //               await cartController
                                                                //                   .addToCart();
                                                                //           if (hit!) {
                                                                //             cartController
                                                                //                 .getCartData();
                                                                //             showSnackBar(
                                                                //                 context,
                                                                //                 'Add to Cart Successfuly');
                                                                //           } else {
                                                                //             showSnackBar(
                                                                //                 context,
                                                                //                 'Not Add to Cart');
                                                                //           }
                                                                //           print("guyui");
                                                                //           // Get.to(
                                                                //           //     const ProductDetails());
                                                                //         },
                                                                //       ),
                                                                //     ),
                                                                //   ),
                                                                // )
                                                              ],
                                                            ),
                                                            SizedBox(height: 5.h),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  CustomCard(
                                    height: 113..h,
                                    width: double.maxFinite,
                                    borderRadius: BorderRadius.circular(5),
                                    cardColor: Colors.white,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5),
                                    ],
                                    cardChild: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20..w, vertical: 8..h),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: "4.8",
                                            fontSize: 44..sp,
                                            fontColor: Colors.black.withOpacity(0.5),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: List.generate(
                                              5,
                                              (index) => Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: List.generate(
                                                  index == 0
                                                      ? 5
                                                      : index == 1
                                                          ? 4
                                                          : index == 2
                                                              ? 3
                                                              : index == 3
                                                                  ? 2
                                                                  : 1,
                                                  (index) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 16..r,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10..w),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              5,
                                              (index) => Padding(
                                                padding: const EdgeInsets.only(top: 3),
                                                child: CustomCard(
                                                  height: 10..h,
                                                  width: 144..w,
                                                  borderRadius: BorderRadius.circular(20),
                                                  cardColor: AppColors().mainColor2,
                                                  cardChild: SizedBox(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              5,
                                              (index) => CustomText(
                                                text: '12',
                                                fontSize: 14..sp,
                                                fontColor: Colors.black.withOpacity(0.5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10..h),
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(1.5),
                                        child: CustomCard(
                                          height: 200..h,
                                          width: double.maxFinite,
                                          cardColor: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)
                                          ],
                                          cardChild: Padding(
                                            padding: const EdgeInsets.all(2.2),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                  text: "Helene Moore",
                                                  fontSize: 14..sp,
                                                  fontColor: Colors.black.withOpacity(0.5),
                                                ),
                                                SizedBox(height: 10..h),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    RatingBar.builder(
                                                      initialRating: 5,
                                                      minRating: 1,
                                                      direction: Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemSize: 13,
                                                      itemCount: 5,
                                                      itemBuilder: (context, _) => Icon(
                                                        Icons.star,
                                                        color: Color(0xffFFBA49),
                                                        size: 12,
                                                      ),
                                                      onRatingUpdate: (rating) {
                                                        print(rating);
                                                      },
                                                    ),
                                                    CustomText(
                                                      text: "June 5, 2019",
                                                      fontSize: 11..sp,
                                                      fontColor: Colors.black.withOpacity(0.2),
                                                    ),
                                                  ],
                                                ),
                                                CustomText(
                                                  text:
                                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                                                  fontSize: 14..sp,
                                                  fontColor: Colors.black.withOpacity(0.5),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 40..h,
                                        width: 40..w,
                                        decoration:
                                            BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: Image.asset(
                                            "assets/images/0.2.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Introduction",
                                    fontSize: 16..sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(height: 5..h),
                                  CustomText(
                                    text:
                                        "${homeController.restaurantDetails!. //
                                        data!.marketDetails!.description}",
                                    fontSize: 14..sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
