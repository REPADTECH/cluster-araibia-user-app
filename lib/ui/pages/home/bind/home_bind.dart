import 'dart:convert';

import 'package:cluster_arabia/models/banner_list_model.dart';
import 'package:cluster_arabia/models/coupon_validation_model.dart';
import 'package:cluster_arabia/models/home_page_models.dart' as student;
import 'package:cluster_arabia/models/profile_model.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

  TextEditingController couponCode = TextEditingController();

  ProfileModel? profileModel;
  BannerListModel? bannerListModel;
  BannerListModel? sliderModel;
  student.HomeBillAmount? homeBillAmount;
  CouponModel? couponModel;

  late BuildContext context;
  DateTime? startMonth;
  DateTime? endMonth;
  var totWidth = 60;
  var isAddMore = false.obs;
  bool cartCouponIsValid = false;
  var validCouponText = '';
  var paymentType = 'pay_at_shop'.obs;
  var singleLineText;
  List<String> sId = [''];
  RxString pId = ''.obs;
  RxBool isValidCoupon = false.obs;

  @override
  void onInit() {
    getProfile();
    getHomeAmount();
    getBannerData();
    super.onInit();
  }

  clearVariable() {
    sId.clear();
    pId.value = '';
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
      homeBillAmount = await Api.to.getHomePageBillAmount(
          startDate: startDatePass, endDate: endDatePass);
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

  // void main() {
  //   List<student.Students1> items = homeBillAmount?.data?.students??[];
  //   // List<dynamic> items = ['apple', 123, true];
  //    singleLineText = (items).map((item) => item.studentName.toString()).join(', ');
  //   print('**********${singleLineText}');
  // }

  String studentsName() {
    return (homeBillAmount?.data?.students ?? [])
        .map((item) => item.studentName.toString())
        .join(', ');
  }
  // String studentsId() {
  //   return (homeBillAmount?.data?.students ?? [])
  //       .map((item) => item.id.toString())
  //       .join('');
  // }

  void getBannerData() async {
    try {
      showLoading();
      bannerListModel = await Api.to.getBannerList(bannerTYpe: 'banner');
      dismissLoading();
      showLoading();
      sliderModel = await Api.to.getBannerList(bannerTYpe: 'slider');
      dismissLoading();
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

  // void validateCoupon() async {
  //   if (studentsId().isEmpty && pId.isEmpty) {
  //     EasyLoading.showToast('Please Choose Student Or Parent');
  //     return;
  //   }
  //   if (studentsId().isEmpty) {
  //     EasyLoading.showToast(
  //         'Please confirm that the child of the selected parent is included in the list');
  //     return;
  //   }
  //   // if (!(billingKey.currentState?.validate() ?? false)) {
  //   //   return;
  //   // }
  //   try {
  //     EasyLoading.show();
  //     10.cDelay(() {
  //       EasyLoading.dismiss();
  //     });
  //     couponModel = await Api.to.couponValidate(
  //         couponId: couponCode.text,
  //         studentId: jsonEncode(studentsId()),);
  //     EasyLoading.dismiss();
  //     if (couponModel?.success ?? false) {
  //       EasyLoading.showSuccess('This Coupon Is Valid');
  //       isValidCoupon.value = couponModel?.success ?? false;
  //       update();
  //     } else {
  //       {
  //         EasyLoading.showError(couponModel?.message ?? '');
  //         couponCode.clear();
  //       }
  //     }
  //   } catch (ex) {
  //     EasyLoading.dismiss();
  //     EasyLoading.showToast('Error occurred $ex');
  //   }
  // }

  void validateCoupon() async {
    if (studentsId().isEmpty && pId.isEmpty) {
      EasyLoading.showToast('Please Choose Student Or Parent');
      return;
    }
    if (studentsId().isEmpty) {
      EasyLoading.showToast(
          'Please confirm that the child of the selected parent is included in the list');
      return;
    }
    // if (!(billingKey.currentState?.validate() ?? false)) {
    //   return;
    // }
    try {
      EasyLoading.show();
      10.cDelay(() {
        EasyLoading.dismiss();
      });
      couponModel = await Api.to.couponValidate(
        couponId: couponCode.text,
        studentId:  jsonEncode(studentsId())
        , // Call the function directly (no need for jsonEncode)
      );
      EasyLoading.dismiss();
      if (couponModel?.success ?? false) {
        EasyLoading.showSuccess('This Coupon Is Valid');
        isValidCoupon.value = couponModel?.success ?? false;
        update();
      } else {
        {
          EasyLoading.showError(couponModel?.message ?? '');
          couponCode.clear();
        }
      }
    } catch (ex) {
      EasyLoading.dismiss();
      EasyLoading.showToast('Error occurred $ex');
    }
  }

// Modified studentsId() function to return a list of strings
  List<String> studentsId() {
    return (homeBillAmount?.data?.students ?? [])
        .map((item) => item.id.toString())
        .toList(); // Convert to a list for direct usage
  }

  // void validateCoupon() async {
  //   if (sId.isEmpty && pId.isEmpty) {
  //     EasyLoading.showToast('Please Choose Student Or Parent');
  //     return;
  //   }
  //   if (sId.isEmpty) {
  //     EasyLoading.showToast(
  //         'Please confirm that the child of the selected parent is included in the list');
  //     return;
  //   }
  //   // if (!(billingKey.currentState?.validate() ?? false)) {
  //   //   return;
  //   // }
  //   try {
  //     EasyLoading.show();
  //     10.cDelay(() {
  //       EasyLoading.dismiss();
  //     });
  //     couponModel = await Api.to.couponValidate(
  //         couponId: couponCode.text,
  //         studentId: jsonEncode(sId),);
  //     EasyLoading.dismiss();
  //     if (couponModel?.success ?? false) {
  //       EasyLoading.showSuccess('This Coupon Is Valid');
  //       isValidCoupon.value = couponModel?.success ?? false;
  //       update();
  //     } else {
  //       {
  //         EasyLoading.showError(couponModel?.message ?? '');
  //         couponCode.clear();
  //       }
  //     }
  //   } catch (ex) {
  //     EasyLoading.dismiss();
  //     EasyLoading.showToast('Error occurred $ex');
  //   }
  // }

  void couponIsValid() async {
    try {
      10.cDelay(() {
        EasyLoading.dismiss();
      });
      if (couponCode.text.isEmpty) {
        EasyLoading.showToast('Please enter the coupon code');
        return;
      }
      EasyLoading.show(status: 'loading...');
      couponModel = await Api.to.couponValidate(
          couponId: couponCode.text, studentId: jsonEncode(sId)
      );
      EasyLoading.dismiss();

      if (couponModel?.success ?? true) {
        EasyLoading.showToast('Valid Coupon');
      } else {
        cartCouponIsValid = false;
        // validCouponText ='';
        //This coupon is not applicable. Please visit the coupon section for eligible discounts.
        if ((couponModel?.message ?? '').trim() ==
            'This coupon is not applicable. Please visit the coupon section for eligible discounts.') {
          validCouponText = 'invalidCoupon'.tr;
        } else {
          validCouponText = 'couponYouRedeemed'.tr;
          // validCouponText = couponRedeem?.message ?? '';
        }
        update();
      }
      // if (couponModel?.success ?? true) {
      //   if ((couponModel?.data?.value ?? 0) <
      //       (cartproductlist?.data?.totalAmount ?? 0.0)) {
      //     cartCouponIsValid = true;
      //     validCouponText = 'validCoupon'.tr;
      //     update();
      //   } else {
      //     cartCouponIsValid = false;
      //     validCouponText = 'couponAmonountGreater'.tr;
      //     update();
      //   }
      // }
      // else {
      //   cartCouponIsValid = false;
      //   // validCouponText ='';
      //   //This coupon is not applicable. Please visit the coupon section for eligible discounts.
      //   if ((couponModel?.message ?? '').trim() ==
      //       'This coupon is not applicable. Please visit the coupon section for eligible discounts.') {
      //     validCouponText = 'invalidCoupon'.tr;
      //   } else {
      //     validCouponText = 'couponYouRedeemed'.tr;
      //     // validCouponText = couponRedeem?.message ?? '';
      //   }
      //   update();
      // }
    } catch (e) {
      EasyLoading.showToast('Error : $e');
    }
  }
}
