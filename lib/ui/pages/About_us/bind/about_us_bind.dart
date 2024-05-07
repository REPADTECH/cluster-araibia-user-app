import 'package:get/get.dart';

class AboutUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AboutUsController());
  }
}

class AboutUsController extends GetxController {
  static AboutUsController get to => Get.find();
}