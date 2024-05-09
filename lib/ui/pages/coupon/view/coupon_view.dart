import 'package:cluster_arabia/res/animation.dart';
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/coupon/bind/coupon_bind.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBarBack('Coupon', primaryColorPurple, () {}),
        body: GetBuilder<CouponController>(
          builder: (logic) {
            return GridView.builder(
                itemCount: 5,
                // itemCount: logic.couponList.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: cGetResGridRatio(
                    context: context,
                    height: (context.cWidth < 700) ? 198 : 280,
                    width: 190,
                  ),
                  crossAxisCount: cGetResCrossCountGrid(
                    context: context,
                    width: 187,
                  ),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (cnxt, index) {
                  return   Container(
                    padding: EdgeInsets.all(5),
                      width: double.maxFinite,
                      // width: (context.cWidth < 700) ? 140 : 160,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow:  [
                            BoxShadow(
                              blurRadius: 6,
                              spreadRadius: 1,
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            )
                            // BoxShadow(
                            //     color: Color.fromRGBO(
                            //         0, 0, 0, 0.15),
                            //     blurRadius: 10)
                          ],
                          borderRadius:
                          BorderRadius.circular(7)),
                      child:
                      // (!(couponList.isScratchedByYou ??
                      //     true))
                      //     ?
                      // Container(
                      //   color: checkDateBeetWeen(
                      //       DateTime.parse(
                      //           '${logic.couponList?[index]?.expDate ?? '10/09/2020'}'),
                      //       DateTime.now())
                      //   // ? Colors.blue[200]
                      //       ? Colors.blue[200]
                      //       : Colors.blue,
                      //   width: 130,
                      //   height: 135,
                      // )
                      //     :
                    Container(
                        width: 130,
                        height: 135,
                        decoration: BoxDecoration(
                            color:
                            // (!checkDateBeetWeen(
                            //     DateTime.parse(
                            //         '${logic.couponList?[index]?.expDate ?? '10/09/2020'}'),
                            //     DateTime.now()))
                            //     ?
                            //     :
                            Colors.white,
                            boxShadow:  [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 1,
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                              )
                            ],
                            borderRadius:
                            BorderRadius.circular(7)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 180,
                                // color: Colors.green,
                                child: Align(
                                  child:
                                  Lottie.asset(
                                    couponLottie,
                                    height: 100,
                                  ),
                                )
                                    // .cVisible(!checkDateBeetWeen(
                                    // DateTime.parse(
                                    //     '${logic.couponList?[index]?.expDate ?? '10/09/2020'}'),
                                    // DateTime.now())),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Text('You\'ve won',style: customStyle(13.0, Colors.black, FontWeight.normal),)
                                      .cPadOnly(t: 18),
                                  Text('10'.cToCurrencyIND,
                                    // '${'qrText'.tr}: ${textToCopy}',
                                    style: TextStyle(
                                        fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
                                  ).cPadOnly(t: 3),
                                  Container(
                                    padding:
                                    EdgeInsets.only(
                                        left: 10,
                                        right: 10),
                                    height: 35,
                                    decoration:
                                    BoxDecoration(
                                      // color: Color.fromRGBO(242, 250, 251, 1)
                                      color: Colors.grey.shade400
                                          .withOpacity(
                                          0.4),
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          10.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: 90,
                                            child: Text('h67ui9kjg9',
                                              // '${couponList.couponCode}',
                                              style: TextStyle(
                                                  fontSize:
                                                  15,color: Colors.black87),
                                            )
                                          // .cPadOnly(
                                          // l: 10),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            logic.copyToClipboard(
                                                'Helooo...');
                                                // '${couponList.couponCode}');
                                          },
                                          child: Icon(
                                            Icons.copy,
                                            size: 20,
                                            color: Colors.black87,
                                          ),
                                        )
                                        // .cPadOnly(r: 10)
                                      ],
                                    ),
                                  ).cPadOnly(
                                      t: 7, l: 8, r: 8),
                                ],
                              ),
                            )
                          ],
                        ),
                      )).cClipAll(7);
                }).cPadAll(10);
          }
        ));
  }
}
