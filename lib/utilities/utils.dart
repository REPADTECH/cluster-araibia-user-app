import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

showLoading() {
  EasyLoading.show();
}

dismissLoading() {
  EasyLoading.dismiss();
}

showToast({required BuildContext context, required var message}) {
  EasyLoading.showToast(message);
}
