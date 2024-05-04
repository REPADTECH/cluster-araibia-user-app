import 'package:get/get.dart';

class ChildrenInnerPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChildrenInnerPageController());
  }
}

class ChildrenInnerPageController extends GetxController {
  static ChildrenInnerPageController get to => Get.find();
}