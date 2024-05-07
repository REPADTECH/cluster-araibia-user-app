import 'package:get/get.dart';

class ContactUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ContactUsController());
  }
}

class ContactUsController extends GetxController {
  static ContactUsController get to => Get.find();
}