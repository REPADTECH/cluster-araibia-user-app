import 'package:cluster_arabia/models/invoice_list_model.dart' as invoice;
import 'package:cluster_arabia/models/profile_model.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/dio.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:get/get.dart';
import 'package:cluster_arabia/models/student_list_model.dart' as student;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class InvoiceBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InvoiceController());
  }
}

class InvoiceController extends GetxController {
  static InvoiceController get to => Get.find();
  final dateRangeController = DateRangePickerController();
  late BuildContext context;
  invoice.InvoiceListModel? invoiceListModel;
  student.StudentModelList? studentModelList;
  ProfileModel? profileModel;
  student.DataList? billFilterdStudentChoosed;
  var filterChoosed = '';

  // Controller TO The Web View
  // late final WebViewController webViewController;

  List<invoice.DataList> invoiceList = [];
  var pageNO = 1;
  final RxString selectDropDownValue = 'Student Name'.obs;

  // List<String> categoryItems = [];
  List<String> categoryItems = [
    'Sharafas',
    'Sharun',
    'Rohith',
    'Ramees',
    'Salman'
  ];

  DateRange? selectedDateRange;
  var startDatePass;

  var endDatePass;
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

  clearData() {
    invoiceList.clear();
    filterChoosed = '';
    startDatePass = null;
    endDatePass = null;
    billFilterdStudentChoosed = null;
    dateRangeController.selectedRanges = [];
    dateRangeController.selectedRanges = [];
    update();
  }

  @override
  void onInit() {
    clearData();
    // webViewController = WebViewController();
    pageNO = 1;
    getProfile();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
    getInvoiceList();
    getStudentData();

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

  void getInvoiceList() async {
    try {
      showLoading();
      invoiceListModel = await Api.to.getInvoiceList(
        page: pageNO,
        studentId: filterChoosed,
        startDate: startDatePass,
        endDate: endDatePass,
      );
      dismissLoading();
      if (!(invoiceListModel?.success ?? true)) {
        showToast(context: context, message: invoiceListModel?.message ?? '');
      } else {
        hasNextPage = ((invoiceListModel?.data?.dataList ?? []).length == 20)
            ? true
            : false;
        invoiceList.addAll((invoiceListModel?.data?.dataList ?? []));
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

  Future<void> getStudentData() async {
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

  // void setWebViewController({required String id}) async {
  //   var url = '${baseURL}view_bill/$id';
  //   webViewController
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..setBackgroundColor(const Color(0x00000000))
  //     ..setNavigationDelegate(
  //       NavigationDelegate(
  //         onProgress: (int progress) {
  //           // Update loading bar.
  //         },
  //         onPageStarted: (String url) {},
  //         onPageFinished: (String url) {},
  //         onWebResourceError: (WebResourceError error) {},
  //         onNavigationRequest: (NavigationRequest request) {
  //           // if (request.url.startsWith(url)) {
  //           //   return NavigationDecision.prevent;
  //           // }
  //           return NavigationDecision.navigate;
  //         },
  //       ),
  //     )
  //     ..loadRequest(Uri.parse(url));
  //   update();
  // }

  void openBillInBrowser({required String billId}) async {
    var url = '${baseURL}view_bill/$billId';
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
