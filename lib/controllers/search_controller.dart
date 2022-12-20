import 'package:flutter/material.dart';
import 'package:my_home/controllers/base/base_controller.dart';
import 'package:my_home/data/repository/search_repository.dart';
import 'package:my_home/models/product/product_list_response.dart';

class SearchController extends BaseController {
  final SearchRepository _repository = SearchRepository();
  final TextEditingController searchController = TextEditingController();
  bool isRent = false;
  bool isRecommended = false;
  bool isLand = false;
  bool isRentEnable = false;
  bool isRecommendedEnable = false;
  bool isLandEnable = false;
  String title = "";
  List<Results> searchFilterResults = [];

  Future<void> search() async {
    setLoading(true);
    final String searchKey = title.isNotEmpty ? '"title":"$title"' : '';
    final String rentFilter = isRentEnable ? '"isRent":$isRent' : '';
    final String landFilter = isLandEnable ? '"isLand":$isLand' : '';
    final String recommendFilter =
        isRecommendedEnable ? '"isRecommended":$isRecommended' : '';
     String where = "";
    if (searchKey.isNotEmpty) {
      where += '$searchKey,';
    }
    if (rentFilter.isNotEmpty) {
      where += '$rentFilter,';
    }
    if (landFilter.isNotEmpty) {
      where += '$landFilter,';
    }
    if (recommendFilter.isNotEmpty) {
      where += '$recommendFilter,';
    }
    debugPrint('^^^^^^^^^^^^^^^^^^^^ "{${where.substring(0, where.length - 1)}}"');
    final response = await _repository.applyFilter(where: "{${where.substring(0, where.length - 1)}}");
    if (response is ProductListResponse) {
      debugPrint('&&&&&&&&&&&& ${response.results?.length}');
      searchFilterResults = response.results ?? [];
      setLoading(false);
    } else {
      setLoading(false);
      showErrorSnackBar('Something went wrong! :(');
    }
  }

  void applyFilter({
    required bool isLand,
    required bool isRent,
    required bool isRecommended,
  }) {
    this.isLand = isLand;
    this.isRent = isRent;
    this.isRecommended = isRecommended;
    update();
  }

  void enableDisableFilter({
    required bool isLandEnable,
    required bool isRentEnable,
    required bool isRecommendedEnable,
  }) {
    this.isLandEnable = isLandEnable;
    this.isRentEnable = isRentEnable;
    this.isRecommendedEnable = isRecommendedEnable;
    update();
  }

  void setSearchKey(String value){
    title = value;
    update();
  }
}
