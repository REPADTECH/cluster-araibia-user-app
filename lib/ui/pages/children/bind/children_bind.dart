import 'package:get/get.dart';

class ChildrenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChildrenController());
  }
}

class ChildrenController extends GetxController {
  static ChildrenController get to => Get.find();
  var isSelected=0;
}