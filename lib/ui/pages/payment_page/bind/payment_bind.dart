import 'dart:async';

import 'package:cluster_arabia/ui/pages/home/bind/home_bind.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentBind implements Bindings {
  @override
  void dependencies() {
    Get.put(PaymentController());
  }
}

class PaymentController extends GetxController {
  static PaymentController get to => Get.find();
  late final WebViewController webViewController;
  Timer? countdownTimer;
  var timer = 600.obs; // 10 minutes (600 seconds)

  @override
  void onInit() {
    var arguments = Get.arguments;
    if (arguments != null) {
      openWebView(url: arguments[0]);
      startTimer();
    }
    super.onInit();
  }

  @override
  void onClose() {
    HomeController.to.onClear();
    HomeController.to.onInit();
    super.onClose();
  }

  @override
  void dispose() {
    HomeController.to.onInit();
    PaymentController.to.dispose();
    super.dispose();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.timer.value > 0) {
        this.timer.value--;
      } else {
        closePage();
        timer.cancel();
      }
    });
  }

  void closePage() {
    if (Get.isDialogOpen == true) {
      Get.back();
    } else {
      Get.back(result: "Page closed automatically.");
    }
  }

  void openWebView({required url}) {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }
}
