import 'package:get/get.dart';
import 'package:my_home/controllers/favourite_controller.dart';

class FavouriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavouriteController());
  }
}
