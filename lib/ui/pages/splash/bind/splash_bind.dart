import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  @override
  void onInit() {
    3.cDelay(() {
      Get.offAllNamed(Routes.login);
    });
    super.onInit();
  }
}
