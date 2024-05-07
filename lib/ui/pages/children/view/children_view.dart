import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/ui/pages/children/bind/children_bind.dart';
import 'package:cluster_arabia/ui/pages/children/view/children_more.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';

class ChildrenView extends StatelessWidget {
  const ChildrenView({super.key});

  @override
  Widget build(BuildContext context) {
    ChildrenController.to.context = context;
    return Scaffold(
      appBar: commonAppBarBack('Children', primaryColorPurple),
      body: SingleChildScrollView(
        child: Column(
          children: [SearchPart(), SelectionButton(), ListPart()],
        ).cPadAll(10),
      ),
    );
  }
}
