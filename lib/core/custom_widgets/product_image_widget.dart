import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_home/core/constants/app_constants.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    Key? key,
    this.imageUrl,
    this.imageCount = 0,
    required this.isRecommended,
    required this.isLand,
  }) : super(key: key);
  final int imageCount;
  final bool isRecommended;
  final bool isLand;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: AppConstants.borderRadius12,
              color: Colors.white,
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl ?? AppConstants.defaultImageUrl,
              errorWidget: (_, __, ___) =>
                  Image.asset('assets/logo/ic_logo.jpg'),
              placeholder: (_, __) => Image.asset('assets/logo/ic_logo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Visibility(
            visible: isRecommended,
            child: Positioned(
              top: 30,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: const Text(
                  'Best Offer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: isLand,
            child: Positioned(
              top: !isRecommended?30:60,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: const Text(
                  'Land',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: imageCount > 0,
            child: Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.only(right: 8, bottom: 8),
              padding: AppConstants.marginAll4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.7),
                // borderRadius: AppConstants.borderRadius12,
              ),
              child: Center(
                child: Text(
                  imageCount > 3 ? '3+' : imageCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
