import 'package:dio/dio.dart';
import 'package:my_home/data/provider/response_handler.dart';
import 'package:my_home/data/provider/server_error.dart';
import 'package:my_home/data/repository/base/base_repository.dart';
import 'package:my_home/models/product/Update_product_response.dart';
import 'package:my_home/models/product/product_list_response.dart';

class AdminRepository extends BaseRepository {
  Future<ResponseHandler<ProductListResponse>> _fetchProductList() async {
    ProductListResponse response;
    try {
      response = await apiClient.getProductList();
    } catch (error, _) {
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getProductList() async {
    final response = await _fetchProductList();
    if (response.data != null) {
      return response.data;
    } else if (checkIsCancelled(response.getException())) {
      return getErrorMessage(response.getException()!.getErrorMessage());
    }
  }

  Future<ResponseHandler<UpdateProductResponse>> _fetchUpdateProduct(
      Results product) async {
    UpdateProductResponse response;
    try {
      response = await apiClient.updateProduct(product.objectId ?? '', product);
    } catch (error, _) {
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> updateProduct(Results product) async {
    final response = await _fetchUpdateProduct(product);
    if (response.data != null) {
      return response.data;
    } else if (checkIsCancelled(response.getException())) {
      return getErrorMessage(response.getException()!.getErrorMessage());
    }
  }

  Future<void> _fetchDeleteProduct(String objectId) async {
    try {
      await apiClient.deleteProduct(objectId);
    } catch (error, _) {
      throw ServerError.withError(error: error as DioError);
    }
  }

  Future<dynamic> deleteProduct(String objectId) async {
    try {
      await _fetchDeleteProduct(objectId);
      return 'Success';
    } catch (error, _) {
      return getErrorMessage('Something went wrong! :(');
    }
  }
}
