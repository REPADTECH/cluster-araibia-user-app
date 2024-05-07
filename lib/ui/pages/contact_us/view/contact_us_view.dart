import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarBack( 'Contact Us', primaryColorPurple,(){}),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text('Our Address',
            style: customStyle(16.0, Colors.black, FontWeight.bold),
          ).cPadAll(10.0),
          Text('123 Main Street,Apt 5B,Nob Hill,SanFrancisco,CA 94109',
            style: customStyle(14.0, Colors.black, FontWeight.normal),
          ).cPadAll(10.0),
          SizedBox(
            height: 10,
          ),
          Text('Contact Number :   9876543210',style: customStyle(15.0, Colors.black, FontWeight.normal)).cPadAll(10.0),
        ],
      ),
    );
  }
}
