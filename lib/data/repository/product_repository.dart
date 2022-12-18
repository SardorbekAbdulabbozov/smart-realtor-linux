import 'package:dio/dio.dart';
import 'package:my_home/data/provider/response_handler.dart';
import 'package:my_home/data/provider/server_error.dart';
import 'package:my_home/data/repository/base/base_repository.dart';
import 'package:my_home/models/product/product_list_response.dart';
import 'package:my_home/models/success/create_success_response.dart';
import 'package:my_home/models/visitor/request_visit_request.dart';
import 'package:my_home/models/visitor/request_visit_response.dart';

class ProductRepository extends BaseRepository {
  Future<ResponseHandler<CreateSuccessResponse>> _fetchRequestVisit(
      RequestVisitRequest visitRequest) async {
    CreateSuccessResponse response;
    try {
      response = await apiClient.requestVisit(visitRequest);
    } catch (error, _) {
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> requestVisit(RequestVisitRequest visitRequest) async {
    final response = await _fetchRequestVisit(visitRequest);
    if (response.data != null) {
      return response.data;
    } else if (checkIsCancelled(response.getException())) {
      return getErrorMessage(response.getException()!.getErrorMessage());
    }
  }

  Future<ResponseHandler<RequestVisitResponse>> _fetchVisitorsList(
      String? where) async {
    RequestVisitResponse response;
    try {
      response = await apiClient.getVisitors(where);
    } catch (error, _) {
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> checkAppointment(String? where) async {
    final response = await _fetchVisitorsList(where);
    if (response.data != null) {
      return response.data;
    } else if (checkIsCancelled(response.getException())) {
      return getErrorMessage(response.getException()!.getErrorMessage());
    }
  }

  Future<int> _fetchUpdateProduct(Results product) async {
    try {
      await apiClient.updateProduct(product.objectId ?? '', product);
      return 0;
    } catch (error, _) {
      return 1;
    }
  }

  Future<int> updateProduct(Results product) async {
    final response = await _fetchUpdateProduct(product);
    if (response == 0) {
      return 0;
    } else {
      return 1;
    }
  }

  Future<ResponseHandler<ProductListResponse>> _fetchProduct(
      String? where) async {
    ProductListResponse response;
    try {
      response = await apiClient.getSingleProduct(where);
    } catch (error, _) {
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getProduct({
    required String title,
    required String description,
    required String address,
  }) async {
    final response = await _fetchProduct(
        '{ "title": "$title", "description": "$description", "address": "$address" }');
    if (response.data != null) {
      return response.data;
    } else if (checkIsCancelled(response.getException())) {
      return getErrorMessage(response.getException()!.getErrorMessage());
    }
  }
}
