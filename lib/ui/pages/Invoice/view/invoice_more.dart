import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/Invoice/bind/invoice_bind.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(builder: (logic) {
      return Row(
        children: [
          Container(
              height: 43,
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Image.asset(profilePic,width: 25,height: 25,).cPadOnly(l: 5),
                  SizedBox(width: 15,),
                  SizedBox(
                    width: 150,
                    child: DropdownSearch(
                      dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                              disabledBorder: InputBorder.none,
                              border: InputBorder.none)),
                      popupProps: PopupProps.menu(
                        // textStyle: customStyle(
                        //   13.0,
                        //   Color.fromRGBO(0, 0, 0, 0.4),
                        //   FontWeight.normal,
                        // ),
                        showSearchBox: true,
                        showSelectedItems: false,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: logic.categoryItems,
                      enabled: true,
                      onChanged: (value) {
                        // logic.chooseCategoryId(value.toString());
                      },
                      selectedItem: logic.categoryValue.value,
                    ),
                  ),
                ],
              )
              ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              InkWell(
                onTap: (){
                  showMonthPicker(context: context, isStartMonth: true);
                },
                child: Container(
                height: 20,
                width: 120,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(5)),
                  child:
                  Text(
                      (logic.startMonth!=null)? '${logic.startMonth}':'Start date').cPadOnly(l: 20).cToCenter ,
                  // Text("Select Start Month") ,
                ),
              ),
              InkWell(
                onTap: (){
                  showMonthPicker(context: context, isStartMonth: false);
                },
                child: Container(
                  height: 20,
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(5)),
                  child:
                  Text((logic.endMonth!=null)?'${logic.endMonth}':'End date').cPadOnly(l: 20).cToCenter,
                  // Text("Select End Month"),
                ).cPadOnly(t: 3),
              ),            ],
          ),

          // InkWell(
          //   onTap: () {
          //     dateRangePickerDialog(context,
          //         isForward: true,
          //         minDate: DateTime.now(),
          //         initialDateRange:
          //         DateRange(DateTime.now(), DateTime.now()),
          //         initialDisplayedDate:
          //         logic.selectedDateRange?.start ??
          //             DateTime.now(), onDateRangeChanged: (v) {
          //           logic.selectedDateRange = v;
          //           logic.startDatePass = v!.start
          //               .cGetFormattedDate(format: 'yyyy-MM-dd');
          //           logic.endDatePass =
          //               v.end.cGetFormattedDate(format: 'yyyy-MM-dd');
          //           logic.update();
          //           print(
          //               'selectedDateRange${logic.selectedDateRange}');
          //         }, onTapCancel: () {
          //           logic.selectedDateRange = null;
          //           logic.startDatePass = '';
          //           logic.endDatePass = '';
          //           logic.update();
          //           Get.back();
          //         }, onTapConfirm: () {
          //           cLog('${logic.startDatePass}-${logic.endDatePass}');
          //           // logic.getCouponList();
          //           Get.back();
          //         });
          //   },
          //   child: Container(
          //     height: 40,
          //     width: 120,
          //     decoration: BoxDecoration(
          //         border: Border.all(color: Colors.black, width: 0.5),
          //         borderRadius: BorderRadius.circular(5)),
          //     child:    Text(
          //       // logic.selectedDateRange == null
          //       ((logic.startDatePass) == '' &&
          //           logic.endDatePass == '')
          //           ? 'Select Date Range'
          //       // : '${logic.selectedDateRange}',
          //           : '${(logic.startDatePass).cGetFormattedDate(format: 'dd/MM/yyyy')} — ${(logic.endDatePass).cGetFormattedDate(format: 'dd/MM/yyyy')}',
          //       style: customStyle(
          //           13.0, Colors.black, FontWeight.bold),
          //     ).cToCenter.cExpanded(1),
          //   ),
          // ),
        ],
      ).cPadOnly(t: 15, l: 15);
    });
  }
}

class ListPart extends StatelessWidget {
  final String month;
  final String invoiceNo;
  final String totalAmt;
  final String studentName;
  final String division;
  final String schoolName;
  final String schoolCode;
  final String routeName;
  final String pickupName;

