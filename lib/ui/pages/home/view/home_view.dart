import 'package:cached_network_image/cached_network_image.dart';
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/home/bind/home_bind.dart';
import 'package:cluster_arabia/ui/pages/home/view/home_more.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController.to.context = context;
    return GetBuilder<HomeController>(builder: (logic) {
      return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: primaryColorPurple,
          elevation: 0,
          leading: IconButton(
            icon: CircleAvatar(
              radius: 40, // Image radius
              backgroundImage:
                  NetworkImage(logic.profileModel?.data?.img ?? ''),
            ),
            onPressed: () {
              HomeStackDashboardController.to.scaffoldKey.currentState
                  ?.openDrawer();
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                logic.profileModel?.data?.name ?? '',
                style: customStyle(20.0, Colors.white, FontWeight.bold),
              ),
              Text(
                logic.profileModel?.data?.email ?? '',
                style: customStyle(9.0, Colors.white, FontWeight.normal),
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                dateSelectPopupHome(context: context);
              },
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(113, 99, 198, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      (logic.startMonth == null)
                          ? 'Select Date '
                          : '${(logic.startMonth)?.cGetFormattedDate(format: 'MMM yyyy')}',
                      style: customStyle(10.0, Colors.white, FontWeight.normal),
                    ),
                    // Text('August 2024',style: customStyle(10.0, Colors.white, FontWeight.normal),),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                ),
              ).cPadOnly(r: 10),
            )
          ],
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        // drawer: const HomeDrawer(),
        // key: HomeController.to.scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FirstPart(),
              BannerSection(),
              BillOverView().cVisible(
                  (logic.homeBillAmount?.data?.monthlyCharge ?? []).isNotEmpty),
              MainMenu(),
              BottomImageList()
            ],
          ),
        ),
      );
    });
  }
}
