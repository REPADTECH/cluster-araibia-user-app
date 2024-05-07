import 'package:cluster_arabia/models/student_by_id.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
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
  StudentViewById? studentViewById;
  late BuildContext context;
  var studentId;
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(11.236297899106287, 76.05035632326266),
    zoom: 14.4746,
  );

  @override
  void onInit() {
    var argument = Get.arguments;
    if (argument != null) {
      studentId = argument[0];
      getStudentById();
    }
    super.onInit();
  }

  void getStudentById() async {
    try {
      showLoading();
      studentViewById = await Api.to.getStudentById(studentId: studentId);
      dismissLoading();
      if (!(studentViewById?.success ?? true)) {
        showToast(context: context, message: studentViewById?.message ?? '');
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }
}
