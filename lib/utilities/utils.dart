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
