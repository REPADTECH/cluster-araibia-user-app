import 'package:cluster_arabia/models/profile_model.dart';
import 'package:cluster_arabia/ui/pages/Invoice/bind/invoice_bind.dart';
import 'package:cluster_arabia/ui/pages/children/bind/children_bind.dart';
import 'package:cluster_arabia/ui/pages/home/bind/home_bind.dart';
import 'package:cluster_arabia/ui/pages/profile/bind/profile_bind.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:cluster_arabia/utilities/com_binding.dart';
import 'package:cluster_arabia/utilities/strings.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeStackDashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeStackDashboardController());
    Get.put(HomeController());
    Get.put(InvoiceController());
    Get.put(ChildrenController());
    Get.put(ProfileController());
  }
}

class HomeStackDashboardController extends GetxController {
  static HomeStackDashboardController get to => Get.find();
  ProfileModel?profileModel;
  late BuildContext context;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var indexedStack = 0.obs;
  var tabIndex = 0.obs;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void changeTabIndex(int index) {
    try {
      tabIndex.value = index;
      updateControllersOnTabChange(index);
      indexedStack.value = tabIndex.value;
      update();
    } catch (ex) {
      // Handle the exception
    }
  }

  void updateControllersOnTabChange(int index) {
    if (index == 1) {
      HomeController.to.onInit();
    } else if (index == 0) {
      InvoiceController.to.onInit();
    } else if (index == 2) {
      ChildrenController.to.onInit();
    } else if (index == 3) {
      ProfileController.to.onInit();
    }
  }

  void updateDashboardData() {
    HomeController.to.onInit();
  }

  void handleAccountTab() {
    // if (AppSession.to.session.read(SessionKeys.API_KEY) != null) {
      // MyAccountController.to.onInit();
    // } else {
    //   Get.offNamed(Routes.login);
    // }
  }

  void getProfile() async{
    try{
      showLoading();
      profileModel = await Api.to.getProfile();
      dismissLoading();
      if (!(profileModel?.success ?? true)) {
        showToast(context: context, message: profileModel?.message ?? '');
      }

    }catch(e){
      showToast(context: context, message: e.toString());
    }finally{
      update();
    }
  }
}