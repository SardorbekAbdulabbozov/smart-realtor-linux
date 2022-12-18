import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_home/data/repository/product_repository.dart';
import 'package:my_home/models/product/product_list_response.dart';
import 'package:my_home/models/success/create_success_response.dart';
import 'package:my_home/models/visitor/request_visit_request.dart';
import 'package:my_home/models/visitor/request_visit_response.dart';

import 'base/base_controller.dart';

class ProductController extends BaseController {
  final ProductRepository _repository = ProductRepository();
  Results? product;
  int imageIndex = 0;
  bool isFavourite = false;
  bool isVisitAppointed = false;
  String? appointedTime;
  List<Visit>? allVisitors = [];

  @override
  void onInit() {
    super.onInit();
    Get.arguments != null ? product = Get.arguments : null;
    debugPrint('product: ${product?.isBooked} :: ${product?.whoBooked}');
    isFavourite = hive.productsBox.containsKey(product?.objectId ?? '');
    update();
  }

  @override
  void onReady() async {
    super.onReady();
    await checkAppointment();
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
        debugPrint('product.whoBooked: ${product?.isBooked} :: ${product?.whoBooked}');
        await hive.addToFavourites(product!);
      }
    }
    update();
  }

  Future<void> checkAppointment() async {
    setLoading(true);
    String condition = (localSource.getProfile().isAdmin ?? false)
        ? '{ "productId": "${product?.objectId ?? ''}" }'
        : '{ "visitorsUsername": "${localSource.getProfile().username ?? ""}", "productId": "${product?.objectId ?? ''}" }';
    var result = await _repository.checkAppointment(condition);
    if (result is RequestVisitResponse) {
      if (localSource.getProfile().isAdmin ?? false) {
        allVisitors = result.visits ?? [];
      } else {
        appointedTime = result.visits?.isNotEmpty ?? false
            ? result.visits?.first.visitingTime
            : null;
        if (appointedTime != null) {
          isVisitAppointed = true;
        }
        debugPrint('appointedTime: $appointedTime :: $isVisitAppointed');
      }
      setLoading(false);
    } else {
      setLoading(false);
      showErrorSnackBar('Something went wrong! :(');
    }
  }

  Future<void> requestVisit(String? time) async {
    Get.back();
    setLoading(true);
    RequestVisitRequest request = RequestVisitRequest(
      visitorsUsername: localSource.getProfile().username ?? "",
      productId: product?.objectId ?? "",
      visitingTime: time,
    );

    var response = await _repository.requestVisit(request);
    if (response is CreateSuccessResponse) {
      await checkAppointment();
    } else {
      setLoading(false);
      showErrorSnackBar('Something went wrong! :(');
    }
  }

  Future<int> bookProduct(bool status) async {
    setLoading(true);
    if (product == null) return 1;
    var result = await _repository.updateProduct(product!.copyWith(
        isBooked: status,
        whoBooked: status ? (localSource.getProfile().username ?? "") : ""));
    if (result == 0) {
      await getProduct();
      return 0;
    } else {
      setLoading(false);
      return 1;
    }
  }

  Future<void> getProduct() async {
    setLoading(true);
    var result = await _repository.getProduct(
      title: product?.title ?? '',
      description: product?.description ?? '',
      address: product?.address ?? '',
    );
    if (result is ProductListResponse) {
      product =
          (result.results ?? []).isNotEmpty ? result.results?.first : null;
      setLoading(false);
    } else {
      setLoading(false);
      showErrorSnackBar('Something went wrong! :(');
    }
  }
}
