import 'package:get/get.dart';
import 'package:my_home/models/product/product_list_response.dart';

import 'base/base_controller.dart';

class ProductController extends BaseController {
  Results? product;
  int imageIndex = 0;
  bool isFavourite = false;

  @override
  void onInit() {
    super.onInit();
    Get.arguments != null ? product = Get.arguments : null;
    isFavourite = hive.productsBox.containsKey(product?.objectId ?? '');
    update();
  }

  void changeImageIndex(int index) {
    imageIndex = index;
    update();
  }

  Future<void> toggleFavouriteButton() async {
    if (hive.productsBox.containsKey(product?.objectId ?? '')) {
      isFavourite = false;
      await hive.deleteFromFavourites(product?.objectId ?? '');
    } else {
      if (product != null) {
        isFavourite = true;
        await hive.addToFavourites(product!);
      }
    }
    update();
  }
}
