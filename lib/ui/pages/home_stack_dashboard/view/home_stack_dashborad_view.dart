import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/Invoice/view/invoice_view.dart';
import 'package:cluster_arabia/ui/pages/home/view/home_more.dart';
import 'package:cluster_arabia/ui/pages/home/view/home_view.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeStackDashboard extends StatelessWidget {
  const HomeStackDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeStackDashboardController>(
      builder: (logic) {
        return Scaffold(
          key: logic.scaffoldKey,
          drawer: const HomeDrawer(),
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: logic.indexedStack.value,
            children: const [
              HomePage(),
              InvoicePage(),
              // CategoriesView(),
              // WishList(),
              // MyAccountPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    // AssetImage(homeBottomIcon),
                   homeIcon,
                    height: 25,
                    width: 25,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    transactionIcon,
                    height: 25,
                    width: 25,
                  ),
                ),
                label: 'Invoice',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                 studentsIcon,
                    height: 25,
                    width: 25,
                  ),
                ),
                label: 'Children',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    profileIcon,
                    height: 25,
                    width: 25,
                  ),
                ),
                label: 'Profile',
                backgroundColor: Colors.white,
              ),
            ],
            elevation: 5,
            currentIndex: logic.tabIndex.value,
            selectedItemColor: primaryColorPurple,
            unselectedItemColor: const Color.fromRGBO(126, 126, 126, 1),
            selectedLabelStyle: customStyle(
              11.0,
              const Color.fromRGBO(0, 38, 89, 1),
              FontWeight.normal,
            ),
            unselectedLabelStyle: customStyle(
              11.0,
              const Color.fromRGBO(126, 126, 126, 1),
              FontWeight.normal,
            ),
            showUnselectedLabels: true,
            onTap: logic.changeTabIndex,
          ),
        );
      }
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeStackDashboardController>(
      builder: (logic) {
        return Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.zero,
            ),
          ),
          backgroundColor: Colors.white,
          child: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                // margin: const EdgeInsets.only(left: 19, right: 20),
                width: 346,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Image.asset(profilePic,height: 45,width: 45,),
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                          Text('Sharafas OM',style: customStyle(20.0, Colors.black, FontWeight.bold)),
                          Text('sharafasom@gmail.com',style: customStyle(12.0, Color.fromRGBO(83, 97, 107, 1), FontWeight.normal)),
                        ],)
                      ],),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Account',style: customStyle(17.0, Color.fromRGBO(83, 97, 107, 1), FontWeight.normal)).cPadOnly(l: 10),
                    const SizedBox(
                      height: 15,
                    ),
                   GestureDetector(
                        onTap: () {
                          Get.back();
                          // Get.toNamed(Routes.toCart);
                        },
                        child: WishListItem(
                          name: 'Profile',
                          icon: profileIcon,
                        ).cPadSymmetric(h: 8),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        // Get.toNamed(Routes.toWishList);
                      },
                      child: WishListItem(
                        name: 'Invoice',
                        icon: transactionIcon,
                      ).cPadSymmetric(h: 8),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        // Get.toNamed(Routes.selectAddressDrawer);
                      },
                      child: WishListItem(
                        name: 'Students',
                        icon: studentsIcon,
                      ).cPadSymmetric(h: 8),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text('Policy',style: customStyle(17.0, Color.fromRGBO(83, 97, 107, 1), FontWeight.normal)).cPadOnly(l: 10),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        // Get.toNamed(Routes.toCart);
                      },
                      child: WishListItem(
                        name: 'Contact Us',
                        icon: contactUs,
                      ).cPadSymmetric(h: 8),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        // Get.toNamed(Routes.toWishList);
                      },
                      child: WishListItem(
                        name: 'About Us',
                        icon: aboutUs,
                      ).cPadSymmetric(h: 8),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        // Get.toNamed(Routes.selectAddressDrawer);
                      },
                      child: WishListItem(
                        name: 'Privacy Policy',
                        icon: privacyPolicy,
                      ).cPadSymmetric(h: 8),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text('Other',style: customStyle(17.0, Color.fromRGBO(83, 97, 107, 1), FontWeight.normal)).cPadOnly(l: 10),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: context.cWidth,
                      height: 20,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            signOutIcon,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Text(
                            'Sign out',
                            style: customStyle(
                              15.0,
                              const Color.fromRGBO(238,36,86,1),
                              FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ).cPadSymmetric(h: 8)

                  ],
                ).cPadOnly(l: 15),
              ),
            ),
          ),
        );
      },
    );
  }
}

class WishListItem extends StatelessWidget {
  var icon;
  var name;

  WishListItem({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: context.cWidth,
      height: 20,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 18,
          ),
          Text(
            name,
            style: customStyle(
              15.0,
              const Color.fromRGBO(0, 0, 0, 1),
              FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
