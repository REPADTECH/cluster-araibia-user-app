import 'package:cached_network_image/cached_network_image.dart';
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/home/view/home_more.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: primaryColorPurple,
        elevation: 0,
        leading: IconButton(
        icon: CircleAvatar(
        radius: 40, // Image radius
        backgroundImage: AssetImage(profilePic
        ),
      ),
      onPressed: () {
        // NewHomeMainController.to.scaffoldKey.currentState?.openDrawer();
      },
    ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sharafas OM',style: customStyle(20.0, Colors.white, FontWeight.bold),),
            Text('sharafasom@gmail.com',style: customStyle(9.0, Colors.white, FontWeight.normal),),
          ],
        ),
        actions: [
          Container(height: 30,width: 100,decoration: BoxDecoration(color: Color.fromRGBO(113, 99, 198, 1),borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,size: 15,),
                Text('August 2024',style: customStyle(10.0, Colors.white, FontWeight.normal),),
                Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 15,),

              ],
            ),
          ).cPadOnly(r: 10)
        ],
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      // drawer: const HomeDrawer(),
      // key: HomeController.to.scaffoldKey,
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FirstPart(),
            BannerSection(),
            BillOverView(),
            MainMenu(),
            BottomImageList()
          ],
        ),
      ),

    );
  }
}
