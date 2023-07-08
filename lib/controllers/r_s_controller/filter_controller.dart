import 'package:get/get.dart';
import '../../View/real_estate/choose_category/choose_category_screen.dart';

class FilterController extends GetxController {
  RxInt isBedroom = RxInt(-1);
  RxInt isBathRoom = RxInt(-1);
  RxInt isUnitArea = RxInt(-1);
  RxInt isFurnished = RxInt(-1);

  RxString isCategory = "Land & Plots".obs;
  RxInt tabTextIndexSelected = 0.obs;
  RxInt selectedImagesCount = 0.obs;
  List? areaUnit = ["Square feet", "Square Meter", "Square Yards"];
  List? furnishedType = ["Furnished", "UnFurnished"];
  List? resultFromCategory = ["Apartment and flats"];
  final listTextTabToggle = ["Sale", "Rent"];
  final bedRoom = ["1", "2", "3", "4", "+5"];

  toggle(int index) {
    tabTextIndexSelected.value = index;
    update();
  }

  void updateBedRoom(int newIndex) {
    isBedroom.value = newIndex;
  }

  void updateBathRoom(int newIndex) {
    isBathRoom.value = newIndex;
  }

  void updateUnitArea(int newIndex) {
    isUnitArea.value = newIndex;
  }

  void furnished(int newIndex) {
    isFurnished.value = newIndex;
  }

  bool plotsOrNot() {
    if (resultFromCategory!.last! != isCategory.value) {
      return true;
    } else {
      return false;
    }
  }

  void updateCategory() async {
    final result = await Get.to(() => ChooseCategoryScreen());
    resultFromCategory = result;
    update();
  }
}

// import 'package:get/get.dart';
// import '../../View/real_estate/choose_category/choose_category_screen.dart';
//
// class FilterController extends GetxController {
//   RxInt tabTextIndexSelected = 0.obs;
//
//   List resultFromCategory = ["Apartment and flats"];
//   final listTextTabToggle = ["Sale", "Rent"];
//
//   toggle(int index) => tabTextIndexSelected.value = index;
//
//   void updateCategory() async {
//     final result = await Get.to(() => ChooseCategoryScreen());
//     resultFromCategory = result;
//     print(resultFromCategory.last);
//     update();
//   }
// }
