import 'package:get/get.dart';
import 'package:my_home/bindings/admin_binding.dart';
import 'package:my_home/bindings/intro_binding.dart';
import 'package:my_home/bindings/login_binding.dart';
import 'package:my_home/bindings/main_binding.dart';
import 'package:my_home/bindings/profile_binding.dart';
import 'package:my_home/bindings/search_binding.dart';
import 'package:my_home/bindings/splash_binding.dart';
import 'package:my_home/core/app_routes/app_route_names.dart';
import 'package:my_home/pages/admin_page.dart';
import 'package:my_home/pages/home_page.dart';
import 'package:my_home/pages/intro_page.dart';
import 'package:my_home/pages/login_page.dart';
import 'package:my_home/pages/main_page.dart';
import 'package:my_home/pages/profile_page.dart';
import 'package:my_home/pages/search_page.dart';
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
      name: AppRouteNames.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRouteNames.PROFILE_OR_USERS,
      page: () => const ProfileUsersPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRouteNames.SEARCH,
      page: () => const SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRouteNames.ADMIN,
      page: () => const AdminPage(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: AppRouteNames.PROFILE_OR_USERS,
      page: () => const ProfileUsersPage(),
      binding: ProfileBinding(),
    ),
  ];
}
