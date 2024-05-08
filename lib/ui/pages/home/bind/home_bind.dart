import 'package:cluster_arabia/models/banner_list_model.dart';
import 'package:cluster_arabia/models/home_page_models.dart';
import 'package:cluster_arabia/models/profile_model.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  var startDatePass = DateTime.now().cGetFormattedDate(format: 'yyyy-MM-dd'),
      endDatePass = DateTime.now().cGetFormattedDate(format: 'yyyy-MM-dd');
  final currentPage = 0.obs;
  ProfileModel? profileModel;
  BannerListModel?bannerListModel;
  BannerListModel?sliderModel;
  late BuildContext context;
  DateTime? startMonth;
  DateTime? endMonth;
  HomeBillAmount? homeBillAmount;

  @override
  void onInit() {
    getProfile();
    getHomeAmount();
    getBannerData();
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

  void getHomeAmount() async {
    try {
      showLoading();
      homeBillAmount =
          await Api.to.getHomePageBillAmount(startDate: startDatePass, endDate: endDatePass);
      dismissLoading();
      if (!(homeBillAmount?.success ?? true)) {
        showToast(context: context, message: homeBillAmount?.message ?? '');
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

  void getBannerData() async{
    try {
      showLoading();
      bannerListModel =
      await Api.to.getBannerList(bannerTYpe: 'banner');
      dismissLoading();
      showLoading();
      sliderModel =
      await Api.to.getBannerList(bannerTYpe: 'slider');
      dismissLoading();
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }
}
