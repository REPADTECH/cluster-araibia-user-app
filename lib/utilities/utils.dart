import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:toastification/toastification.dart';

showLoading() {
  EasyLoading.show();
}

dismissLoading() {
  EasyLoading.dismiss();
}

showToast({required BuildContext context, required var message}) {
  // EasyLoading.showToast(message);
  toastification.show(
    context: context, // optional if you use ToastificationWrapper
    title: Text(message),
    autoCloseDuration: const Duration(seconds: 5),
  );
}

validateLoginPage({var value}) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  // Check if the value contains an '@' symbol which is typical for emails
  if (value.contains('@')) {
    // Regular expression to validate an email
    String pattern = r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
  } else {
    // Regular expression to validate a mobile number
    String pattern = r'(^[0-9]{10}$)';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid mobile number';
    }
  }
  return null;
}
