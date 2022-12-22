import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/controllers/admin_controller.dart';
import 'package:my_home/core/app_routes/app_route_names.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/custom_button.dart';
import 'package:my_home/core/custom_widgets/product_edit_add_dialog.dart';
import 'package:my_home/core/custom_widgets/table_item.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GetBuilder<AdminController>(
      builder: (logic) {
        return Scaffold(
          body: logic.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: AppConstants.marginAll16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        margin: const EdgeInsets.only(bottom: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TableItem(
                              width: width * 0.04,
                              title: 'No.',
                              isHeader: true,
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.18,
                              title: 'Title',
                              isHeader: true,
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.07,
                              title: 'Price, \$',
                              isHeader: true,
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.16,
                              title: 'Address',
                              isHeader: true,
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.05,
                              title: 'Type',
                              isHeader: true,
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.07,
                              title: 'Area',
                              isHeader: true,
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.1,
                              title: 'No. of rooms',
                              isHeader: true,
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.11,
                              title: 'Recommended',
                              isHeader: true,
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.05,
                              title: 'Land',
                              isHeader: true,
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width - (width * 0.83) - 34,
                              title: 'Actions',
                              isHeader: true,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: height - 256,
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: logic.products.length,
                          itemBuilder: (c, i) {
                            return Container(
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: i == 0
                                      ? BorderSide.none
                                      : const BorderSide(color: Colors.grey),
                                  right: const BorderSide(color: Colors.grey),
                                  left: const BorderSide(color: Colors.grey),
                                  bottom: (i + 1 == logic.products.length)
                                      ? const BorderSide(color: Colors.grey)
                                      : BorderSide.none,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TableItem(
                                    width: width * 0.04,
                                    title: '${i + 1}',
                                  ),
                                  AppConstants.verticalDividerForHeader,
                                  TableItem(
                                    width: width * 0.18,
                                    title: logic.products[i].title ?? '',
                                  ),
                                  AppConstants.verticalDividerForHeader,
                                  TableItem(
                                    width: width * 0.07,
                                    title: AppConstants.moneyFormat(
                                            logic.products[i].price ?? 0)
                                        .toString(),
                                  ),
                                  AppConstants.verticalDividerForHeader,
                                  TableItem(
                                    width: width * 0.16,
                                    title: [(logic.products[i].district),(logic.products[i].region)].join(' distirct,\n'),
                                  ),
                                  AppConstants.verticalDividerForHeader,
                                  TableItem(
                                    width: width * 0.05,
                                    title: (logic.products[i].isRent ?? false)
                                        ? 'Rent'
                                        : 'Sell',
                                  ),
                                  AppConstants.verticalDividerForHeader,
                                  TableItem(
                                    width: width * 0.07,
                                    title:
                                        '${logic.products[i].area ?? ''} ${logic.products[i].isLand ?? false ? 'ac' : 'm\u00B2'}',
                                  ),
                                  AppConstants.verticalDividerForHeader,
                                  TableItem(
                                    width: width * 0.1,
                                    title:
                                        '${logic.products[i].numberOfRooms ?? "-"}',
                                  ),
                                  AppConstants.verticalDividerForHeader,
                                  TableItem(
                                    width: width * 0.11,
                                    title:
                                        logic.products[i].isRecommended ?? false
                                            ? 'Yes'
                                            : 'No',
                                  ),
                                  AppConstants.verticalDividerForHeader,
                                  TableItem(
                                    width: width * 0.05,
                                    title: logic.products[i].isLand ?? false
                                        ? 'Yes'
                                        : 'No',
                                  ),
                                  AppConstants.verticalDividerForHeader,
                                  TableItem(
                                    width: width - (width * 0.83) - 34,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            await Get.toNamed(
                                                AppRouteNames.PRODUCT,
                                                arguments: logic.products[i]);
                                          },
                                          icon: const Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.black,
                                          ),
                                        ),
                                        if (logic.localSource
                                                .getProfile()
                                                .isOwner ??
                                            false)
                                          IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                barrierColor:
                                                    Colors.transparent,
                                                builder:
                                                    (BuildContext context) {
                                                  return ProductEditAddDialog(
                                                    title: logic.products[i]
                                                            .title ??
                                                        '',
                                                    description: logic
                                                            .products[i]
                                                            .description ??
                                                        '',
                                                    address: logic.products[i]
                                                            .address ??
                                                        '',
                                                    price: AppConstants
                                                            .moneyFormat(logic
                                                                    .products[i]
                                                                    .price ??
                                                                0)
                                                        .toString(),
                                                    area: (logic.products[i]
                                                                .area ??
                                                            0)
                                                        .toString(),
                                                    rooms: (logic.products[i]
                                                                .numberOfRooms ??
                                                            0)
                                                        .toString(),
                                                    isLand: logic.products[i]
                                                            .isLand ??
                                                        false,
                                                    isRent: logic.products[i]
                                                            .isRent ??
                                                        false,
                                                    isRecommended: logic
                                                            .products[i]
                                                            .isRecommended ??
                                                        false,
                                                    region: logic
                                                        .products[i].region,
                                                    district: logic
                                                        .products[i].district,
                                                    onSave: (
                                                      title,
                                                      description,
                                                      address,
                                                      district,
                                                      region,
                                                      price,
                                                      area,
                                                      rooms,
                                                      isLand,
                                                      isRent,
                                                      isRecommended,
                                                    ) async {
                                                      Get.back();
                                                      int result = await logic
                                                          .updateProduct(
                                                        index: i,
                                                        objectId: logic
                                                            .products[i]
                                                            .objectId,
                                                        title: title,
                                                        description:
                                                            description,
                                                        address: address,
                                                        price: num.tryParse(
                                                            price ?? ''),
                                                        area: num.tryParse(
                                                            area ?? ''),
                                                        numberOfRooms:
                                                            num.tryParse(
                                                                rooms ?? ''),
                                                        isLand: isLand,
                                                        isRent: isRent,
                                                        isRecommended:
                                                            isRecommended,
                                                        district: district,
                                                        region: region,
                                                      );
                                                      if (result == 0) {
                                                        await logic.getProductList(
                                                            where:
                                                                '{"owner":"${logic.localSource.getProfile().username}"}');
                                                      } else {
                                                        logic.showErrorSnackBar(
                                                            'Something went wrong! :(');
                                                      }
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.green,
                                            ),
                                          ),
                                        IconButton(
                                          onPressed: () async {
                                            await logic.deleteProduct(i);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      AppConstants.boxHeight12,
                      SizedBox(
                        width: 250,
                        child: Visibility(
                          visible:
                              logic.localSource.getProfile().isOwner ?? false,
                          child: CustomButton(
                            title: 'Add New Item',
                            onPressed: () {
                              showDialog(
                                context: context,
                                barrierColor: Colors.transparent,
                                builder: (BuildContext context) {
                                  return ProductEditAddDialog(
                                    isLand: false,
                                    isRent: false,
                                    isRecommended: false,
                                    onSave: (
                                      title,
                                      description,
                                      address,
                                      district,
                                      region,
                                      price,
                                      area,
                                      rooms,
                                      isLand,
                                      isRent,
                                      isRecommended,
                                    ) async {
                                      Get.back();
                                      int result = await logic.createNewProduct(
                                        title: title,
                                        description: description,
                                        address: address,
                                        price: num.tryParse(price ?? ''),
                                        area: num.tryParse(area ?? ''),
                                        numberOfRooms:
                                            num.tryParse(rooms ?? ''),
                                        isLand: isLand,
                                        isRent: isRent,
                                        isRecommended: isRecommended,
                                        district: district,
                                        region: region,
                                      );
                                      if (result == 0) {
                                        await logic.getProductList(where:
                                        '{"owner":"${logic.localSource.getProfile().username}"}');
                                      } else {
                                        logic.showErrorSnackBar(
                                            'Something went wrong! :(');
                                      }
                                    },
                                  );
                                },
                              );
                            },
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
