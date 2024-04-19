import 'package:cluster_arabia/utilities/app_pages.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:cluster_arabia/utilities/com_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return
    //   GetBuilder<AppController>(
    //   init: AppController(),
    //   initState: (_) {},
    //   builder: (logic) {
        return GetMaterialApp(
          title: 'The Reward',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splash,
          // translations: LocaleString(),
          // locale: const Locale('en', 'US'),
          defaultTransition: Transition.noTransition,
          initialBinding: ComBinding(),
          theme: ThemeData(
            textTheme: TextTheme(
              displayLarge: GoogleFonts.rubik(),
              displayMedium: GoogleFonts.rubik(),
              displaySmall: GoogleFonts.rubik(),
              headlineMedium: GoogleFonts.rubik(),
              headlineSmall: GoogleFonts.rubik(),
              titleLarge: GoogleFonts.rubik(),
              bodyLarge: GoogleFonts.rubik(),
              bodyMedium: GoogleFonts.rubik(),
              labelLarge: GoogleFonts.rubik(),
              bodySmall: GoogleFonts.rubik(),
            ),
          ),
          builder: EasyLoading.init(
            builder: (context, child) {
              EasyLoading.init();
              return MediaQuery(
                  data: mQuery(context).copyWith(
                    textScaleFactor: context.cIsTablet ? 1.1 : 0.9,
                  ),
                  child:
                  // (logic.isConnection.value)
                  //     ?
                  child ?? const Text('error')
                      // : const InternetConnection()
              );
            },
          ),
          getPages: AppPages.pages,
        );
    //   },
    // );
  }
}


