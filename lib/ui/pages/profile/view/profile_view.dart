import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:cluster_arabia/ui/pages/profile/view/profile_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Color.fromRGBO(242, 250, 251, 1),
      leading: InkWell(
        onTap: (){
          HomeStackDashboardController.to.changeTabIndex(0);
          Get.back();
        },
          child: Icon(Icons.arrow_back_ios,)),
      ),
      body: Column(children: [
        ProfileImagePart(),
        ListTilePart(),
        AddressSection()
      ],),
    );
  }
}
