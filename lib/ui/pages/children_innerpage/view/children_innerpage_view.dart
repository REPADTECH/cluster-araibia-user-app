import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/children_innerpage/view/children_innerPage_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

class ChildrenInnerPage extends StatelessWidget {
  const ChildrenInnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Get.back();
          },
            child: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ProfilePart(),
          AddressPart(),
            SchoolDetails(),
            Row(
              children: [
                PickupPointSection().cExpanded(1),
                SizedBox(width: 15,),
                MapSection().cExpanded(1),
              ],
            ),
            BusDetails(),
            OtherInfo()
        ],).cPadAll(20),
      ),
    );
  }
}
