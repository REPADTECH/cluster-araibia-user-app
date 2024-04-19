import 'package:cluster_arabia/ui/pages/splash/bind/splash_bind.dart';
import 'package:cluster_arabia/ui/pages/splash/view/spash_view.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}