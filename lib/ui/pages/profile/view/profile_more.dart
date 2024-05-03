import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileImagePart extends StatelessWidget {
  const ProfileImagePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: context.cWidth,
      color: Color.fromRGBO(242, 250, 251, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Stack(
          children: [
            Container(
              width: 100,height: 100,
              decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(15)),
              child: Image.asset(man),
            ),
            Positioned(
              right: 1,
              bottom: 1,
              child: Container(
                decoration:  BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
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
          SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('John Doe',style: customStyle(20.0, Colors.black, FontWeight.bold),),
            Text('San Francisco, CA',style: customStyle(12.0, Colors.black87, FontWeight.normal),),
              Container(
                height: 30,width: 100,
                decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 0.5),borderRadius: BorderRadius.circular(7)),
                child: Text('Edit profile',style: customStyle(13.0, Colors.black87, FontWeight.bold),).cToCenter,
              ).cPadOnly(t: 15)
          ],)
      ],),
    );
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
          onTap: () {},
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'Children',
          icon: studentsIcon,
          onTap: () {},
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'Contact Us',
          icon: contactUs,
          onTap: () {},
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'About Us',
          icon: aboutUs,
          onTap: () {},
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'Privacy Policy',
          icon: privacyPolicy,
          onTap: () {},
        ).cPadSymmetric(h: 8),
      ],
    ).cPadOnly(t: 30,l: 15);
  }
}

class ListTileItemProfile extends StatelessWidget {
  var icon;
  var name;
  final Function onTap;
  final Color textColor;

  ListTileItemProfile({
    Key? key,
    required this.icon,
    required this.name,
    required this.onTap,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(vertical: -3),
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
      trailing: Icon(Icons.arrow_forward_ios,size: 15,),
      onTap: () => onTap(),
    ).cPadOnly(b: 15, r: 10);
  }
}

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Address',style: customStyle(16.0, Colors.black, FontWeight.normal),),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Image.asset(addressIcon,width: 25,height: 25,),
        SizedBox(width: 25,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('John Doe',style: customStyle(16.0, Colors.black, FontWeight.bold),),
                SizedBox(width: 8,),
                Text('63 912 345 6789',style: customStyle(12.0, Colors.black54, FontWeight.normal)),
              ],
            ),
            Text('123 Main Street,Apt 5B,Nob Hill,San\nFrancisco,CA 94109',style: customStyle(12.0, Colors.black54, FontWeight.normal))
          ],
        ),
      ],).cPadOnly(t: 10,l: 10)
    ],).cPadOnly(l: 20,t: 20);
  }
}





