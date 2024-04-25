import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return AspectRatio(
      // aspectRatio: 392 / 200,
      aspectRatio: 1.96,
      child: CarouselSlider.builder(
        itemCount: 4,
        // itemCount: logic.bannerListModel?.data?.banners?.length ?? 0,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return GestureDetector(child: SvgPicture.asset(racoBanner));
        },
        options: CarouselOptions(
          autoPlay: true,
          height: context.cWidth,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
        ),
      ),
      //.cPadSymmetric(h: 0).cPadOnly(t: 8),
    ).cPadOnly(t: 10);
  }
}

class BillOverView extends StatelessWidget {
  const BillOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: context.cWidth,
      decoration: BoxDecoration(
          color: Color.fromRGBO(240, 243, 253, 1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black54, width: 0.2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Bill Overview',
                  style: customStyle(14.0, Colors.black, FontWeight.bold)),
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
          Divider(
            color: Color.fromRGBO(159, 159, 159, 1),
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Bill Date',
                      style: customStyle(10.0, Colors.black, FontWeight.normal))
                  .cExpanded(1),
              Text('Vat %',
                      style: customStyle(10.0, Colors.black, FontWeight.normal))
                  .cExpanded(1),
              Text('Vat Amount',
                      style: customStyle(10.0, Colors.black, FontWeight.normal))
                  .cExpanded(1),
              Text('Bill Amount',
                      style: customStyle(10.0, Colors.black, FontWeight.normal))
                  .cExpanded(1),
              Text('Amount to pay',
                      style: customStyle(9.0, Colors.black, FontWeight.normal))
                  .cExpanded(1),
            ],
          ),
          Divider(
            color: Color.fromRGBO(159, 159, 159, 1),
            thickness: 0.5,
          ),
          Row(
            children: [
              Text('Aug 2024',
                      style: customStyle(
                          10.0, primaryColorPurple, FontWeight.normal))
                  .cExpanded(1),
              Text('15.00 %',
                      style: customStyle(
                          10.0, primaryColorPurple, FontWeight.normal))
                  .cExpanded(1),
              Text('SAR 15.00',
                      style: customStyle(
                          10.0, primaryColorPurple, FontWeight.normal))
                  .cExpanded(1),
              Text('SAR 100.00',
                      style: customStyle(
                          10.0, primaryColorPurple, FontWeight.normal))
                  .cExpanded(1),
              Text('SAR 115.00',
                      style: customStyle(
                          10.0, primaryColorPurple, FontWeight.normal))
                  .cExpanded(1),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(invoice_inquiry),
              SizedBox(
                width: 5,
              ),
              Text(
                  'This invoice is system-generated. For inquiries, please contact us.',
                  style: customStyle(8.0, Color.fromRGBO(159, 159, 159, 1),
                      FontWeight.normal)),
            ],
          )
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
          Image.asset(
            img,
            height: 30,
            width: 30,
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
    ).cPadOnly(t: 10);
  }
}
