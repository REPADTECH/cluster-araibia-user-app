import 'package:cluster_arabia/models/profile_model.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
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
  ProfileModel? profileModel;
  late BuildContext context;
  DateTime? startMonth;
  DateTime? endMonth;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void getProfile() async {
    try {
      showLoading();
      profileModel = await Api.to.getProfile();
      dismissLoading();
      if (!(profileModel?.success ?? true)) {
        showToast(context: context, message: profileModel?.message ?? '');
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }
}
