import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_custom_utils/util/widget_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(65, 54, 133, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 500,
                  width: context.cWidth,
                  color: Colors.white,
                  child: Stack(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        racoLogo,
                        width: 140,
                      ).cPadOnly(b: 100).cAlignment(Alignment.center),
                      AspectRatio(
                        aspectRatio: 591 / 248,
                        child: SvgPicture.asset(
                          loginArchShape,
                          width: double.maxFinite,
                          height: (double.maxFinite) - 343,
                        ),
                      ).cAlignment(Alignment.bottomCenter),
                      Text(
                        'Welcome',
                        style: customStyle(30.0, Colors.white, FontWeight.bold),
                      ).cAlignment(Alignment.bottomCenter).cPadOnly(b: 20),
                    ],
                  ),
                ),
                Text(
                  'The perfect solution in Saudi Arabia for\n Effortless Mobility and Seamless Journeys.',
                  style: customStyle(12.0, Color.fromRGBO(255, 255, 255, 0.8), FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 0.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Image.asset(
                          contactNoImg,
                          height: 20,
                          width: 20,
                        ).cToCenter,
                      ).cPadOnly(l: 5),
                      Text('Mobile Number', style: customStyle(15.0, Colors.white, FontWeight.normal),).cPadOnly(l: 10)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text('Login',
                          style: customStyle(
                              15.0, primaryColorPurple, FontWeight.bold))
                      .cToCenter,
                ),
                // SvgPicture.asset(racoLogo,width:130,height: 130,).cToCenter,
                // Stack(
                //   children: [
                //     SvgPicture.asset(loginArchShape,
                //     ).cToCenter,
                //   ],
                // ).cPadOnly(t: 229),
              ],
            ),
            Text('Powered By REPADTECH PRIVATE LIMITED',
                    style: customStyle(9.0, Colors.white, FontWeight.normal))
                .cPadOnly(b: 10)
          ],
        ));
  }
}
