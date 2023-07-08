import 'dart:convert';

import 'package:derapidos/models/shipping_addresses.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var loading = true.obs;
  var newLoading = false.obs;

  Future getAddresses() async {
    await getShippingAddresses();
    loading.value = false;
  }

  ///
  ShippingAddresses? shippingAddresses;
  Address? currentAddress;
  getShippingAddresses() async {
    var data = await ApiServices().getShippingAddresses();
    shippingAddresses = ShippingAddresses.fromJson(jsonDecode(data!));
  }

  Future<bool?> activateShippingAddress(int addressId) async {
    var res = await ApiServices().activeShippingAddresses(addressId);
    return res;
  }

  Address? newAddress = Address();
  Future<bool?> addShippingAddress() async {
    var res = await ApiServices().addShippingAddress(newAddress!);
    return res;
  }

  ///

}
