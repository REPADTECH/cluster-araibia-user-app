import 'package:cherry_toast/cherry_toast.dart';
import 'package:cluster_arabia/models/login_model.dart';
import 'package:cluster_arabia/models/otp_verify_model.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:cluster_arabia/utilities/com_binding.dart';
import 'package:cluster_arabia/utilities/strings.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
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
  LoginModel? loginModel;
  OtpModelClass? otpModelClass;
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
    final RegExp mobileRegex = RegExp(r'^\d{10}$');
    if (value == null || value.isEmpty) {
      validatorNumber.value = true;
      errorMessage = 'Enter Mobile Number';
      update();
      // return 'enterMobileNumber'.tr;
    } else if (!(mobileRegex.hasMatch(value))) {
      validatorNumber.value = true;
      errorMessage = 'Please enter valid mobile number';
      update();
    } else {
      errorMessage = '';
      validatorNumber.value = false;
      update();
    }
    return null;
    return null;
  }

  void checkLogin({required BuildContext context}) async {
    if (loginPageView.currentState?.validate() ?? false) {
      try {
        showLoading();
        loginModel = await Api.to.userLogin(phone: mob.text);
        dismissLoading();
        if (loginModel?.success ?? true) {
          otpDesign.value = !otpDesign.value;
          otp.value=loginModel?.data?.otp ?? '';
          1.cDelay((){
            var otpValue = loginModel?.data?.otp ?? '';
            otpFieldController.setValue(otpValue[0],0);
            otpFieldController.setValue(otpValue[1],1);
            otpFieldController.setValue(otpValue[2],2);
            otpFieldController.setValue(otpValue[3],3);
            update();
          });
        } else {
          showToast(context: context, message: loginModel?.message ?? '');
        }
      } catch (e) {
        print('Exception : $e');
      } finally {
        update();
      }
    }
  }

  void verifyOtp({required BuildContext context}) async {
    try {
      showLoading();
      otpModelClass = await Api.to.otpVerifyOtp(
        otpToken: loginModel?.data?.otpToken ?? '',
        otp: otp.value,
      );
      dismissLoading();
      if (otpModelClass?.success ?? true) {
        AppSession.to.session
            .write(SessionKeys.API_KEY, otpModelClass?.data?.token ?? '');
        Get.offAllNamed(Routes.homeStackDashboard);
      } else {
        showToast(context: context, message: otpModelClass?.message ?? '');
      }
    } catch (e) {
      print('Exception : $e');
    } finally {
      update();
    }
  }
}
