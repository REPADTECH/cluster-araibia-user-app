import 'package:cluster_arabia/models/student_list_model.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
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
  StudentModelList?studentModelList;
  late BuildContext context;
  @override
  void onInit() {
    getStudentList();
    super.onInit();
  }
  Future<void> getStudentList() async {
    try {
      showLoading();
      studentModelList = await Api.to.getStudentsList(status: true, page: 1);
      dismissLoading();
      if (!(studentModelList?.success ?? true)) {
        showToast(context: context, message: studentModelList?.message ?? '');
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }
}

