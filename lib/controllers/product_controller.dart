import 'package:get/get.dart';
import 'package:my_home/models/product/product_list_response.dart';

import 'base/base_controller.dart';

class ProductController extends BaseController {
  Results? product;
  int imageIndex = 0;

  @override
  void onInit() {
    super.onInit();
    Get.arguments != null ? product = Get.arguments : null;
    update();
  }

  void changeImageIndex(int index) {
    imageIndex = index;
    update();
  }
}
