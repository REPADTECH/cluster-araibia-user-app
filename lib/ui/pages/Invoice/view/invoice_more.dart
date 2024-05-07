import 'dart:convert';

import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/Invoice/bind/invoice_bind.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:cluster_arabia/models/student_list_model.dart' as student;

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(builder: (logic) {
      return Row(
        children: [
          Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Image.network(
                    logic.profileModel?.data?.img??'',
                    width: 25,
                    height: 25,
                  ).cPadOnly(l: 5),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 150,
                    child: DropdownSearch<student.DataList>(
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
                        disabledItemFn: (student.DataList s) => (s.gender??'').startsWith('I'),
                      ),
                      items: logic.studentModelList?.data?.dataList??[],
                      enabled: true,
                      onChanged: ( value) {
                        logic.invoiceList.clear();
                        logic.billFilterdStudentChoosed=value;
                        logic.filterChoosed=value?.id??'';
                        logic.getInvoiceList();
                      },
                      selectedItem:  logic.studentModelList?.data?.dataList?.cFirst  ,
                    ),
                  ),
                ],
              )),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              dateSelectPopup(context: context);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              height: 40,
              // width: 120,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                (logic.startMonth == null && logic.endMonth == null)
                    ? 'Select Date Range'
                    : '${(logic.startMonth)?.cGetFormattedDate(format: 'MM/yyyy')} — ${(logic.endMonth == null) ? (logic.startMonth)?.cGetFormattedDate(format: 'MM/yyyy') : (logic.endMonth)?.cGetFormattedDate(format: 'MM/yyyy')}',
                style: customStyle(12.0, Colors.black, FontWeight.normal),
              ).cToCenter,
            ),
          )
          // Column(
          //   children: [
          //     InkWell(
          //       onTap: (){
          //         showMonthPicker(context: context, isStartMonth: true);
          //       },
          //       child: Container(
          //       height: 20,
          //       width: 120,
          //       decoration: BoxDecoration(
          //           border: Border.all(color: Colors.black, width: 0.5),
          //           borderRadius: BorderRadius.circular(5)),
          //         child:
          //         Text(
          //             (logic.startMonth!=null)? '${logic.startMonth}':'Start date').cPadOnly(l: 20).cToCenter ,
          //         // Text("Select Start Month") ,
          //       ),
          //     ),
          //     InkWell(
          //       onTap: (){
          //         showMonthPicker(context: context, isStartMonth: false);
          //       },
          //       child: Container(
          //         height: 20,
          //         width: 120,
          //         decoration: BoxDecoration(
          //             border: Border.all(color: Colors.black, width: 0.5),
          //             borderRadius: BorderRadius.circular(5)),
          //         child:
          //         Text((logic.endMonth!=null)?'${logic.endMonth}':'End date').cPadOnly(l: 20).cToCenter,
          //         // Text("Select End Month"),
          //       ).cPadOnly(t: 3),
          //     ),            ],
          // ),

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

void dateSelectPopup({
  required BuildContext context,
  String id = '',
  var from,
}) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Set the border radius here
        ),
        content: SingleChildScrollView(
          child: GetBuilder<InvoiceController>(builder: (logic) {
            return Container(
              height: 300,
              width: context.cWidth / 2,
              child: SfDateRangePicker(
                confirmText: 'SELECT',
                showNavigationArrow: true,
                onSubmit: (v) {
                  if (v is PickerDateRange) {
                    final DateTime? rangeStartDate = v.startDate;
                    final DateTime? rangeEndDate = v.endDate;
                    logic.startMonth = rangeStartDate;
                    logic.endMonth = rangeEndDate;
                    logic.endDatePass=rangeEndDate.toString().cGetFormattedDate(format: 'yyyy-MM-dd');
                    logic.startDatePass=rangeStartDate.toString().cGetFormattedDate(format: 'yyyy-MM-dd');
                    logic.update();
                    logic.invoiceList.clear();
                    logic.getInvoiceList();

                    print(rangeStartDate);
                    print('//////${logic.startMonth}');
                    print(rangeEndDate);
                  }
                  Get.back();
                },
                onCancel: () {
                  Get.back();
                },
                showActionButtons: true,
                showTodayButton: true,
                view: DateRangePickerView.decade,
                selectionMode: DateRangePickerSelectionMode.range,
              ).cClipAll(10),
            );
          }),
        ),
      );
    },
  );
}

