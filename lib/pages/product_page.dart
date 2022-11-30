import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/controllers/product_controller.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/custom_button.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return GetBuilder<ProductController>(
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            title: Text(logic.product?.title ?? ''),
          ),
          body: Container(
            width: width - 32,
            margin: AppConstants.marginAll16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: ((width - 32) / 2) - 8,
                      decoration: const BoxDecoration(
                        borderRadius: AppConstants.borderRadius12,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: height,
                            autoPlay: false,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: false,
                            viewportFraction: 1,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (i, _) {
                              logic.changeImageIndex(i);
                            },
                            scrollPhysics: const ClampingScrollPhysics()),
                        items: logic.product?.images
                                ?.map(
                                  (url) => Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: AppConstants.borderRadius12,
                                      color: Colors.white,
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: CachedNetworkImage(
                                      imageUrl: url,
                                      fit: BoxFit.cover,
                                      errorWidget: (_, __, ___) => Image.asset(
                                          'assets/logo/ic_logo.jpg'),
                                      placeholder: (_, __) => Image.asset(
                                          'assets/logo/ic_logo.jpg'),
                                    ),
                                  ),
                                )
                                .toList() ??
                            [],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: ((width - 32) / 2) - 8,
                      decoration: BoxDecoration(
                        borderRadius: AppConstants.borderRadius12.copyWith(
                            topLeft: const Radius.circular(0),
                            topRight: const Radius.circular(0)),
                        color: Colors.black54,
                      ),
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: logic.product?.images?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) {
                            return Padding(
                              padding: AppConstants.marginAll4,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: logic.imageIndex == i
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                AppConstants.boxWidth16,
                SingleChildScrollView(
                  child: SizedBox(
                    width: ((width - 32) / 2) - 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 8),
                          child: Text(
                            logic.product?.description ?? '',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 8),
                          child: Text(
                            logic.product?.address ?? '',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 8),
                          child: Text(
                            '\$${logic.moneyFormat(logic.product?.price ?? 0)}${(logic.product?.isRent ?? false) ? '/month' : ''}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const Text(
                          'Number of rooms',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 8),
                          child: Text(
                            logic.product?.numberOfRooms.toString() ?? '',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const Text(
                          'Area',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 8),
                          child: Text(
                            '${logic.product?.area.toString() ?? ''} sqm',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const Text(
                          'Type',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 8),
                          child: Text(
                            logic.product?.isRent ?? false ? 'Rent' : 'Sell',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        AppConstants.boxHeight24,
                        Row(
                          children: [
                            SizedBox(
                              width: ((((width - 32) / 2) - 8) / 2) - 8,
                              child: CustomButton(
                                title: 'Request a visit',
                                onPressed: () {},
                                color: Colors.green,
                                icon: Icons.open_in_new,
                              ),
                            ),
                            AppConstants.boxWidth16,
                            SizedBox(
                              width: ((((width - 32) / 2) - 8) / 2) - 8,
                              child: CustomButton(
                                title: 'Add to Wishlist',
                                icon: Icons.favorite_border_rounded,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top:16),
                          width: (((width - 32) / 2) - 8),
                          child: CustomButton(
                            title: 'Book',
                            icon: Icons.bookmark_added_rounded,
                            color: Colors.deepPurpleAccent,
                            onPressed: () {},
                          ),
                        ),
                      ],
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
