
import 'package:get/get.dart';

class HelpAndSupportBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HelpAndSupportController());
  }
}

class HelpAndSupportController extends GetxController {
  static HelpAndSupportController get to => Get.find();
}