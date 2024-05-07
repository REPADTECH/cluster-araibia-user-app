import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarBack('About Us', primaryColorPurple),
    );
  }
}
