import 'package:get/get.dart';
import 'package:my_home/controllers/admin_controller.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminController());
  }
}
