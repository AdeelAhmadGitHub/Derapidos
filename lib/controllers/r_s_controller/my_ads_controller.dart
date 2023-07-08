import 'dart:convert';
import 'dart:developer';

import 'package:derapidos/models/real_estate_models/myads/my_ads_model.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:get/get.dart';

class RSMyAdsController extends GetxController {
  var loading = true.obs;
  bool nearFromYouLoader = false;
  MyAdsModel? myads;
  List<ActiveData> myadslList = [];
  int getProcessingPage = 1;
  bool isProcessing = true;

  Future getMyAds(String userID) async {
    nearFromYouLoader = true;
    var dData = await ApiServices().getMyads(getProcessingPage,userID);
    myads = MyAdsModel.fromJson(jsonDecode(dData!));
    myadslList.addAll(MyAdsModel.fromJson(jsonDecode(dData)).activeListing!.data!);
    nearFromYouLoader = false;
    update();
    loading.value = false;

    log('data by view: $dData');
  }
}
