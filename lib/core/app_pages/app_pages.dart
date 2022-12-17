import 'package:get/get.dart';
import 'package:my_home/bindings/intro_binding.dart';
import 'package:my_home/bindings/login_binding.dart';
import 'package:my_home/bindings/main_binding.dart';
import 'package:my_home/bindings/product_binding.dart';
import 'package:my_home/bindings/splash_binding.dart';
import 'package:my_home/core/app_routes/app_route_names.dart';
import 'package:my_home/pages/intro_page.dart';
import 'package:my_home/pages/login_page.dart';
import 'package:my_home/pages/main_page.dart';
import 'package:my_home/pages/product_page.dart';
import 'package:my_home/pages/splash_page.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRouteNames.INITIAL,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRouteNames.INTRO,
      page: () => const IntroPage(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: AppRouteNames.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRouteNames.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRouteNames.PRODUCT,
      page: () => const ProductPage(),
      binding: ProductBinding(),
    ),
  ];
}
