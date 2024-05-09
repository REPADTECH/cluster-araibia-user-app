import 'package:cluster_arabia/res/animation.dart';
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/coupon/bind/coupon_bind.dart';
import 'package:cluster_arabia/ui/pages/coupon/view/coupon_more.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBarBack('Coupon', primaryColorPurple, () {
          CouponController.to.onInit();
        }),
        body: CouponList());
  }
}
