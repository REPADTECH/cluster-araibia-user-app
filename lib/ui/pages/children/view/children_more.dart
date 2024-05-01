import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/children/bind/children_bind.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchPart extends StatelessWidget {
  const SearchPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.cWidth,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: primaryColorPurple),
          borderRadius: BorderRadius.circular(18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 270,
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15, bottom: 13),
                    hintText: 'Search...'),
              )),
          Icon(
            Icons.search,
            size: 20,
          )
        ],
      ).cPadOnly(r: 10),
    );
  }
}

class ListPart extends StatelessWidget {
  final String studentName;
  final String gender;
  final String schoolName;
  final String schoolCode;
  final String routeName;
  final String pickupName;
  final String location;
  final String amount;
  final String division;

  const ListPart(
      {super.key,
      required this.studentName,
      required this.gender,
      required this.schoolName,
      required this.schoolCode,
      required this.routeName,
      required this.pickupName,
      required this.location,
      required this.amount,
      required this.division});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, i) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            // height: 135,
            width: context.cWidth,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              // color: Color.fromRGBO(240, 243, 253, 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 1,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
              ],
              // border: Border.all(color: Colors.black54, width: 0.2),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          profilePic,
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(studentName,
                            style: customStyle(
                                15.0, Colors.black, FontWeight.bold)),
                        Text(' (${gender})',
                            style: customStyle(
                                13.0,
                                Color.fromRGBO(99, 99, 99, 1),
                                FontWeight.normal)),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 15,
                        ),
                        SizedBox(
                            width: 270,
                            child: Text(
                              location,
                              style: customStyle(
                                  11.0, Colors.black, FontWeight.normal),
                            ))
                      ],
                    ).cPadOnly(t: 8),
                    Row(
                      children: [
                        SvgPicture.asset(
                          schoolcap,
                          height: 12,
                          width: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(schoolName,
                            style: customStyle(
                                12.0, Colors.black, FontWeight.normal)),
                        Text(' (${schoolCode})',
                            style: customStyle(
                                12.0,
                                Color.fromRGBO(99, 99, 99, 1),
                                FontWeight.normal)),
                      ],
                    ).cPadOnly(t: 6),
                    Row(
                      children: [
                        SvgPicture.asset(
                          routeIcon,
                          height: 12,
                          width: 12,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(routeName,
                            style: customStyle(
                                11.0, Colors.black, FontWeight.normal)),
                        Text(' (${pickupName})',
                            style: customStyle(
                                11.0,
                                Color.fromRGBO(99, 99, 99, 1),
                                FontWeight.normal)),
                      ],
                    ).cPadOnly(t: 6),
                  ],
                ),
                Row(
                  children: [
                    CustomButtonWidget(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        borderColor: Colors.black54,
                        vPadding: 4,
                        width: 45,
                        radius: 13,
                        buttonTitle: division,
                        titleStyle:
                            customStyle(11.0, Colors.black, FontWeight.normal)),
                    SizedBox(
                      width: 5,
                    ),
                    CustomButtonWidget(
                        backgroundColor: Color.fromRGBO(3, 159, 0, 1),
                        vPadding: 5,
                        width: 55,
                        radius: 13,
                        buttonTitle: 'Active',
                        titleStyle:
                            customStyle(11.0, Colors.white, FontWeight.bold)),
                  ],
                ).cPosition(r: 0),
                // Icon(Icons.location_on_rounded).cPosition(r: 0, t: 35),
                SvgPicture.asset(locationIcon,color: primaryColorPurple,width: 30,height: 30,).cPosition(r: 0,t: 35),
                CustomButtonWidget(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        borderColor: Colors.black54,
                        vPadding: 4,
                        width: 85,
                        radius: 13,
                        buttonTitle: amount,
                        titleStyle:
                            customStyle(11.0, Colors.black, FontWeight.normal))
                    .cPosition(r: 0, b: 0),
              ],
            ),
          ).cPadOnly(t: 13);
        });
  }
}

class SelectionButton extends StatelessWidget {
  const SelectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenController>(builder: (logic) {
      return Row(
        children: [
          Wrap(
            children: [
              ActionChip(
                // avatar: Icon(Icons.remove),
                backgroundColor: (logic.isSelected == 0)
                    ? Color.fromRGBO(65, 54, 133, 1)
                    : Colors.white,
                labelStyle: TextStyle(
                    color:
                        (logic.isSelected == 0) ? Colors.white : Colors.black,
                    fontSize: 11.0),
                label: Text('All',style: customStyle(10.0, (logic.isSelected == 0) ? Colors.white : primaryColorPurple, FontWeight.normal),),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20),
                    side: BorderSide(color: primaryColorPurple)// Set the border radius here
                ),
                onPressed: () {
                  logic.isSelected = 0;
                  logic.update();
                },
              ),
              SizedBox(
                width: 8,
              ),
              ActionChip(
                // avatar: Icon(Icons.remove),
                backgroundColor: (logic.isSelected == 1)
                    ? Color.fromRGBO(65, 54, 133, 1)
                    : Colors.white,
                labelStyle: TextStyle(
                    color:
                        (logic.isSelected == 1) ? Colors.white : Colors.black,
                    fontSize: 11.0),
                label: Text('Active',style: customStyle(10.0, (logic.isSelected == 1) ? Colors.white : primaryColorPurple, FontWeight.normal),),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20),
                  side: BorderSide(color: primaryColorPurple)// Set the border radius here
                ),
                onPressed: () {
                  logic.isSelected = 1;
                  logic.update();
                },
              ),
              SizedBox(
                width: 8,
              ),
              ActionChip(
                // avatar: Icon(Icons.remove),
                backgroundColor: (logic.isSelected == 2)
                    ? Color.fromRGBO(65, 54, 133, 1)
                    : Colors.white,
                labelStyle: TextStyle(
                    color:
                        (logic.isSelected == 2) ? Colors.white : Colors.black,
                    fontSize: 11.0),
                label: Text('Inactive',style: customStyle(10.0, (logic.isSelected == 2) ? Colors.white : primaryColorPurple, FontWeight.normal),),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20),
                    side: BorderSide(color: primaryColorPurple)// Set the border radius here
                ),
                onPressed: () {
                  logic.isSelected = 2;
                  logic.update();
                },
              ),
            ],
          ),
        ],
      );
    });
  }
}
