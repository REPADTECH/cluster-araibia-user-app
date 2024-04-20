import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/login/bind/login_bind.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_custom_utils/util/widget_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(65, 54, 133, 1),
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: GetBuilder<LoginController>(
            builder: (logic) {
              return Form(
                key: logic.loginPageView,
                child: SizedBox(
                  width: context.cWidth,
                  height: context.cHeight,
                  child: Column(
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
                            height: 25,
                          ),
                          if(logic.otpDesign.value==true)
                            Column(
                              children:[
                            Container(
                            width: 250,
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
                                InkWell(
                                  onTap: () {
                                    if (WidgetsBinding.instance.window
                                        .viewInsets.bottom >
                                        0.0) {
                                      // Keyboard is visible.
                                      logic.keyBoardIsVisible.value =
                                      true;
                                      cLog('KEYBOARD Visible');
                                      logic.update();
                                    } else {
                                      logic.keyBoardIsVisible.value =
                                      false;
                                      logic.update();
                                      cLog('KEYBOARD UNVisible');
                                      // Keyboard is not visible.
                                    }
                                  },
                                  child: SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                        style: customStyle(18.0,
                                            Colors.white,
                                            FontWeight.normal),
                                        onChanged: (v) {
                                          // logic.validateMobileNumbers(v);
                                          logic.loginPageView.currentState?.validate();
                                        },
                                        controller:
                                        LoginController.to.mob,
                                        validator: (text) =>logic.validateMobileNumbers(text!),
                                        keyboardType:
                                        TextInputType.number,
                                        maxLength: 14,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .allow(RegExp(
                                              r'[0-9]')),
                                        ],
                                        decoration: InputDecoration(
                                            counterText: '',
                                            border:
                                            InputBorder.none,
                                            contentPadding:
                                            const EdgeInsets
                                                .only(
                                                bottom: 10),
                                            hintText:
                                            'Mobile Number',
                                            hintStyle:
                                            customStyle(
                                                15.0,
                                                Colors.white,
                                                FontWeight
                                                    .normal))).cPadOnly(l: 10),
                                  ),
                                )
                              ],
                            ),
                          ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    // logic.validator: (text) => validateMobileNumber(text!),
                                    Text(
                                      '${logic.errorMessage}',
                                      style: customStyle(12.0, Colors.red, FontWeight.normal),
                                    ).cPadOnly(t: 4,r: 10),
                                  ],
                                ).cVisible((logic.validatorNumber.value)),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: (){
                                logic.otpDesign.value=!logic.otpDesign.value;
                                logic.update();
                              },
                              child: Container(
                                width: 250,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('Login',
                                    style: customStyle(
                                        15.0, primaryColorPurple, FontWeight.bold))
                                    .cToCenter,
                              ).cHero('Login button'),
                            ),]),
                          if(logic.otpDesign.value!=true)
                          Column(children:[
                            OTPTextField(
                              length: 4,
                              controller: logic.otpFieldController,
                              width: 250,
                              // width: MediaQuery.of(context).size.width,
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                              spaceBetween: 10,
                              otpFieldStyle: OtpFieldStyle(
                                backgroundColor: Colors.transparent,
                                enabledBorderColor: Colors.white,
                              ),
                              fieldWidth: 50,
                              fieldStyle: FieldStyle.box,
                              outlineBorderRadius: 12,
                              style: const TextStyle(fontSize: 17,color: Colors.white),
                              onCompleted: (pin) {
                                logic.otp.value = pin;
                              },
                            )
                                .cAlignment(Alignment.center).cPadOnly(l: 10, r: 10),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text('Didn\'t received the code +9876543210',
                                        style: const TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 0.6),
                                            fontSize: 12)),
                                    // Directionality(
                                    //   textDirection: TextDirection.ltr,
                                    //   child: Text(' ${logic.dataIsMobileEmail.value}',
                                    //       style: const TextStyle(
                                    //           color: Color.fromRGBO(255, 255, 255, 0.6),
                                    //           fontSize: 14)),
                                    // ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                 logic.otpDesign.value=!logic.otpDesign.value;
                                 logic.update();
                                  },
                                  child: Text(
                                    'Change',
                                    style: defaultUnderLine,
                                    // TextStyle(
                                    //     color: Color.fromRGBO(84, 193, 251, 1),
                                    //     fontSize: 14,),
                                  ),
                                )
                              ],
                            ).cPadOnly(l: 5),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 250,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text('Verify',
                                  style: customStyle(
                                      15.0, primaryColorPurple, FontWeight.bold))
                                  .cToCenter,
                            ).cHero('Login button')
                          ])
                        ],
                      ),
                      Text('Powered By REPADTECH PRIVATE LIMITED',
                              style: customStyle(9.0, Colors.white, FontWeight.normal))
                          .cPadOnly(b: 10)
                    ],
                  ),
                ),
              );
            }
          ),
        ));
  }
}
