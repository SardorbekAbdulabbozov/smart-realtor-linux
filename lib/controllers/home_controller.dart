import 'package:my_home/controllers/base/base_controller.dart';
import 'package:my_home/data/repository/home_repository.dart';
import 'package:my_home/models/product/product_list_response.dart';

class HomeController extends BaseController {
  final HomeRepository _repository = HomeRepository();
  List<Results> product = [];

  @override
  void onReady() async {
    super.onReady();
    await getProductList();
  }

  Future<void> getProductList() async {
    setLoading(true);
    var result = await _repository.getProductList();
    if (result is ProductListResponse) {
      product = result.results??[];
      setLoading(false);
    } else {
      setLoading(false);
      showErrorSnackBar('Something went wrong! :(');
    }
  }
}
