import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  var fries = 0.obs;
  var cheese = 0.obs;
  var pepsi = 0.obs;
  //var fries=6.obs;

  increment() {
    fries.value++;
  }

  decrement() {
    if (fries.value <= 0) {
      Get.snackbar("Buying Fries", "Can not be less than zero",
          icon: Icon(Icons.alarm),
          barBlur: 20,
          isDismissible: true,
          duration: Duration(seconds: 3));
    } else
      fries.value--;
  }

  incrementCheese() {
    cheese.value++;
  }

  decrementCheese() {
    if (cheese.value <= 0) {
      Get.snackbar("Buying Cheese", "Can not be less than zero",
          icon: Icon(Icons.alarm),
          barBlur: 20,
          isDismissible: true,
          duration: Duration(seconds: 3));
    } else
      cheese.value--;
  }

  incrementPepsi() {
    pepsi.value++;
  }

  decrementPepsi() {
    if (pepsi.value <= 0) {
      Get.snackbar("Buying Pepsi", "Can not be less than zero",
          icon: Icon(Icons.alarm),
          barBlur: 20,
          isDismissible: true,
          duration: Duration(seconds: 3));
    } else
      pepsi.value--;
  }
}
