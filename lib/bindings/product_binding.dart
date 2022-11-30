import 'package:get/get.dart';
import 'package:my_home/controllers/product_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}