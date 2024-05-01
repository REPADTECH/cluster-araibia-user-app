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

  final RxString categoryValue = 'Student Name'.obs;
  // List<String> categoryItems = [];
  List<String> categoryItems = ['Sharafas','Sharun','Rohith','Ramees','Salman'];

  DateRange? selectedDateRange;
  var startDatePass = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var endDatePass = DateFormat('yyyy-MM-dd').format(DateTime.now());


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


}