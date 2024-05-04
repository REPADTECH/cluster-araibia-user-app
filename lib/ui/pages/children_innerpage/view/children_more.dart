import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePart extends StatelessWidget {
  final String nameOfChild;
  final String division;
  final String schoolName;
  const ProfilePart({super.key, required this.nameOfChild, required this.division, required this.schoolName, });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(childrenProfile,height: 80,width: 80,),
        SizedBox(width: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nameOfChild,style: customStyle(20.0, Colors.black, FontWeight.bold),),
            SizedBox(height: 5,),
            Text(division,style: customStyle(11.0, Colors.black, FontWeight.normal),),
            SizedBox(height: 3,),
            Text(schoolName,style: customStyle(10.0, Colors.black, FontWeight.normal),),
          ],)
      ],);
  }
}

class AddressPart extends StatelessWidget {
  const AddressPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Address',style: customStyle(15.0, Colors.black, FontWeight.bold),),
      Text('House No: 62/6693, Mohan Villa,, Justice Chandrasekhara Menon Road (layam Road), Eranakulam P O, Kochi, Kerala 682011, India',style: customStyle(12.0, Colors.black, FontWeight.normal),).cPadOnly(t: 5),
        SizedBox(height: 10,),
        Row(
          children: [
            Container(
              // width: 150,
              height: 40,decoration: BoxDecoration(border: Border.all(color: primaryColorPurple),borderRadius: BorderRadius.circular(8),
                // boxShadow: [BoxShadow(color: Color.fromRGBO(0,0,0,.1),blurRadius: 12,spreadRadius: 3)]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              SvgPicture.asset(disableRequestIcon,width: 15,height: 15,),
              Text('Request To Disable',style: customStyle(13.0, primaryColorPurple, FontWeight.bold),)
            ],),
            ).cExpanded(1),
            SizedBox(width: 5,),
            Container(
              // width: 150,
              height: 40,decoration: BoxDecoration(border: Border.all(color: primaryColorPurple),borderRadius: BorderRadius.circular(8),
                // boxShadow: [BoxShadow(color: Color.fromRGBO(0,0,0,.1),blurRadius: 10,spreadRadius: 2)]
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(locationIcon),
                  Text('Track Location',style: customStyle(13.0, primaryColorPurple, FontWeight.bold),)
                ],),
            ).cExpanded(1),
          ],
        ),
    ],).cPadOnly(t: 15);
  }
}

class SchoolDetails extends StatelessWidget {
  final String schoolname;
  final String division;
  final String admissionNo;
  final String contactNo;
  const SchoolDetails({super.key, required this.schoolname, required this.division, required this.admissionNo, required this.contactNo, });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('School',style: customStyle(15.0, Colors.black, FontWeight.bold),),
      SizedBox(height: 8,),
      Container(
        padding: EdgeInsets.all(15),
       decoration: BoxDecoration(color: Color.fromRGBO(232, 231, 233, 1),borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Image.asset(childrenProfile,height: 80,width: 80,),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(schoolname,style: customStyle(14.0, Colors.black, FontWeight.bold),),
                SizedBox(height: 5,),
                Text(division,style: customStyle(12.0, Colors.black, FontWeight.normal),),
                SizedBox(height: 3,),
                Text(admissionNo,style: customStyle(12.0, Colors.black, FontWeight.normal),),
                SizedBox(height: 3,),
                Text(contactNo,style: customStyle(12.0, Colors.black, FontWeight.normal),),
              ],)
          ],),
          IconButton(onPressed: (){}, icon: Icon(Icons.call,size: 18,))
          .cPosition(b: -10,r: -10)
        ],
      ),
      )
    ],).cPadOnly(t: 15);
  }
}


