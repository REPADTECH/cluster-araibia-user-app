
import 'package:cluster_arabia/models/help&support_list_model.dart' as help;
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpAndSupportBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HelpAndSupportController());
  }
}

class HelpAndSupportController extends GetxController {
  static HelpAndSupportController get to => Get.find();
  help.HelpAndSupportModelList? helpAndSupportModelList;
  late BuildContext context;
  List<help.HelpAndSupportList> helpAndSupportLists = [];
  bool hasNextPage = false;
  var pageNO = 1;




  @override
  void onInit() {
    getHelpList();
    super.onInit();
  }

  void getHelpList() async {
    try {
      showLoading();
      helpAndSupportModelList = await Api.to.getHelpList(page: pageNO,
      );
      dismissLoading();
      if (!(helpAndSupportModelList?.success ?? true)) {
        showToast(context: context, message: helpAndSupportModelList?.message ?? '');
      } else {
        hasNextPage =
        ((helpAndSupportModelList?.data?.helpAndSupportList ?? []).length == 20) ? true : false;
        helpAndSupportLists.addAll((helpAndSupportModelList?.data?.helpAndSupportList ?? []));
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }
}