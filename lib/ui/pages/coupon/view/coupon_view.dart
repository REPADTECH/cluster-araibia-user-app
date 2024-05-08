import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarBack('Coupon', primaryColorPurple, () { }),
    );
  }
}
