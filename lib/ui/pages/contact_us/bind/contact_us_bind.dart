import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ContactUsController());
  }
}

class ContactUsController extends GetxController {
  static ContactUsController get to => Get.find();

  var helpAndSupportFormKey = GlobalKey<FormState>();
  final subject = TextEditingController();
  final complaint = TextEditingController();
  final contactNumber = TextEditingController();

  @override
  void onInit() {
    subject.clear();
    complaint.clear();
    super.onInit();
  }


}