import 'package:get/get.dart';
import 'package:my_home/controllers/home_controller.dart';
import 'package:my_home/controllers/main_controller.dart';
import 'package:my_home/controllers/profile_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
