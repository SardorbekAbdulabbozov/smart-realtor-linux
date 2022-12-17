import 'package:my_home/controllers/base/base_controller.dart';
import 'package:my_home/models/product/product_list_response.dart';

class FavouriteController extends BaseController{
  List<Results>? favouriteProducts = [];

  @override
  void onReady() {
    super.onReady();
    getFavouriteProducts();
  }

  void getFavouriteProducts() async {
    setLoading(true);
    favouriteProducts = hive.getAllFavouriteProducts();
    setLoading(false);
  }
}