// import 'package:derapidos/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:shimmer/shimmer.dart';

// class ImageSwipe extends StatelessWidget {
//   const ImageSwipe({
//     Key? key,
//     @required this.images,
//     this.height,
//   }) : super(key: key);
//   final double? height;
//   final List<String>? images;

//   @override
//   Widget build(BuildContext context) {
//     if (images!.length > 0) {
//       return Swiper(
//         onTap: (index) {
//           // Navigator.push(
//           //     context,
//           //     MaterialPageRoute(
//           //         builder: (context) => PhotoScreen(images: images)));
//         },
//         itemBuilder: (BuildContext context, int index) {
//           return Image.network(
//             images![index],
//             fit: BoxFit.cover,
//           );
//         },
//         autoplayDelay: 5000,
//         autoplayDisableOnInteraction: false,
//         autoplay: true,
//         itemCount: images!.length,
//         pagination: const SwiperPagination(
//           alignment: Alignment(0.0, 0.4),
//           builder: SwiperPagination.dots,
//           margin: EdgeInsets.only(top: 180),
//         ),
//         index: 0,
//       );
//     }
//     return Shimmer.fromColors(
//       baseColor: Theme.of(context).hoverColor,
//       highlightColor: Theme.of(context).highlightColor,
//       enabled: true,
//       child: Container(
//         color: AppTheme.appColor,
//       ),
//     );
//   }
// }
