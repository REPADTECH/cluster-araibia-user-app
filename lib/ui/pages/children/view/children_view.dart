import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/ui/pages/children/view/children_more.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';

class ChildrenView extends StatelessWidget {
  const ChildrenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarBack('Children', primaryColorPurple),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchPart(),
            SelectionButton(),
            ListPart(
              studentName: 'Sharafas OM',
              gender: 'Male',
              schoolName: 'TEST SCHOOL ABCD',
              schoolCode: 'ABC1234',
              routeName: 'Route name',
              pickupName: 'pickup point name',
              location: 'Suite 875 579 Cole Club, Chaunceymouth, MI 04708-1942 ',
              amount: 'SAR 100.50',
              division: '4(B)',
            )
          ],
        ).cPadAll(10),
      ),
    );
  }
}
