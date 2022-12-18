import 'package:my_home/controllers/base/base_controller.dart';
import 'package:my_home/data/repository/admin_repository.dart';
import 'package:my_home/models/success/create_success_response.dart';
import 'package:my_home/models/product/product_list_response.dart';

class AdminController extends BaseController {
  final AdminRepository _repository = AdminRepository();
  List<Results> products = [];

  @override
  void onReady() async {
    super.onReady();
    await getProductList();
  }

  Future<void> getProductList() async {
    setLoading(true);
    var result = await _repository.getProductList();
    if (result is ProductListResponse) {
      products = result.results ?? [];
      setLoading(false);
    } else {
      setLoading(false);
      showErrorSnackBar('Something went wrong! :(');
    }
  }

  Future<int> updateProduct({
    required int index,
    String? objectId,
    bool? isRent,
    dynamic price,
    dynamic area,
    dynamic numberOfRooms,
    bool? isRecommended,
    bool? isBooked,
    bool? isLand,
    String? description,
    String? address,
    String? title,
  }) async {
    setLoading(true);
    var result = await _repository.updateProduct(
      products[index].copyWith(
        objectId: objectId,
        isRent: isRent,
        price: price,
        area: area,
        numberOfRooms: numberOfRooms,
        isRecommended: isRecommended,
        isBooked: isBooked,
        isLand: isLand,
        description: description,
        address: address,
        title: title,
      ),
    );
    if (result == 0 ) {
      setLoading(false);
      return 0;
    } else {
      setLoading(false);
      return 1;
    }
  }

  Future<int> createNewProduct({
    bool? isRent,
    dynamic price,
    dynamic area,
    dynamic numberOfRooms,
    bool? isRecommended,
    bool? isLand,
    String? description,
    String? address,
    String? title,
  }) async {
    setLoading(true);
    Results product = Results(
      images: [""],
      isRent: isRent,
      price: price,
      area: area,
      numberOfRooms: numberOfRooms,
      isRecommended: isRecommended,
      isBooked: false,
      isLand: isLand,
      description: description,
      address: address,
      title: title,
    );
    var result = await _repository.createProduct(product);
    if (result is CreateSuccessResponse) {
      setLoading(false);
      return 0;
    } else {
      setLoading(false);
      return 1;
    }
  }

  Future<void> deleteProduct(int index) async {
    setLoading(true);
    var result =
        await _repository.deleteProduct(products[index].objectId ?? '');
    if (result is String) {
      if (result == 'Success') {
        await getProductList();
      } else {
        setLoading(false);
        showErrorSnackBar('Something went wrong! :(');
      }
    } else {
      setLoading(false);
      showErrorSnackBar(result);
    }
  }
}
