import 'package:cluster_arabia/ui/pages/Invoice/bind/invoice_bind.dart';
import 'package:cluster_arabia/ui/pages/children/bind/children_bind.dart';
import 'package:cluster_arabia/ui/pages/home/bind/home_bind.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:cluster_arabia/utilities/com_binding.dart';
import 'package:cluster_arabia/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeStackDashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeStackDashboardController());
    Get.put(HomeController());
    Get.put(InvoiceController());
    Get.put(ChildrenController());
  }
}

class HomeStackDashboardController extends GetxController {
  static HomeStackDashboardController get to => Get.find();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var indexedStack = 0.obs;
  var tabIndex = 0.obs;


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
      // AdvancedSearchController.to.onInit();
    } else if (index == 0) {
      // updateDashboardData();
    } else if (index == 2) {
      // CategoriesController.to.onInit();
      // NewDashBoardController.to.getCategory();
    } else if (index == 3) {
      // WishListController.to.onInit();
    } else if (index == 4) {
      // handleAccountTab();
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
}