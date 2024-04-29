import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

AppBar  commonAppBarBack(String titleName, var bColor) {
  return AppBar(
    backgroundColor: bColor,
    elevation: 0,
    titleSpacing: 0,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        HomeStackDashboardController.to.changeTabIndex(0);
        Get.back();
      },
      child: const Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.white,
      ),
    ),
    title: Text(
      titleName,
      style: customStyle(
        18.0,
        Colors.white,
        FontWeight.bold,
      ),
    ),
    actions: [
      SvgPicture.asset(clearUpdateIcon,height: 20,width: 20,).cPadOnly(r: 15),
    ],
  );
}