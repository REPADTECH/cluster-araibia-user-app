import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/children_innerpage/view/children_more.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ProfilePart(nameOfChild: 'Sharafas OM', division: '10 D', schoolName: 'TEST SCHOOL NAME',),
        AddressPart(),
          SchoolDetails(schoolname: 'TEST SCHOOL NAME', division: '10 (A)', admissionNo: 'Admission No', contactNo: '9876543210',)
      ],).cPadAll(20),
    );
  }
}