  const ListPart(
      {super.key,
      required this.month,
      required this.invoiceNo,
      required this.totalAmt,
      required this.studentName,
      required this.division,
      required this.schoolName,
      required this.routeName,
      required this.pickupName,
      required this.schoolCode});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(
      builder: (logic) {
        return ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                // height: 135,
                width: context.cWidth,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  // color: Color.fromRGBO(240, 243, 253, 1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 1,
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                  ],
                  // border: Border.all(color: Colors.black54, width: 0.2),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_filled_rounded,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(month)
                          ],
                        ),
                        Container(
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                              color: (i == 0)
                                  ? Color.fromRGBO(255, 243, 235, 1)
                                  : Color.fromRGBO(221, 252, 243, 1),
                              border: Border.all(
                                  color: (i == 0)
                                      ? Color.fromRGBO(249, 122, 30, 1)
                                      : Color.fromRGBO(33, 196, 141, 1)),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (i == 0)
                                        ? Color.fromRGBO(249, 122, 30, 1)
                                        : Color.fromRGBO(33, 196, 141, 1),
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                (i == 0) ? 'Open' : 'Paid',
                                style: customStyle(
                                    13.0,
                                    (i == 0)
                                        ? Color.fromRGBO(249, 122, 30, 1)
                                        : Color.fromRGBO(33, 196, 141, 1),
                                    FontWeight.normal),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Invoice no ${invoiceNo}'),
                        Text(
                          'SAR ${totalAmt}',
                          style: customStyle(12.0, Colors.black, FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DottedLine(
                      dashGapLength: 6,
                      lineThickness: 0.5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          profilePic,
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(studentName,
                            style:
                                customStyle(13.0, Colors.black, FontWeight.bold)),
                        Text('(${division})',
                            style: customStyle(13.0, Color.fromRGBO(99, 99, 99, 1),
                                FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          schoolcap,
                          height: 12,
                          width: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(schoolName,
                            style:
                                customStyle(12.0, Colors.black, FontWeight.normal)),
                        Text(' (${schoolCode})',
                            style: customStyle(12.0, Color.fromRGBO(99, 99, 99, 1),
                                FontWeight.normal)),
                      ],
                    ).cPadOnly(t: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              routeIcon,
                              height: 12,
                              width: 12,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(routeName,
                                style: customStyle(
                                    11.0, Colors.black, FontWeight.normal)),
                            Text(' (${pickupName})',
                                style: customStyle(
                                    11.0,
                                    Color.fromRGBO(99, 99, 99, 1),
                                    FontWeight.normal)),
                          ],
                        ).cPadOnly(t: 5),
                        Row(
                          children: [
                            CustomButtonWidget(
                              backgroundColor: Colors.white,
                              borderColor: primaryColorPurple,
                              vPadding: 4,
                              width: 60,
                              buttonTitle: 'View Bill',
                              titleStyle: customStyle(
                                  10.0, primaryColorPurple, FontWeight.bold),
                            ),
                            if (i == 0)
                              CustomButtonWidget(
                                backgroundColor: primaryColorPurple,
                                vPadding: 4,
                                width: 40,
                                buttonTitle: 'Pay',
                                titleStyle: customStyle(
                                    10.0, Colors.white, FontWeight.bold),
                              ).cPadOnly(l: 7),
                          ],
                        ),
                      ],
                    ),
                  // SfDateRangePicker(
                  //   view: DateRangePickerView.year,
                  // )

                  ],
                ),
              ).cMargOnly(t: 15, l: 15, r: 15);
            });
      }
    );
  }
}

Future<void> showMonthPicker({
  required BuildContext context,
  // required InvoiceController controller,
  bool isStartMonth = true,
}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    helpText: isStartMonth ? 'SELECT START MONTH' : 'SELECT END MONTH', // Can change the help text accordingly
    fieldLabelText: 'Month',
    fieldHintText: 'Month/Year',
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.blue, // header background color
            onPrimary: Colors.white, // header text color
            onSurface: Colors.black, // body text color
          ),
        ),
        child: child!,
      );
    },
  );

  if (picked != null) {
    final DateTime selectedMonth = DateTime(picked.year, picked.month,picked.day);
    // final DateTime selectedMonth = DateTime(picked.year, picked.month);
    if (isStartMonth) {
      InvoiceController.to.setStartMonth(selectedMonth);
    } else {
      InvoiceController.to.setEndMonth(selectedMonth);
    }
  }
}

