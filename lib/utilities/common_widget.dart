import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

AppBar  commonAppBarBack(String titleName, var bColor) {
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
      SvgPicture.asset(clearUpdateIcon,height: 20,width: 20,).cPadOnly(r: 15),
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

void dateRangePickerDialog(BuildContext context,
    {required void Function()? onTapCancel,
      required void Function()? onTapConfirm,
      DateTime? maxDate,
      bool? isForward = false,
      DateTime? minDate,
      DateRange? initialDateRange,
      DateTime? initialDisplayedDate,
      required void Function(DateRange?) onDateRangeChanged}) {
  showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          buttonPadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Divider().cPadZero,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: onTapCancel,
                        child: Text('Cancel',
                            style: customStyle(
                                14.0, Colors.blue, FontWeight.normal))),
                    TextButton(
                        onPressed: onTapConfirm,
                        child: Text('Confirm',
                            style: customStyle(
                                14.0, Colors.blue, FontWeight.normal))),
                  ],
                ).cPadOnly(r: 15, b: 10, t: 0),
              ],
            ),
          ],
          content: DateRangePickerWidget(
            height: 250,
            doubleMonth: false,
            minimumDateRangeLength: 2,
            initialDateRange: initialDateRange,
            maxDate: maxDate,
            minDate: minDate,
            initialDisplayedDate: initialDisplayedDate,
            onDateRangeChanged: onDateRangeChanged,
            theme: CalendarTheme(
              quickDateRangeTextStyle: TextStyle(fontSize: 11),
              selectedColor: primaryColorPurple,
              dayNameTextStyle:
              customStyle(10.0, Colors.black45, FontWeight.normal),
              inRangeColor: primaryColorPurple,
              inRangeTextStyle:
              customStyle(10.0, Colors.white, FontWeight.normal),
              selectedTextStyle:
              customStyle(9.0, Colors.white, FontWeight.bold),
              todayTextStyle: customStyle(10.0, Colors.blue, FontWeight.bold),
              defaultTextStyle:
              customStyle(9.0, Colors.black, FontWeight.normal),
              radius: 5,
              tileSize: 20,
              disabledTextStyle: const TextStyle(color: Colors.grey),
            ),
            quickDateRanges: (isForward ?? false)
                ? [
              QuickDateRange(dateRange: null, label: "Remove date range"),
              QuickDateRange(
                label: 'next 3 days',
                dateRange: DateRange(
                  DateTime.now(),
                  DateTime.now().add(const Duration(days: 3)),
                ),
              ),
              QuickDateRange(
                label: 'next 7 days',
                dateRange: DateRange(
                  DateTime.now(),
                  DateTime.now().add(const Duration(days: 7)),
                ),
              ),
              QuickDateRange(
                label: 'next 30 days',
                dateRange: DateRange(
                  DateTime.now(),
                  DateTime.now().add(const Duration(days: 30)),
                ),
              ),
              QuickDateRange(
                label: 'next 90 days',
                dateRange: DateRange(
                  DateTime.now(),
                  DateTime.now().add(const Duration(days: 90)),
                ),
              ),
              QuickDateRange(
                label: 'next 180 days',
                dateRange: DateRange(
                  DateTime.now(),
                  DateTime.now().add(const Duration(days: 180)),
                ),
              ),
            ]
                : [
              QuickDateRange(dateRange: null, label: "Remove date range"),
              QuickDateRange(
                label: 'Last 3 days',
                dateRange: DateRange(
                  DateTime.now().subtract(const Duration(days: 3)),
                  DateTime.now(),
                ),
              ),
              QuickDateRange(
                label: 'Last 7 days',
                dateRange: DateRange(
                  DateTime.now().subtract(const Duration(days: 7)),
                  DateTime.now(),
                ),
              ),
              QuickDateRange(
                label: 'Last 30 days',
                dateRange: DateRange(
                  DateTime.now().subtract(const Duration(days: 30)),
                  DateTime.now(),
                ),
              ),
              QuickDateRange(
                label: 'Last 90 days',
                dateRange: DateRange(
                  DateTime.now().subtract(const Duration(days: 90)),
                  DateTime.now(),
                ),
              ),
              QuickDateRange(
                label: 'Last 180 days',
                dateRange: DateRange(
                  DateTime.now().subtract(const Duration(days: 180)),
                  DateTime.now(),
                ),
              ),
            ],
          ),
        );
      });
}
