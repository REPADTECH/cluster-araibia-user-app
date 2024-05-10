import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

AppBar  commonAppBarBack(String titleName, var bColor,  VoidCallback? onTap) {
  return AppBar(
    backgroundColor: bColor,
    elevation: 0,
    titleSpacing: 0,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        HomeStackDashboardController.to.changeTabIndex(0);
        Get.back();
      },
      child: const Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.white,
      ),
    ),
    title: Text(
      titleName,
      style: customStyle(
        18.0,
        Colors.white,
        FontWeight.bold,
      ),
    ),
    actions: [
      InkWell(
        onTap: onTap,
          child: SvgPicture.asset(clearUpdateIcon,height: 20,width: 20,).cPadOnly(r: 15)),
    ],
  );
}

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onClear;
  final String buttonTitle;
  final TextStyle? titleStyle;
  final bool showIcon;
  final bool showClear;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color borderColor;
  final Color? backgroundColor;
  final double radius;
  final double vPadding;
  final double width;

  const CustomButtonWidget({
    super.key,
    this.onTap,
    this.onClear,
    this.buttonTitle = 'Click Here', // Corrected typo
    this.radius = 5,
    this.vPadding = 10,
    this.width = 100,
    this.titleStyle = const TextStyle(
        color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.normal),
    this.showIcon = false,
    this.showClear = false,
    this.icon = Icons.print,
    this.iconSize = 25,
    this.iconColor = Colors.white,
    this.borderColor = Colors.white,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: vPadding),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(radius),border: Border.all(color:borderColor, )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: Wrap(
              alignment: WrapAlignment
                  .center, // Aligns the children in the center like MainAxisAlignment.center in Row
              crossAxisAlignment: WrapCrossAlignment
                  .center, // Aligns children in the cross axis in the center
              spacing:
              0, // Adjust if you want any horizontal space between the children
              runSpacing:
              0, // Adjust if you want any vertical space between the lines
              children: [
                Text(
                  buttonTitle,
                  style: titleStyle,
                ),
                if (showIcon)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      icon,
                      size: iconSize,
                      color: iconColor,
                    ),
                  ),
              ],
            ),
          ).cExpanded(1),
          if (showClear)
            GestureDetector(
                onTap: onClear,
                child: Icon(icon, size: iconSize, color: iconColor))
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final int? minLines;
  final int? maxLines;
  final double? height;
  void Function()? onTap;
  TextEditingController? controller;
  Widget? suffixIcon;
  TextInputType? textInputType;
  List<TextInputFormatter>? textInputFormatter;
  String hintText;
  String? Function(String?)? validator;
  String? orderid;
  void Function(String)? onChanged; // Add onChanged callback

  CustomTextField({
    Key? key,
    this.minLines = 1,
    this.maxLines = 1,
    this.height = 52,
    this.onTap,
    this.controller,
    this.textInputType,
    this.textInputFormatter,
    this.suffixIcon,
    this.validator,
    this.hintText = '',
    this.orderid,
    this.onChanged, // Initialize the onChanged callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
      ),
      child: TextFormField(
        // minLines: 1,
        // maxLines: 5,
        // maxLength: 500,
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        inputFormatters: textInputFormatter,
        onChanged: onChanged, // Set the onChanged callback here
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 10),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: customStyle(
              15.0, Colors.black.withOpacity(0.4), FontWeight.normal),
        ),
      ).cPadOnly(b: 5),
    );
  }
}

