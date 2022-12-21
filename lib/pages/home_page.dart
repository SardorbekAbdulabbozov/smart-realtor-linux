import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/controllers/home_controller.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/custom_button.dart';
import 'package:my_home/core/custom_widgets/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GetBuilder<HomeController>(
      builder: (logic) {
        return Scaffold(
          body: logic.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Container(
                      height: 74,
                      margin: AppConstants.marginAll16.copyWith(bottom: 8),
                      padding: AppConstants.marginAll16,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: AppConstants.borderRadius12,
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: AppConstants.borderRadius12,
                            ),
                            child: DropdownButton<String>(
                              items: <DropdownMenuItem<String>>[
                                    const DropdownMenuItem<String>(
                                      value: 'Choose district',
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 16.0),
                                        child: Text('Choose district'),
                                      ),
                                    )
                                  ] +
                                  ((AppConstants.districts[
                                              logic.selectedRegion] ??
                                          [])
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16.0),
                                            child: Text(e),
                                          ),
                                        ),
                                      )
                                      .toList()),
                              value: logic.selectedDistrict,
                              onChanged: logic.selectDistrict,
                              underline: Container(),
                              icon: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Icon(Icons.arrow_drop_down_sharp),
                              ),
                            ),
                          ),
                          AppConstants.boxWidth16,
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: AppConstants.borderRadius12,
                            ),
                            child: DropdownButton<String>(
                              items: AppConstants.regions
                                  .map(
                                    (e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Text(e),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              value: logic.selectedRegion,
                              onChanged: logic.selectRegion,
                              underline: Container(),
                              icon: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Icon(Icons.arrow_drop_down_sharp),
                              ),
                            ),
                          ),
                          if (logic.selectedRegion != 'Choose region' ||
                              logic.selectedDistrict != 'Choose district')
                            AppConstants.spacer,
                          if (logic.selectedRegion != 'Choose region' ||
                              logic.selectedDistrict != 'Choose district')
                            SizedBox(
                              width: 120,
                              child: CustomButton(
                                title: 'Reset',
                                textStyle: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                                color: Colors.white,
                                onPressed: () {
                                  logic.selectedDistrict = 'Choose district';
                                  logic.selectedRegion = 'Choose region';
                                  logic.getProductList();
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height - 190,
                      child: logic.product.isNotEmpty
                          ? GridView.extent(
                              shrinkWrap: false,
                              padding:
                                  AppConstants.marginAll16.copyWith(top: 8),
                              maxCrossAxisExtent: width / 2,
                              physics: const ClampingScrollPhysics(),
                              childAspectRatio: 2 / 1,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              children: List.generate(
                                logic.product.length,
                                (i) => ProductItem(product: logic.product[i]),
                              ),
                            )
                          : const Center(
                              child: Text(
                                'No product found',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
