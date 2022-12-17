import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/controllers/admin_controller.dart';
import 'package:my_home/core/app_routes/app_route_names.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/custom_button.dart';
import 'package:my_home/core/custom_widgets/custom_text_field.dart';
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
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TableItem(
                              width: width * 0.04,
                              title: 'No.',
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.18,
                              title: 'Title',
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.07,
                              title: 'Price, \$',
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.16,
                              title: 'Address',
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.05,
                              title: 'Type',
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.07,
                              title: 'Area',
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.1,
                              title: 'No. of rooms',
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.11,
                              title: 'Recommended',
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width * 0.05,
                              title: 'Land',
                            ),
                            AppConstants.verticalDividerForHeader,
                            TableItem(
                              width: width - (width * 0.83) - 34,
                              title: 'Actions',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: height - 192,
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: logic.products.length,
                          itemBuilder: (c, i) {
                            return Container(
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: const BorderSide(color: Colors.grey),
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
                                    title: (logic.products[i].address ?? '')
                                            .isNotEmpty
                                        ? (logic.products[i].address ?? '')
                                                    .split(', ')
                                                    .length >=
                                                2
                                            ? (logic.products[i].address ?? '')
                                                .split(', ')[1]
                                            : (logic.products[i].address ?? '')
                                                        .split(', ')
                                                        .length ==
                                                    1
                                                ? (logic.products[i].address ??
                                                    '')[0]
                                                : 'Undefined'
                                        : 'Undefined',
                                  ),
                                  AppConstants.verticalDividerForHeader,
                                  TableItem(
                                    width: width * 0.05,
                                    title: (logic.products[i].isRent ?? false)
                                        ? 'Rent'
                                        : 'Sale',
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
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              barrierColor: Colors.transparent,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  insetPadding:
                                                      EdgeInsets.symmetric(
                                                    horizontal: width / 4,
                                                  ),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: Container(
                                                    padding: AppConstants
                                                        .marginAll16,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: AppConstants
                                                          .borderRadius12,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              logic.products[i]
                                                                      .title ??
                                                                  '',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            AppConstants.spacer,
                                                            IconButton(
                                                              icon: const Icon(
                                                                Icons.close,
                                                              ),
                                                              onPressed:
                                                                  Get.back,
                                                            ),
                                                          ],
                                                        ),
                                                        AppConstants
                                                            .boxHeight12,
                                                        CustomTextField(
                                                          labelText: 'Title',
                                                          controller:
                                                              TextEditingController(),
                                                        ),
                                                        AppConstants
                                                            .boxHeight12,
                                                        CustomTextField(
                                                          labelText:
                                                              "Description",
                                                          controller:
                                                              TextEditingController(),
                                                        ),
                                                        AppConstants
                                                            .boxHeight12,
                                                        CustomTextField(
                                                          labelText: "Address",
                                                          controller:
                                                              TextEditingController(),
                                                        ),
                                                        AppConstants
                                                            .boxHeight12,
                                                        CustomTextField(
                                                          labelText: "Price",
                                                          controller:
                                                              TextEditingController(),
                                                        ),
                                                        AppConstants
                                                            .boxHeight12,
                                                        CustomTextField(
                                                          labelText: "Area",
                                                          controller:
                                                              TextEditingController(),
                                                        ),
                                                        AppConstants
                                                            .boxHeight12,
                                                        CustomTextField(
                                                          labelText:
                                                              "No. of Rooms",
                                                          controller:
                                                              TextEditingController(),
                                                        ),
                                                        AppConstants
                                                            .boxHeight12,
                                                        Row(
                                                          children: [
                                                            const Text(
                                                                'Is Land?'),
                                                            Switch(
                                                              value: logic
                                                                      .products[
                                                                          i]
                                                                      .isLand ??
                                                                  false,
                                                              onChanged:
                                                                  (value) {},
                                                            ),
                                                            AppConstants.spacer,
                                                            const Text(
                                                                'Is Rent?'),
                                                            Switch(
                                                              value: logic
                                                                      .products[
                                                                          i]
                                                                      .isRent ??
                                                                  false,
                                                              onChanged:
                                                                  (value) {},
                                                            ),
                                                            AppConstants.spacer,
                                                            const Text(
                                                                'Is Recommended?'),
                                                            Switch(
                                                              value: logic
                                                                      .products[
                                                                          i]
                                                                      .isRecommended ??
                                                                  false,
                                                              onChanged:
                                                                  (value) {},
                                                            ),
                                                          ],
                                                        ),
                                                        AppConstants
                                                            .boxHeight12,
                                                        CustomButton(
                                                          title: 'SAVE',
                                                          onPressed: () {},
                                                        ),
                                                      ],
                                                    ),
                                                  ),
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
                    ],
                  ),
                ),
        );
      },
    );
  }
}
