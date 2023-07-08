import 'dart:convert';
import 'dart:developer';

import 'package:derapidos/models/real_estate_models/reViewallmodel.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class NearFromYouController extends GetxController {
  final _controller = Get.put(RSHomeController());
  bool nearFromYouLoader = false;
  var loading = true.obs;
  String? viewValue;
  String? userID="";

  RxInt isSelected = 0.obs;
  RxBool doRotate = true.obs;
  List filterList = ["Filter", "Apartments"].obs;
  RSviewModel? reviwall;
  List<Data> reviewallList = [];
  int getProcessingPage = 1;
  bool isProcessing = true;

  Future getviewRSAll() async {
    nearFromYouLoader = true;
    viewValue = _controller.reViewValue;
    var dData = await ApiServices().getREViewAll(getProcessingPage, viewValue ?? "",userID??"");
    reviwall = RSviewModel.fromJson(jsonDecode(dData!));
    reviewallList.addAll(RSviewModel.fromJson(jsonDecode(dData)).data!);
    nearFromYouLoader = false;
    update();
    log('data by view: $dData');
    loading.value = false;
  }
}
