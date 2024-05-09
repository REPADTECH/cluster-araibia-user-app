
import 'package:cluster_arabia/models/coupon_list_model.dart'as couponList;
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CouponBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CouponController());
  }
}

class CouponController extends GetxController {
  static CouponController get to => Get.find();

  couponList.CouponModelList? couponModelList;
  List<couponList.Coupons> couponLists = [];
  late BuildContext context;
  bool hasNextPage = false;
  var pageNO = 1;


  @override
  void onInit() {
    couponLists.clear();
    getCouponList();
    super.onInit();
  }

  void copyToClipboard(String value) {
    Clipboard.setData(ClipboardData(text: value));
    EasyLoading.showToast('Copied');
  }

  void getCouponList() async {
    try {
      showLoading();
      couponModelList = await Api.to.getCouponList(page: pageNO,
      );
      dismissLoading();
      if (!(couponModelList?.success ?? true)) {
        showToast(context: context, message: couponModelList?.message ?? '');
      } else {
        hasNextPage =
        ((couponModelList?.data?.coupons ?? []).length == 20) ? true : false;
        couponLists.addAll((couponModelList?.data?.coupons ?? []));
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

}