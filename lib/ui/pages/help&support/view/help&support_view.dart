import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/help&support/bind/help&support_bind.dart';
import 'package:cluster_arabia/ui/pages/help&support/view/help&support_more.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarBack('Help and Support', primaryColorPurple, () {
        HelpAndSupportController.to.onInit();
      }),
      body: Column(children: [
      Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      height: 135,
      width: context.cWidth,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        // color: Color.fromRGBO(240, 243, 253, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 1,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          ),
        ],
        // border: Border.all(color: Colors.black54, width: 0.2),
      ),)
        // FirstPart(),
        // BottomPart()
      ],).cPadAll(15),
    );
  }
}
