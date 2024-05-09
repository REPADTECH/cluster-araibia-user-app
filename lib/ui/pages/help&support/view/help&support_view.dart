import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/style.dart';
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
      appBar: commonAppBarBack('Help&Support', primaryColorPurple, () { }),
      body: Column(children: [
        Container(
          height: 148,
          width: context.cWidth,
          decoration:
           BoxDecoration(color: primaryColorPurple),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.contactUs);
                    },
                    child: Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blue),
                          borderRadius:
                          BorderRadius.circular(
                              4)),
                      child: Center(
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12),
                          )),
                    ),
                  )
                ],
              ).cPadOnly(r: 10,l: 10,t: 10),

              Text(
                'How can we help you today?',
                style: customStyle(24.0, Colors.white, FontWeight.bold),
              ).cPadOnly(t: 15, b: 18),
              
            ],
          ),
        ),
      ],),
    );
  }
}
