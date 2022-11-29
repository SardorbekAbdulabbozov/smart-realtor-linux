import 'package:get/get.dart';
import 'package:my_home/core/app_routes/app_route_names.dart';

import 'base/base_controller.dart';

class SplashController extends BaseController {
  @override
  void onReady()async {
    super.onReady();
    Future.delayed(
      const Duration(milliseconds: 4000),
      () {
        localSource.hasProfile()
            ? Get.offNamed(AppRouteNames.MAIN)
            : localSource.isIntroShowed()
                ? Get.offNamed(AppRouteNames.LOGIN)
                : Get.offNamed(AppRouteNames.INTRO);
      },
    );
  }
}
