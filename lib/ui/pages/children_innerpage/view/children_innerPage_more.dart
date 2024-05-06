import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/children_innerpage/bind/children_innerpage_bind.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfilePart extends StatelessWidget {

  const ProfilePart({super.key, });

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
            Text('Sharafas OM',style: customStyle(20.0, Colors.black, FontWeight.bold),),
            SizedBox(height: 5,),
            Text('10 D',style: customStyle(11.0, Colors.black, FontWeight.normal),),
            SizedBox(height: 3,),
            Text('TEST SCHOOL NAME',style: customStyle(10.0, Colors.black, FontWeight.normal),),
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
            InkWell(
              onTap: (){

              },
              child: Container(
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
              ),
            ).cExpanded(1),
            SizedBox(width: 5,),
            InkWell(
              onTap: (){

              },
              child: Container(
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
              ),
            ).cExpanded(1),
          ],
        ),
    ],).cPadOnly(t: 10);
  }
}

class SchoolDetails extends StatelessWidget {

  const SchoolDetails({super.key,  });

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
                Text('TEST SCHOOL NAME',style: customStyle(14.0, Colors.black, FontWeight.bold),),
                SizedBox(height: 5,),
                Text('10 (A)',style: customStyle(12.0, Colors.black, FontWeight.normal),),
                SizedBox(height: 3,),
                Text('Admission No',style: customStyle(12.0, Colors.black, FontWeight.normal),),
                SizedBox(height: 3,),
                Text('9876543210',style: customStyle(12.0, Colors.black, FontWeight.normal),),
              ],)
          ],),
          IconButton(onPressed: (){}, icon: Icon(Icons.call,size: 18,))
          .cPosition(b: -10,r: -10)
        ],
      ),
      )
    ],).cPadOnly(t: 10);
  }
}

class BusDetails extends StatelessWidget {

  const BusDetails({super.key,  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bus Info',style: customStyle(15.0, Colors.black, FontWeight.bold),),
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
                      Text('Test Driver Name',style: customStyle(14.0, Colors.black, FontWeight.bold),),
                      SizedBox(height: 3,),
                      Text('Bus model',style: customStyle(12.0, Colors.black, FontWeight.normal),),
                      SizedBox(height: 3,),
                      Text('Seat Capacity',style: customStyle(12.0, Colors.black, FontWeight.normal),),
                      SizedBox(height: 3,),
                      Text('9876543210',style: customStyle(12.0, Colors.black, FontWeight.normal),),
                    ],)
                ],),
              IconButton(onPressed: (){}, icon: Icon(Icons.call,size: 18,))
                  .cPosition(b: -10,r: -10)
            ],
          ),
        )
      ],).cPadOnly(t: 10);
  }
}

class PickupPointSection extends StatelessWidget {
  const PickupPointSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Pickup Point',style: customStyle(15.0, Colors.black, FontWeight.bold),),
      SizedBox(height: 7,),
      Container(
        width: context.cWidth,
        // height: 110,
        decoration: BoxDecoration(color: Color.fromRGBO(232, 231, 233, 1),borderRadius: BorderRadius.circular(11)),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pickup point Name : ',style: customStyle(11.0, Colors.black, FontWeight.normal),),
            Text(' test pickup ',style: customStyle(11.0, Colors.black, FontWeight.bold),),
            SizedBox(height: 5,),
            Text('Dropping point Name : ',style: customStyle(11.0, Colors.black, FontWeight.normal),),
            Text(' test drop  ',style: customStyle(11.0, Colors.black, FontWeight.bold),),
            SizedBox(height: 5,),
            Text('Route Name : ',style: customStyle(11.0, Colors.black, FontWeight.normal),),
            Text(' test route ',style: customStyle(11.0, Colors.black, FontWeight.bold),),
          ],
        ).cPadAll(8),
      )
    ],).cPadOnly(t: 10);
  }
}

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenInnerPageController>(
      builder: (logic) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student Location',style: customStyle(15.0, Colors.black, FontWeight.bold),),
            SizedBox(height: 7,),
            Container(
              width: context.cWidth,
              height: 110,
              decoration: BoxDecoration(color: Color.fromRGBO(232, 231, 233, 1),borderRadius: BorderRadius.circular(11)),
              child: GoogleMap(
                // markers: logic.markersSet,
                mapType: MapType.normal,
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  // logic.controller = controller;
                  // logic.manager?.setMapId(controller.mapId);
                },
                initialCameraPosition: logic.kGooglePlex,
                // onCameraMove: logic.manager?.onCameraMove,
                // onCameraIdle: logic.manager?.updateMap,
                zoomControlsEnabled: false,
              ),
            )
          ],).cPadOnly(t: 10);
      }
    );
  }
}

class OtherInfo extends StatelessWidget {
  const OtherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Other Info',style: customStyle(15.0, Colors.black, FontWeight.bold),),
    SizedBox(height: 8,),
    Container(
      // height: 115,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(color: Color.fromRGBO(232, 231, 233, 1),borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          OtherInfoType(head: 'Route', info: 'TEST Route',),
          OtherInfoType(head: 'City', info: 'TEST City',),
          OtherInfoType(head: 'Region', info: 'TEST Region',),
          OtherInfoType(head: 'Region', info: 'TEST Region',),
          OtherInfoType(head: 'Service Start Date', info: 'Aug 1, 2022',),
          OtherInfoType(head: 'Service End Date', info: 'Continues',),
        ],
      ),
    )]).cPadOnly(t: 10);
  }
}

class OtherInfoType extends StatelessWidget {
  final String head;
  final String info;
  const OtherInfoType({super.key, required this.head, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(head),
      Text(info),
    ],);
  }
}





