import 'dart:convert';

import 'package:get/get.dart';

import '../../models/real_estate_models/HomeModel.dart';
import '../../models/real_estate_models/type_model.dart';
import '../../services/api_services.dart';

class RSHomeController extends GetxController {
  @override
  void onInit() {
    getAllData();
    super.onInit();
  }

  var selectedIndex = 0.obs;
  bool rsHomeLoader = false;
  String? nTitle;
  String? reViewValue;
  String? nPrice;
  String? nBed;
  String? nBath;
  String? nArea;
  String? nPostedPersonName;
  String? nPostedPersonPhone;
  String? nPostedPersonProfilePic;
  String? nCreatedAt;
  String? nAdress;
  String? nDescription;
  String? nType;
  String? postedUserId;
  List<String>? nImages;
  List<String>? nFeatures;
  String? messageType;
  String? checkProfileDetail;
  String? checkMyAdds;

  String? userID;
  String? listing_type;
  String? category_id;
  String? price_min;
  String? price_max;
  String? statusIsfurneshed;
  String? bedrooms;
  String? bathrooms;
  String? area_unit;
  String? area_start;
  String? area_end;
  getAllData() async {
    rsHomeLoader = true;
    await getRSHomeDataController();
    rsHomeLoader = false;
    update();
  }

  RSHomeModel? rsHomeData;
  Future getRSHomeDataController() async {
    var data = await ApiServices().getRSHomeData(
        userID ?? "",
        listing_type ?? "",
        category_id ?? "",
        price_min ?? "",
        price_max ?? "",
        statusIsfurneshed ?? "",
        bedrooms ?? "",
        bathrooms ?? "",
        area_unit ?? "",
        area_start ?? "",
        area_end ?? "");
    rsHomeData = RSHomeModel.fromJson(jsonDecode(data!));
    print(data);
    update();
  }

  String? realestateIDF;
  Future addRemoveFavorite() async {
    print("good");
    var data = await ApiServices().addRSFavorite(realestateIDF ?? "");
  }
}
