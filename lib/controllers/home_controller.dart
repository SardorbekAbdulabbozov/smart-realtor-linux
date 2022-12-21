import 'package:my_home/controllers/base/base_controller.dart';
import 'package:my_home/data/repository/home_repository.dart';
import 'package:my_home/models/product/product_list_response.dart';

class HomeController extends BaseController {
  final HomeRepository _repository = HomeRepository();
  List<Results> product = [];
  String selectedDistrict = 'Choose district';
  String selectedRegion = 'Choose region';

  @override
  void onReady() async {
    super.onReady();
    await getProductList();
  }

  void selectDistrict(String? district) async {
    if (selectedDistrict == district) return;
    selectedDistrict = district ?? '';
    await getProductList(
        where: selectedDistrict != 'Choose district'
            ? '{"region":"$selectedRegion","district":"$selectedDistrict"}'
            : '{"region":"$selectedRegion"}');
  }

  void selectRegion(String? region) async {
    if (selectedRegion == region) return;
    selectedDistrict = 'Choose district';
    selectedRegion = region ?? '';
    await getProductList(
        where: selectedRegion != 'Choose region'
            ? '{"region":"$selectedRegion"}'
            : '');
  }

  Future<void> getProductList({String where = ''}) async {
    setLoading(true);
    var result = await _repository.getProductList(where: where);
    if (result is ProductListResponse) {
      product = result.results ?? [];
      setLoading(false);
    } else {
      setLoading(false);
      showErrorSnackBar('Something went wrong! :(');
    }
  }
}
