import 'package:dio/dio.dart';
import 'package:my_home/data/provider/response_handler.dart';
import 'package:my_home/data/provider/server_error.dart';
import 'package:my_home/data/repository/base/base_repository.dart';
import 'package:my_home/models/product/product_list_response.dart';

class HomeRepository extends BaseRepository {
  Future<ResponseHandler<ProductListResponse>> _fetchProductList(
      String where) async {
    ProductListResponse response;
    try {
      response = where.isNotEmpty
          ? await apiClient.getSpecificProducts(where)
          : await apiClient.getProductList();
    } catch (error, _) {
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getProductList({String? where}) async {
    final response = await _fetchProductList(where ?? "");
    if (response.data != null) {
      return response.data;
    } else if (checkIsCancelled(response.getException())) {
      return getErrorMessage(response.getException()!.getErrorMessage());
    }
  }
}
