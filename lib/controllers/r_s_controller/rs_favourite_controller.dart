import 'dart:convert';
import 'dart:developer';

import 'package:derapidos/models/real_estate_models/favourite/favourite_model.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:get/get.dart';

class RSFavouriteController extends GetxController{
  var loading = true.obs;
  bool nearFromYouLoader = false;
  RSFavouriteModel? myfav;
  List<Data> myfavlList = [];
  int getProcessingPage = 1;
  bool isProcessing = true;

  Future getFavouriteAds() async {
    nearFromYouLoader = true;
    var dData = await ApiServices().getmyFavouriteAds(getProcessingPage);
    myfav = RSFavouriteModel.fromJson(jsonDecode(dData!));
    myfavlList.addAll(RSFavouriteModel.fromJson(jsonDecode(dData)).data!);
    nearFromYouLoader = false;
    update();
    loading.value = false;

    log('data by view: $dData');
  }

}