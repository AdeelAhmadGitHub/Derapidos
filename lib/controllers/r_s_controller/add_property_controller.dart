import 'dart:convert';
import 'dart:developer';
import 'package:derapidos/models/real_estate_models/add_property_feature.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../View/real_estate/choose_category/choose_category_screen.dart';
import '../../View/real_estate/choose_features/choose_features_screen.dart';
import '../../View/real_estate/location/location_screen.dart';
import 'choose_feature_controller.dart';

class AddPropertyController extends GetxController {
  bool addPropertyLoader = false;
  var title = "".obs;
  var price = "".obs;
  var area = "".obs;
  var description = "".obs;
  var priceMin = "".obs;
  var priceMax = "".obs;
  var areaFrom = "".obs;
  var areaTo = "".obs;
  late String areaUnitValue;
  late String commercialTypes;
  late String isFloorLevel = "";
  late String bedRoomValue = "";
  late String bathRoomValue = "";
  late String isfurneshedValue;
  late String isCategoryValue = "4";
  late String isCategoryName = "Apartment & Flats";
  late String isfurneshedValueSet = "";
  late String saleRenttype = "Sale";
  late String latitudeL = "";
  late String longitudeL = "";
  late String addressL = "";

  @override
  void onInit() {
    plotsOrNot(); // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    plotsOrNot(); // TODO: implement onReady
    super.onReady();
  }

  RxInt isBedroom = RxInt(-1);
  RxInt isBathRoom = RxInt(-1);
  RxInt isUnitArea = RxInt(-1);
  RxInt isCommercialType = RxInt(-1);
  RxInt isFloor = RxInt(-1);
  RxInt isFurnished = RxInt(-1);
  RxString isCategory = "Land & Plots".obs;
  int tabTextIndexSelected = 0;
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile>? images = [];
  List<String>? imagesPath = [];
  RxInt selectedImagesCount = 0.obs;
  List<String>? areaUnit = ["Square feet", "Square Meter", "Square Yards"];
  List<String>? commercialType = ["Residence", "Factory"];
  List<String>? floorLevel = ["Ground", "One", "Two", "Three"];
  List? furnishedType = ["Furnished", "UnFurnished"];
  List resultFromCategory = ["assets/images/ap.png", "Apartment and flats"].obs;
  List resultFromLocation = ["N/L"].obs;
  late List resultFromFeatures = [];
  final listTextTabToggle = ["Sale", "Rent"];
  final bedRoom = ["1", "2", "3", "4", "5"];
  final bathRoom = ["1", "2", "3", "4", "5"];

  toggle(int index) {
    tabTextIndexSelected = index;
    if (tabTextIndexSelected == 0) {
      saleRenttype = "Sale";
      log('Salerent: $saleRenttype');
    } else {
      saleRenttype = "Rent";
      log('Salerent: $saleRenttype');
    }

    update();
  }

  void selectImages() async {
    images = await _imagePicker.pickMultiImage();
    if (images != null) {
      for (XFile file in images!) {
        imagesPath!.add(file.path);
      }
    } else {
      Get.snackbar("No image selected", "", snackPosition: SnackPosition.BOTTOM);
    }

    selectedImagesCount.value = imagesPath!.length;
  }

  bool plotsOrNot() {
    if (resultFromCategory.last! != isCategory.value) {
      return true;
    } else {
      return false;
    }
  }

  void updateBedRoom(int newIndex) {
    isBedroom.value = newIndex;
    bedRoomValue = bedRoom.elementAt(newIndex);

    log('Bedroom: $bedRoomValue');
  }

  void updateBathRoom(int newIndex) {
    isBathRoom.value = newIndex;
    bathRoomValue = bathRoom.elementAt(newIndex);

    log('BathRoom: $bathRoomValue');
  }

  void updateUnitArea(int newIndex) {
    isUnitArea.value = newIndex;
    areaUnitValue = areaUnit!.elementAt(newIndex);

    log('AreaUnit: $areaUnitValue');
  }

  void updateCommercialType(int newIndex) {
    isCommercialType.value = newIndex;
    commercialTypes = commercialType!.elementAt(newIndex);

    log('AreaUnit: $commercialTypes');
  }

  void updateFloorLevel(int newIndex) {
    isFloor.value = newIndex;
    isFloorLevel = floorLevel!.elementAt(newIndex);
    log('AreaUnit: $isFloorLevel');
  }

  void furnished(int newIndex) {
    isFurnished.value = newIndex;
    isfurneshedValue = furnishedType!.elementAt(newIndex);
    if (isfurneshedValue == "Furnished") {
      isfurneshedValueSet = "1";
      log('FurnishData: $isfurneshedValueSet');
    } else {
      isfurneshedValueSet = "0";
      log('FurnishData: $isfurneshedValueSet');
    }
  }

  void updateLocation() async {
    List result = await Get.to(RSLocationScreen());
    resultFromLocation = result;
    addressL = resultFromLocation.elementAt(1).toString();
    log('locationss: ${resultFromLocation}');
    update();
  }

  void updateCategory() async {
    final result = await Get.to(() => ChooseCategoryScreen());
    resultFromCategory = result;
    if (resultFromCategory.elementAt(1) == "House/Villa") {
      isCategoryValue = "1";
      log('Category: $isCategoryValue');
    }
    if (resultFromCategory.elementAt(1) == "Land & Plots") {
      isCategoryValue = "2";
      log('Category: $isCategoryValue');
    }
    if (resultFromCategory.elementAt(1) == "Commercial") {
      isCategoryValue = "3";
      log('Category: $isCategoryValue');
    }
    if (resultFromCategory.elementAt(1) == "Apartment & Flats") {
      isCategoryValue = "4";
      log('Category: $isCategoryValue');
    }
    if (resultFromCategory.elementAt(1) == "Portion & Floor") {
      isCategoryValue = "5";
      log('Category: $isCategoryValue');
    }
    update();
  }

  void updateFeature() async {
    final result = await Get.to((
            //ChooseFeatureController controller
            ) =>
        ChooseFeatureScreen());
    resultFromFeatures = result;
    update();
  }

  Rx<AddPropertieFeature>? _featurelist;

  Rx<AddPropertieFeature>? get featurelist => _featurelist;
  Future getFeatureList() async {
    var data = await ApiServices().getFeatureList();
    log("category data: $data");
    _featurelist = AddPropertieFeature.fromJson(jsonDecode(data!)).obs;
    update();
  }
}
