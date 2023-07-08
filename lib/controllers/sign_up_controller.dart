import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController {
  var verificationId = "".obs;
  var loading = false.obs;
  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var gender = "".obs;
  var password = "".obs;
  var cPassword = "".obs;
  var otp = "".obs;
  var address = "".obs;
  RxString? filePath = ''.obs;
  var password12 = "".obs;

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  ///

}
