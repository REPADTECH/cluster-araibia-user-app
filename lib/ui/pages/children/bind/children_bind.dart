import 'package:cluster_arabia/models/student_list_model.dart' as student;
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
  final searchChildrenController = TextEditingController();
  late ScrollController scrollController;
  var isSelected=0;
  student.StudentModelList?studentModelList;
  List<student.DataList> studentList = [];
  late BuildContext context;
  bool hasNextPage = false;
  var pageNO = 1;

  @override
  void onInit() {
    clearData();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
    getStudentList();
    super.onInit();
  }

  void loadMore() async {
    if (hasNextPage) {
      pageNO = pageNO + 1;
      getStudentList();
      // isLoadMoreRunning = false;
    } else {
      debugPrint('');
    }
  }

  clearData(){
    studentList.clear();
    searchChildrenController.text='';
  }

  Future<void> getStudentList() async {
    try {
      showLoading();
      studentModelList = await Api.to.getStudentsList(status: true, page: pageNO,search: searchChildrenController.text);
      dismissLoading();
      if (!(studentModelList?.success ?? true)) {
        showToast(context: context, message: studentModelList?.message ?? '');
      } else {
        hasNextPage =
        ((studentModelList?.data?.dataList ?? []).length == 20) ? true : false;
        studentList.addAll((studentModelList?.data?.dataList ?? []));
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }
}

