import 'package:get/get.dart';

class RecommendedFromYouController extends GetxController {
  RxInt isSelected = 0.obs;
  RxBool doRotate = false.obs;
  List filterList = ["Filter", "Apartments"].obs;
}
