
import 'package:get/get.dart';

class CouponBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CouponController());
  }
}

class CouponController extends GetxController {
  static CouponController get to => Get.find();
}