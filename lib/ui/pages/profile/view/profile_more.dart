import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/profile/bind/profile_bind.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileImagePart extends StatelessWidget {
  const ProfileImagePart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (logic) {
      return Container(
        height: 200,
        width: context.cWidth,
        color: const Color.fromRGBO(242, 250, 251, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.network(logic.profileModel?.data?.img ?? ''),
                ),
                Positioned(
                  right: 1,
                  bottom: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(1, 1),
                            blurRadius: 4,
                          ),
                        ]),
                    height: 26,
                    width: 26,
                    child: SvgPicture.asset(
                      cam,
                      fit: BoxFit.fill,
                    ).cPadAll(7),
                  ).cPadOnly(t: 4),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 140,
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    logic.profileModel?.data?.name ?? '',
                    style: customStyle(20.0, Colors.black, FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    logic.profileModel?.data?.address ?? '',
                    style: customStyle(12.0, Colors.black87, FontWeight.normal),
                  ),
                ),
                // Container(
                //   height: 30,
                //   width: 100,
                //   decoration: BoxDecoration(
                //       border: Border.all(color: Colors.grey, width: 0.5),
                //       borderRadius: BorderRadius.circular(7)),
                //   child: Text(
                //     'Edit profile',
                //     style: customStyle(13.0, Colors.black87, FontWeight.bold),
                //   ).cToCenter,
                // ).cPadOnly(t: 15)
              ],
            )
          ],
        ),
      );
    });
  }
}

class ListTilePart extends StatelessWidget {
  const ListTilePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileItemProfile(
          name: 'Invoice',
          icon: transactionIcon,
          onTap: () {
            Get.toNamed(Routes.invoice);
          },
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'Children',
          icon: studentsIcon,
          onTap: () {
            Get.toNamed(Routes.children);
          },
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'Coupon',
          icon: coupon_fill_icon,
          onTap: () {
            Get.toNamed(Routes.coupon);
          },
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'Help&Support',
          icon: contactUs,
          onTap: () {
            Get.toNamed(Routes.helpAndSupport);
          },
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'About Us',
          icon: aboutUs,
          onTap: () {
            Get.toNamed(Routes.aboutUs);
          },
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'Privacy Policy',
          icon: privacyPolicy,
          onTap: () {
            Get.toNamed(Routes.privacyPolicy);
          },
        ).cPadSymmetric(h: 8),
      ],
    ).cPadOnly(t: 20, l: 15);
  }
}

class ListTileItemProfile extends StatelessWidget {
  var icon;
  var name;
  final Function onTap;
  final Color textColor;

  ListTileItemProfile({
    super.key,
    required this.icon,
    required this.name,
    required this.onTap,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -3),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      leading: SvgPicture.asset(
        icon,
        width: 20,
        height: 20,
      ),
      title: Text(
        name,
        style: TextStyle(
            fontSize: 13, color: textColor, fontWeight: FontWeight.normal),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: () => onTap(),
    ).cPadOnly(b: 10, r: 10);
  }
}

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (logic) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address',
            style: customStyle(16.0, Colors.black, FontWeight.normal),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                addressIcon,
                width: 25,
                height: 25,
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        logic.profileModel?.data?.name ?? '',
                        style: customStyle(16.0, Colors.black, FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(logic.profileModel?.data?.phone ?? '',
                          style: customStyle(
                              12.0, Colors.black54, FontWeight.normal)),
                    ],
                  ),
                  Text(logic.profileModel?.data?.address ?? '',
                      style:
                          customStyle(12.0, Colors.black54, FontWeight.normal))
                ],
              ),
            ],
          ).cPadOnly(t: 10, l: 10)
        ],
      ).cPadOnly(l: 20, t: 10);
    });
  }
}
