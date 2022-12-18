import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/table_item.dart';
import 'package:my_home/models/visitor/request_visit_response.dart';

class VisitorsListDialog extends StatelessWidget {
  const VisitorsListDialog({Key? key, this.visitors}) : super(key: key);
  final List<Visit>? visitors;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: width / 5,
        vertical: width / 7,
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: AppConstants.marginAll16,
        decoration: const BoxDecoration(
          borderRadius: AppConstants.borderRadius12,
          color: Colors.white,
        ),
        child: (visitors?.length ?? 0) == 0
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: Get.back,
                      ),
                    ],
                  ),
                  AppConstants.boxHeight4,
                  const Text('No visitors'),
                  AppConstants.boxHeight16,
                ],
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: Get.back,
                      ),
                    ],
                  ),
                  AppConstants.boxHeight4,
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        TableItem(
                          width: width * 0.04,
                          title: 'No.',
                          isHeader: true,
                        ),
                        AppConstants.verticalDividerForHeader,
                        TableItem(
                          width: width * 0.2,
                          title: 'Username',
                          isHeader: true,
                        ),
                        AppConstants.verticalDividerForHeader,
                        TableItem(
                          width: width * 0.3,
                          title: 'Appointed Time',
                          isHeader: true,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: visitors?.length ?? 0,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (_, i) {
                        return Container(
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border(
                              top: i == 0
                                  ? BorderSide.none
                                  : const BorderSide(color: Colors.grey),
                              right: const BorderSide(color: Colors.grey),
                              left: const BorderSide(color: Colors.grey),
                              bottom: (i + 1 == visitors?.length)
                                  ? const BorderSide(color: Colors.grey)
                                  : BorderSide.none,
                            ),
                          ),
                          child: Row(
                            children: [
                              TableItem(
                                width: width * 0.04,
                                title: '${i + 1}',
                              ),
                              AppConstants.verticalDividerForHeader,
                              TableItem(
                                width: width * 0.2,
                                title: visitors?[i].visitorsUsername ?? "",
                              ),
                              AppConstants.verticalDividerForHeader,
                              TableItem(
                                width: width * 0.3,
                                title: visitors?[i].visitingTime ?? "",
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
  }
}
