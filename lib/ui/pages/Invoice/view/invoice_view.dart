import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBarBack(
        'Invoices',
        primaryColorPurple,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(5)),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ],
          ).cPadOnly(t: 10, l: 10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            height: 135,
            width: context.cWidth,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              // color: Color.fromRGBO(240, 243, 253, 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 0,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
              ],
              // border: Border.all(color: Colors.black54, width: 0.2),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon(Icons.access_time_filled_rounded),
                      SizedBox(width: 5,),
                      Text('Aug 2024')
                    ],),
                    Container(
                      width: 80,
                      height: 27,
                      decoration: BoxDecoration(color: Color.fromRGBO(255, 243, 235, 1),border: Border.all(color: Color.fromRGBO(249, 122, 30, 1)),borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Container(
                          height: 8,width: 8,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Color.fromRGBO(249, 122, 30, 1),)),
                          SizedBox(width: 8,),
                          Text('Open',style: customStyle(13.0, Color.fromRGBO(249, 122, 30, 1), FontWeight.normal),)
                      ],),

                    ),
                    
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Invoice no #70360936703496'),
                  Text('SAR 115.23',style: customStyle(12.0, Colors.black, FontWeight.bold),),
                ],),
                SizedBox(height: 5,),
                DottedLine(dashGapLength: 6,lineThickness: 0.5,),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Image.asset(profilePic,height: 25,width: 25,),
                    SizedBox(width: 15,),
                    Text('Sharafas OM ',style: customStyle(13.0, Colors.black, FontWeight.bold)),
                    Text('( 10 A )',style: customStyle(13.0, Color.fromRGBO(99, 99, 99, 1), FontWeight.bold)),
                  ],),
                Row(children: [
                  Icon(Icons.access_time_filled_rounded),
                  SizedBox(width: 5,),
                  Text('TEST SCHOOL ABCD',style: customStyle(12.0, Colors.black, FontWeight.normal)),
                  Text('(ABC1234)',style: customStyle(12.0, Color.fromRGBO(99, 99, 99, 1), FontWeight.bold)),

                ],),

              ],
            ),
          ).cMargOnly(t: 10,l: 10,r: 10)
        ],
      ),
    );
  }
}
