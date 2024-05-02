import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final currentPage = 0.obs;

  DateTime? startMonth;
  DateTime? endMonth;

}