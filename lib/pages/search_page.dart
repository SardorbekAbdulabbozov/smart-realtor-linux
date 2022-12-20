import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/controllers/search_controller.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/custom_button.dart';
import 'package:my_home/core/custom_widgets/custom_text_field.dart';
import 'package:my_home/core/custom_widgets/filter_dialog.dart';
import 'package:my_home/core/custom_widgets/product_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GetBuilder<SearchController>(
      builder: (logic) {
        return Scaffold(
          body: Container(
            width: width,
            margin: AppConstants.marginAll16,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: CustomTextField(
                        hintText: 'Enter search text',
                        controller: logic.searchController,
                        onChanged: (value) async {
                          debugPrint('value: $value');
                          logic.setSearchKey(value);
                          await logic.search();
                        },
                      ),
                    ),
                    AppConstants.boxWidth8,
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        title: 'Filter',
                        icon: Icons.filter_alt_sharp,
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierColor: Colors.transparent,
                            builder: (_) {
                              return FilterDialog(
                                isRent: logic.isRent,
                                isRecommended: logic.isRecommended,
                                isLand: logic.isLand,
                                onApply: (isLand, isRent, isRecommended) {
                                  logic.applyFilter(
                                    isLand: isLand,
                                    isRent: isRent,
                                    isRecommended: isRecommended,
                                  );
                                  Get.back();
                                  logic.search();
                                },
                                status: (
                                  landEnable,
                                  rentEnable,
                                  recommendEnable,
                                ) {
                                  logic.enableDisableFilter(
                                    isLandEnable: landEnable,
                                    isRentEnable: rentEnable,
                                    isRecommendedEnable: recommendEnable,
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height - 184,
                  child: logic.searchFilterResults.isEmpty
                      ? const Center(
                          child: Text(
                            'Search results will be shown here',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : GridView.extent(
                          shrinkWrap: false,
                          padding: AppConstants.marginAll16
                              .copyWith(left: 0, right: 0),
                          maxCrossAxisExtent: width / 2,
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          childAspectRatio: 2 / 1,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          children: List.generate(
                            logic.searchFilterResults.length,
                            (i) => ProductItem(
                                product: logic.searchFilterResults[i]),
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
