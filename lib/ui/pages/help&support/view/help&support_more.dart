import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 158,
      width: context.cWidth,
      decoration:
      BoxDecoration(color: primaryColorPurple),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.contactUs);
                },
                child: Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blue),
                      borderRadius:
                      BorderRadius.circular(
                          4)),
                  child: Center(
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12),
                      )),
                ),
              )
            ],
          ).cPadOnly(r: 10,l: 10,t: 10),

          Text(
            'How can we help you today?',
            style: customStyle(24.0, Colors.white, FontWeight.bold),
          ).cPadOnly(t: 15, b: 18),
          Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 245, 245, 1),
                borderRadius: BorderRadius.circular(23)),
            child: TextFormField(
                // validator: validator,
                // controller: controller,
                // keyboardType: textInputType,
                // inputFormatters: textInputFormatter,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 8),
                    border: InputBorder.none,
                    hintText: 'search'.tr,
                    suffixIcon: const Icon(
                      Icons.search_sharp,
                      color: Colors.grey,
                    ),
                    hintStyle: customStyle(
                        15.0, Colors.black.withOpacity(0.82), FontWeight.normal))),
          ).cPadOnly(b: 5).cPadSymmetric(h: 14)

        ],
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  const BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'issueRelated'.tr,
          style: customStyle(
            16.0,
            const Color.fromRGBO(76, 76, 76, 1),
            FontWeight.bold,
          ),
        ).cPadOnly(t: 15, b: 5),
        const Divider(),
        const IssueRelated()
      ],
    ).cPadOnly(l: 20, t: 15, r: 10);
  }
}

class IssueRelated extends StatelessWidget {
  const IssueRelated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        ExpansionTileCard(
          initialElevation: 0.0,
          elevation: 0.0,
          title: Text(
            'issue',
            style: customStyle(15.0, Colors.black, FontWeight.w600),
          ).cPadOnly(r: 5,l: 5),
          children: [
            Text(
              'solution',
              softWrap: true,
              style: customStyle(
                12.0,
                Colors.black,
                FontWeight.normal,
              ),
            ).cPadOnly(l: 10, r: 10,b: 5,t: 5),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
    // );
  }
}

