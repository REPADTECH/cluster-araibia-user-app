
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  var loginPageView = GlobalKey<FormState>();

  var otp = ''.obs;
  var otpDesign = true.obs;
  var keyBoardIsVisible = false.obs;
  var validatorNumber = false.obs;
  var errorMessage = '';

  OtpFieldController otpFieldController = OtpFieldController();
  var mob = TextEditingController();


  @override
  void onInit() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.onInit();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  String? validateMobileNumbers(String? value) {
    final RegExp mobileRegex = RegExp(r'^\d{8}$');
    if (value == null || value.isEmpty) {
      validatorNumber.value = true;
      errorMessage = 'Enter Mobile Number';
      update();
      // return 'enterMobileNumber'.tr;
    } else if (!(mobileRegex.hasMatch(value))) {
      validatorNumber.value = true;
      errorMessage = 'Please enter valid mobile number';
      update();
    }
    else{
      errorMessage = '';
      validatorNumber.value = false;
      update();
    }
    return null;
    return null;
  }

}