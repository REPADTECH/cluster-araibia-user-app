import 'package:cluster_arabia/ui/pages/Invoice/bind/invoice_bind.dart';
import 'package:cluster_arabia/ui/pages/Invoice/view/invoice_view.dart';
import 'package:cluster_arabia/ui/pages/children/bind/children_bind.dart';
import 'package:cluster_arabia/ui/pages/children/view/children_view.dart';
import 'package:cluster_arabia/ui/pages/home/bind/home_bind.dart';
import 'package:cluster_arabia/ui/pages/home/view/home_view.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/view/home_stack_dashborad_view.dart';
import 'package:cluster_arabia/ui/pages/login/bind/login_bind.dart';
import 'package:cluster_arabia/ui/pages/login/view/login_view.dart';
import 'package:cluster_arabia/ui/pages/profile/bind/profile_bind.dart';
import 'package:cluster_arabia/ui/pages/profile/view/profile_view.dart';
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
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.homeStackDashboard,
      page: () => const HomeStackDashboard(),
      binding: HomeStackDashboardBinding(),
    ),
    GetPage(
      name: Routes.invoice,
      page: () => const InvoicePage(),
      binding: InvoiceBinding(),
    ),
    GetPage(
      name: Routes.children,
      page: () => const ChildrenView(),
      binding: ChildrenBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}