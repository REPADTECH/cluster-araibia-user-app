import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/home/bind/home_bind.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 118,
          width: context.cWidth,
          decoration: BoxDecoration(
              color: primaryColorPurple,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SAR 400.00',
                    style: customStyle(25.0, Colors.white, FontWeight.bold),
                  ),
                  Text(
                    'Total payable amount',
                    style: customStyle(10.0, Color.fromRGBO(206, 207, 237, 1),
                        FontWeight.normal),
                  ),
                ],
              ),
              Positioned(
                  right: 60,
                  child: Image.asset(
                    profilePic,
                    height: 40,
                    width: 40,
                  )),
              Positioned(
                  right: 35,
                  child: Image.asset(
                    profilePic,
                    height: 40,
                    width: 40,
                  )),
              Positioned(
                  right: 10,
                  child: Image.asset(
                    profilePic,
                    height: 40,
                    width: 40,
                  )),
            ],
          ).cPadOnly(t: 10, l: 40, r: 15),
        ),
        Row(
          children: [
            ChildBox(
              no: '1',
            ),
            SizedBox(
              width: 15,
            ),
            ChildBox(
              no: '2',
            ),
          ],
        ).cPadOnly(t: 72, l: 30),
      ],
    );
  }
}

class ChildBox extends StatelessWidget {
  final String no;
  const ChildBox({super.key, required this.no});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 70,
      decoration: BoxDecoration(
          color: Color.fromRGBO(246, 246, 246, 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              color: Color.fromRGBO(0, 0, 0, 0.25),
            ),
          ],
          border: Border.all(color: Colors.black, width: 0.2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SAR 200.00',
                    style: customStyle(11.0, Colors.black, FontWeight.bold),
                  ),
                  Text(
                    'Child ${no}',
                    style: customStyle(9.0, Color.fromRGBO(83, 100, 133, 1),
                        FontWeight.normal),
                  )
                ],
              ),
              Image.asset(
                child_sticker,
                height: 30,
                width: 35,
              )
            ],
          ),
          Text('Aug 2024',
                  style: customStyle(12.0, Colors.black, FontWeight.bold))
              .cPadOnly(t: 5)
        ],
      ).cPadOnly(r: 8, l: 8, t: 5, b: 5),
    );
  }
}

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (logic) {
        return Stack(
          children: [
            SizedBox(
              height: 190,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return SvgPicture.asset(racoBanner);
                },
                onPageChanged: (v){
                  logic.currentPage.value = v;
                  logic.update();
                },
              ),
            ),
            DotsIndicator(
              dotsCount: 4,
              position: logic.currentPage.value,
              decorator: DotsDecorator(
                spacing: EdgeInsets.all(3),
                color: Colors.white, // Inactive dot color
                activeColor: primaryColorPurple,
                // activeSize: const Size.square(12.0), // Size of the active dot
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: primaryColorPurple,width: 0.5)// Border radius of active dot
                ),

              ),
            ).cPosition(b: 10,l: 0,r: 0),
            // AspectRatio(
            //   // aspectRatio: 392 / 200,
            //   aspectRatio: 1.96,
            //   child: CarouselSlider.builder(
            //     itemCount: 4,
            //     // itemCount: logic.bannerListModel?.data?.banners?.length ?? 0,
            //     itemBuilder: (BuildContext context, int index, int realIndex) {
            //       return GestureDetector(
            //           child: SvgPicture.asset(racoBanner));
            //     },
            //     options:
            //     CarouselOptions(
            //       autoPlay: true,
            //       height: context.cWidth,
            //       viewportFraction: 1.0,
            //       enlargeCenterPage: false,
            //     ),
            //
            //   ),
            //   //.cPadSymmetric(h: 0).cPadOnly(t: 8),
            // ).cPadOnly(t: 10),
            // DotsIndicator(
            //   dotsCount: 4,
            //   position: index,
            //   decorator: DotsDecorator(
            //     color: Colors.black87, // Inactive color
            //     activeColor: Colors.redAccent,
            //   ),
            // )
          ],
        ).cPadOnly(t: 4);
      }
    );
  }
}

