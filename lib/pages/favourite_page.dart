import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_home/controllers/favourite_controller.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/product_item.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FavouriteController>(
        builder: (logic) {
          return (logic.favouriteProducts?.length ?? 0) == 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ic_add_to_favorites.svg',
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        'Favourites is empty',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                )
              : GridView.extent(
                  shrinkWrap: false,
                  padding: AppConstants.marginAll16,
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                  physics: const ClampingScrollPhysics(),
                  childAspectRatio: 2 / 1,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: List.generate(
                    logic.favouriteProducts?.length ?? 0,
                    (i) => ProductItem(
                      product: logic.favouriteProducts![i],
                      onPop: logic.getFavouriteProducts,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