class ListPart extends StatelessWidget {
  const ListPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(builder: (logic) {
      return Expanded(
        child: ListView.builder(
            itemCount: logic.invoiceList?.length ?? 0,
            shrinkWrap: true,
            controller: logic.scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              var data = logic.invoiceList?[i];
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
                            Text((data?.billedOn ?? '')
                                .cGetFormattedDate(format: 'MMM yyyy'))
                          ],
                        ),
                        Container(
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                              color: ((data?.paidOn ?? '').isEmpty)
                                  ? Color.fromRGBO(255, 243, 235, 1)
                                  : Color.fromRGBO(221, 252, 243, 1),
                              border: Border.all(
                                  color: ((data?.paidOn ?? '').isEmpty)
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
                                    color: ((data?.paidOn ?? '').isEmpty)
                                        ? Color.fromRGBO(249, 122, 30, 1)
                                        : Color.fromRGBO(33, 196, 141, 1),
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                ((data?.paidOn ?? '').isEmpty)
                                    ? 'Open'
                                    : 'Paid',
                                style: customStyle(
                                    13.0,
                                    ((data?.paidOn ?? '').isEmpty)
                                        ? Color.fromRGBO(249, 122, 30, 1)
                                        : Color.fromRGBO(33, 196, 141, 1),
                                    FontWeight.normal),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Invoice no ${data?.id ?? ''}'),
                        Text(
                          'SAR ${(double.parse('${data?.amount ?? 0}') + double.parse('${data?.tax ?? 0}')) / 100}',
                          style:
                              customStyle(12.0, Colors.black, FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const DottedLine(
                      dashGapLength: 6,
                      lineThickness: 0.5,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.network(
                          data?.img ?? '',
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(data?.student?.name ?? '',
                            style: customStyle(
                                13.0, Colors.black, FontWeight.bold)),
                        Text(
                            '(${data?.student?.std ?? ''} ${data?.student?.division ?? ''})',
                            style: customStyle(
                                13.0,
                                Color.fromRGBO(99, 99, 99, 1),
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
                        Text(data?.school?.name ?? '',
                            style: customStyle(
                                12.0, Colors.black, FontWeight.normal)),
                        Text(' (${data?.school?.id ?? ''})',
                            style: customStyle(
                                12.0,
                                Color.fromRGBO(99, 99, 99, 1),
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
                            Text(
                                data?.student?.busInRoute?.routeInfo
                                        ?.routeName ??
                                    '',
                                style: customStyle(
                                    11.0, Colors.black, FontWeight.normal)),
                            Text(
                                ' (${data?.student?.busInRoute?.routeInfo?.startingPoint ?? ''})',
                                style: customStyle(
                                    11.0,
                                    Color.fromRGBO(99, 99, 99, 1),
                                    FontWeight.normal)),
                          ],
                        ).cPadOnly(t: 5),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: CustomButtonWidget(
                                backgroundColor: Colors.white,
                                borderColor: primaryColorPurple,
                                vPadding: 4,
                                width: (context.cWidth >= 800) ? 80 : 60,
                                buttonTitle: 'View Bill',
                                titleStyle: customStyle(
                                    10.0, primaryColorPurple, FontWeight.bold),
                              ),
                            ),
                            if (i == 0)
                              InkWell(
                                onTap: () {},
                                child: CustomButtonWidget(
                                  backgroundColor: primaryColorPurple,
                                  vPadding: 4,
                                  width: (context.cWidth >= 800) ? 60 : 45,
                                  buttonTitle: 'Pay',
                                  titleStyle: customStyle(
                                      10.0, Colors.white, FontWeight.bold),
                                ).cPadOnly(l: 7),
                              ),
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
            }),
      );
    });
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
    helpText: isStartMonth ? 'SELECT START MONTH' : 'SELECT END MONTH',
    // Can change the help text accordingly
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
    final DateTime selectedMonth =
        DateTime(picked.year, picked.month, picked.day);
    // final DateTime selectedMonth = DateTime(picked.year, picked.month);
    if (isStartMonth) {
      InvoiceController.to.setStartMonth(selectedMonth);
    } else {
      InvoiceController.to.setEndMonth(selectedMonth);
    }
  }
}
