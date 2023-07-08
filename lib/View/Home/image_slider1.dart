import 'package:derapidos/View/Store%20Details/store_detail_screen.dart';
import 'package:derapidos/consts/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/home_controller.dart';
import '../../models/banners_model.dart';
import '../Custom Widget/custom_text.dart';
import 'package:get/get.dart';

class ImageSlider1 extends StatefulWidget {
  final List<BannerList?> bannerImages;
  // final List<String?> bannerImages;
  final VoidCallback? onPress;
  const ImageSlider1({Key? key, required this.bannerImages, this.onPress}) : super(key: key);

  @override
  State<ImageSlider1> createState() => _ImageSlider1State();
}

class _ImageSlider1State extends State<ImageSlider1> {
  var _current = 0;
  var _current1 = 0;
  var homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CarouselSlider(
            options: CarouselOptions(
                disableCenter: false,
                aspectRatio: 16 / 5,
                initialPage: 0,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                autoPlay: true,
                reverse: false,
                height: 150.h,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 5),
                // autoPlayAnimationDuration:
                //     const Duration(milliseconds: 2200),
                pauseAutoPlayOnTouch: true,
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                onPageChanged: (index, val) {
                  _current = index;
                  setState(() {
                    print('current index$_current $index');
                  });
                }),
            items: [
              for (int i = 0; i < (widget.bannerImages.length ?? 0); i++)
                InkWell(
                  onTap: () {
                    print(widget.bannerImages[i]!.marketId);
                    homeController.currentRestaurantId = widget.bannerImages[i]!.marketId.toString() ?? "0";
                    Get.to(const StoreDetailScreen());
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: 150.h,
                          width: 380.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: '${widget.bannerImages[i]!.bannerImage}',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 110.h,
                          left: 200.w,
                          child: Container(
                            height: 30.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5), color: const Color(0xff95006F)),
                            child: const Center(
                              child: CustomText(
                                text: "Order Now",
                                fontSize: 13,
                                fontColor: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
            ],
          ),
        ),

        SizedBox(height: 10..h),
      ],
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
