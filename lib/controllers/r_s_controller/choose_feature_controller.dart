import 'dart:convert';
import 'dart:developer';

import 'package:derapidos/models/real_estate_models/add_property_feature.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:get/get.dart';

class FeaturesClass {
  String? name = "";
  int? id;
  var selectedFeature = false.obs;

  FeaturesClass({this.name, required this.selectedFeature, this.id});
}

class ChooseFeatureController extends GetxController {
  bool isSelected = false;

  List<FeaturesClass>? featuresAddList = [];

  Rx<AddPropertieFeature>? featuresList;

  Rx<AddPropertieFeature>? get featurelist => featuresList;
  Future getFeatureList() async {
    var data = await ApiServices().getFeatureList();
    // log("category data: $data");
    featuresList = AddPropertieFeature.fromJson(jsonDecode(data!)).obs;
    update();
  }

  @override
  void onInit() async {
    await getFeatureList();
    print("this is list data ${featurelist!.value.realEstateFeatures!.first.name.toString()}");
    List.generate(
      featuresList!.value.realEstateFeatures!.length,
      (index) => featuresAddList!.add(
        FeaturesClass(
            name: featuresList!.value.realEstateFeatures![index].name!,
            id: featurelist!.value.realEstateFeatures![index].id,
            selectedFeature: false.obs),
      ),
    );

    super.onInit();
  }

  void selectedFeatures(int newIndex) {
    featuresAddList![newIndex].selectedFeature.value = !featuresAddList![newIndex].selectedFeature.value;
    print(featuresAddList![newIndex].name);
    print(featuresAddList![newIndex].selectedFeature);
  }
}
