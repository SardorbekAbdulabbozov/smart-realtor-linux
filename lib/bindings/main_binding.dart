import 'package:get/get.dart';
import 'package:my_home/controllers/admin_controller.dart';
import 'package:my_home/controllers/favourite_controller.dart';
import 'package:my_home/controllers/home_controller.dart';
import 'package:my_home/controllers/main_controller.dart';
import 'package:my_home/controllers/profile_controller.dart';
import 'package:my_home/controllers/search_controller.dart';
import 'package:my_home/controllers/users_controller.dart';
import 'package:my_home/data/local_source/local_source.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(), fenix: true);
    if (LocalSource.getInstance().isAdmin()) {
      Get.lazyPut(() => AdminController(), fenix: true);
      Get.lazyPut(() => UsersController(), fenix: true);
    }
    if (!LocalSource.getInstance().isAdmin()) {
      Get.lazyPut(() => SearchController(), fenix: true);
      Get.lazyPut(() => FavouriteController(), fenix: true);
    }
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
