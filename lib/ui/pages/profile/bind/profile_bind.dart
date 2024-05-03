import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
}