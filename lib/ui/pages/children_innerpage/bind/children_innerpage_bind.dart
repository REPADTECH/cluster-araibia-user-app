import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChildrenInnerPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChildrenInnerPageController());
  }
}

class ChildrenInnerPageController extends GetxController {
  static ChildrenInnerPageController get to => Get.find();

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(11.236297899106287, 76.05035632326266),
    zoom: 14.4746,
  );
}