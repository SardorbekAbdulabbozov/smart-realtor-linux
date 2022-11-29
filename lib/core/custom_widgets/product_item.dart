import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/product_details_widget.dart';
import 'package:my_home/core/custom_widgets/product_image_widget.dart';
import 'package:my_home/models/product/product_list_response.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Results product;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GlassContainer(
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.40),
          Colors.white.withOpacity(0.10)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.red.withOpacity(0.60),
          Colors.red.withOpacity(0.10),
          Colors.red.withOpacity(0.05),
          Colors.red.withOpacity(0.6)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 0.39, 0.40, 1.0],
      ),
      blur: 15.0,
      borderWidth: 1.5,
      elevation: 3.0,
      isFrostedGlass: false,
      frostedOpacity: 0.12,
      shadowColor: Colors.white.withOpacity(0.20),
      borderRadius: AppConstants.borderRadius12,
      padding: AppConstants.marginAll16,
      height: ((width - 2) - 40) / 2,
      width: (width - 2) - 40,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.05),
            child: Text(
              product.title ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AppConstants.boxHeight4,
          Expanded(
            child: Row(
              children: [
                ProductImageWidget(
                  imageCount: (product.images ?? []).length,
                  imageUrl: ((product.images ?? []).isNotEmpty)
                      ? (product.images ?? ['']).first
                      : '',
                  isRecommended: product.isRecommended ?? false,
                ),
                ProductDetailWidget(
                  area: (product.area ?? 0).toString(),
                  type: product.isRent ?? false,
                  rooms: (product.numberOfRooms ?? 0).toString(),
                  price: (product.price ?? 0).toString(),
                  address: product.address ?? '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
