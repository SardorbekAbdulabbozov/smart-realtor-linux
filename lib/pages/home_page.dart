import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/controllers/home_controller.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(
      builder: (logic) {
        return Scaffold(
          body: logic.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.extent(
                  shrinkWrap: false,
                  padding: AppConstants.marginAll16,
                  maxCrossAxisExtent: width / 2,
                  physics: const ClampingScrollPhysics(),
                  childAspectRatio: 2 / 1,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: List.generate(
                    logic.product.length,
                    (i) => ProductItem(product: logic.product[i]),
                  ),
                ),
        );
      },
    );
  }
}
