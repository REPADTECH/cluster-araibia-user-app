import 'package:cluster_arabia/models/invoice_list_model.dart' as invoice;
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InvoiceBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InvoiceController());
  }
}

class InvoiceController extends GetxController {
  static InvoiceController get to => Get.find();
  late BuildContext context;
  invoice.InvoiceListModel?invoiceListModel;
  List<invoice.Data> invoiceList=[];
  var pageNO=1;
  final RxString categoryValue = 'Student Name'.obs;
  // List<String> categoryItems = [];
  List<String> categoryItems = ['Sharafas','Sharun','Rohith','Ramees','Salman'];

  DateRange? selectedDateRange;
  var startDatePass = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var endDatePass = DateFormat('yyyy-MM-dd').format(DateTime.now());
  late ScrollController scrollController;
  bool hasNextPage = false;


  DateTime? startMonth;
  DateTime? endMonth;

  void setStartMonth(DateTime month) {
  startMonth = month;
  update(); // This triggers the UI updates
  }

  void setEndMonth(DateTime month) {
  endMonth = month;
  update(); // This triggers the UI updates
  }

  @override
  void onInit() {
    invoiceList.clear();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
    getInvoiceList();
    super.onInit();
  }
  void loadMore() async {
    if (hasNextPage) {
      pageNO = pageNO + 1;
      getInvoiceList();
      // isLoadMoreRunning = false;
    } else {
      debugPrint('');
    }
  }

  void getInvoiceList() async{
    try {
      showLoading();
      invoiceListModel = await Api.to.getInvoiceList(page: pageNO);
      dismissLoading();
      if (!(invoiceListModel?.success ?? true)) {
        showToast(context: context, message: invoiceListModel?.message ?? '');
      }else{
        hasNextPage = ((invoiceListModel?.data ?? []).length == 20)
            ? true
            : false;
        invoiceList.addAll((invoiceListModel?.data ?? []));
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

}