class BillOverView extends StatelessWidget {
  const BillOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      // height: 135,
      width: context.cWidth,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          // color: Color.fromRGBO(240, 243, 253, 1),
          borderRadius: BorderRadius.circular(15),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Overview of Billing for August 2024',
                  style: customStyle(12.0, Colors.black, FontWeight.bold)),
              Container(
                width: 90,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: primaryColorPurple,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Text('Pay Bill',
                        style: customStyle(
                            13.0, primaryColorPurple, FontWeight.normal))
                    .cToCenter,
              )
            ],
          ),
          SizedBox(height: 8,),
          DottedLine(dashColor: Color.fromRGBO(159, 159, 159, 1),lineThickness: 0.5,),
          SizedBox(height: 8,),
          // Divider(
          //   color: Color.fromRGBO(159, 159, 159, 1),
          //   thickness: 0.5,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Bill Date',
                      style: customStyle(11.0, Colors.black, FontWeight.normal))
                  .cExpanded(1),
              Text('Student Name',
                      style: customStyle(11.0, Colors.black, FontWeight.normal))
                  .cExpanded(1),
              Text('Class',
                      style: customStyle(11.0, Colors.black, FontWeight.normal))
                  .cExpanded(1),
              Text('Amount to pay',
                      style: customStyle(11.0, Colors.black, FontWeight.normal))
                  .cExpanded(1),
            ],
          ),
          SizedBox(height: 5,),
          DottedLine(dashColor: Color.fromRGBO(159, 159, 159, 1),lineThickness: 0.5,),
          SizedBox(height: 5,),
          // Divider(
          //   color: Color.fromRGBO(159, 159, 159, 1),
          //   thickness: 0.5,
          // ),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,i) {
              return Row(
                children: [
                  Text('Aug 2024',
                          style: customStyle(
                              11.0, primaryColorPurple, FontWeight.normal))
                      .cExpanded(1),
                  Text('Sharafas OM',
                          style: customStyle(
                              11.0, primaryColorPurple, FontWeight.normal))
                      .cExpanded(1),
                  Text('10(B)',
                          style: customStyle(
                              11.0, primaryColorPurple, FontWeight.normal))
                      .cExpanded(1),
                  Text('SAR 115.00',
                          style: customStyle(
                              11.0, primaryColorPurple, FontWeight.normal))
                      .cExpanded(1),
                ],
              );
            }
          ),
          SizedBox(height: 8,),
          DottedLine(dashColor: Color.fromRGBO(159, 159, 159, 1),lineThickness: 0.5,),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('SAR 345.00',
                  style: customStyle(
                      11.0, primaryColorPurple, FontWeight.normal))
          ],).cPadOnly(r: 24)
          // Row(
          //   children: [
          //     Image.asset(invoice_inquiry),
          //     SizedBox(
          //       width: 5,
          //     ),
          //     Text(
          //         'This invoice is system-generated. For inquiries, please contact us.',
          //         style: customStyle(8.0, Color.fromRGBO(159, 159, 159, 1),
          //             FontWeight.normal)),
          //   ],
          // )
        ],
      ).cPadOnly(l: 10, r: 10, t: 10),
    ).cPadAll(10);
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Main Menu',
          style: customStyle(15.0, Colors.black, FontWeight.normal),
        ).cPadOnly(l: 10),
        Row(
          children: [
            MenuBox(
              text: 'Students',
              img: studentsIcon,
            ).cExpanded(1),
            SizedBox(
              width: 10,
            ),
            MenuBox(
              text: 'Transaction',
              img: transactionIcon,
            ).cExpanded(1),
            SizedBox(
              width: 10,
            ),
            MenuBox(
              text: 'Profile',
              img: profileIcon,
            ).cExpanded(1),
          ],
        ).cPadOnly(l: 10, r: 10, t: 5)
      ],
    );
  }
}

class MenuBox extends StatelessWidget {
  final String text;
  final String img;
  const MenuBox({super.key, required this.text, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 100,
      decoration: BoxDecoration(
          color: Color.fromRGBO(240, 243, 253, 1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black54, width: 0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            img,
            height: 25,
            width: 25,
          ),
          SizedBox(
            width: 2,
          ),
          Text(text,
              style: customStyle(10.0, primaryColorPurple, FontWeight.normal))
        ],
      ).cPadOnly(l: 10, r: 10),
    );
  }
}

class BottomImageList extends StatelessWidget {
  const BottomImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder: (context,i) {
        return Container(
          child: Image.asset(bottomBanner),
        );
      }
    ).cPadOnly(t: 10,b: 10);
  }
}

void dateSelectPopupHome({
  required BuildContext context,
  String id = '',
  var from,
}) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Set the border radius here
        ),
        content: SingleChildScrollView(
          child: GetBuilder<HomeController>(builder: (logic) {
            return SfDateRangePicker(
              confirmText: 'SELECT',
              showNavigationArrow: true,
              onSubmit: (v) {
                if (v is PickerDateRange) {
                  final DateTime? rangeStartDate = v.startDate;
                  final DateTime? rangeEndDate = v.endDate;
                  logic.startMonth=rangeStartDate;
                  logic.endMonth=rangeEndDate;
                  logic.update();
                  print(rangeStartDate);
                  print('//////${logic.startMonth}');
                  print(rangeEndDate);
                }
                Get.back();
              },
              onCancel: () {
                Get.back();
              },
              showActionButtons: true,
              showTodayButton: true,
              view: DateRangePickerView.decade,
              selectionMode: DateRangePickerSelectionMode.range,
            ).cClipAll(10);
          }),
        ),
      );
    },
  );
}






