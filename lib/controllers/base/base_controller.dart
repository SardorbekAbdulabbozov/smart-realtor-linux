import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_home/data/hive/hive_database.dart';
import 'package:my_home/data/local_source/local_source.dart';

abstract class BaseController extends GetxController {
  final LocalSource localSource = LocalSource.getInstance();
  final HiveDatabase _hive = HiveDatabase.getInstance();
  bool _isLoading = false;

  void showSuccessSnackBar({String message='You have successfully logged in to SmartRealtor'}) {
    if (Get.isSnackbarOpen) return;
    Get.snackbar(
      'Success!',
      message,
      titleText: const Center(
        child: Text(
          'Success!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/ic_circle_check.svg'),
          const SizedBox(width: 8),
           Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 12,
      backgroundColor: Colors.green,
      duration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 800),
      margin: EdgeInsets.symmetric(horizontal: Get.width / 5, vertical: 64),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  void showErrorSnackBar(String errorMessage) {
    if (Get.isSnackbarOpen) return;
    Get.snackbar(
      'Error!',
      errorMessage,
      titleText: const Center(
        child: Text(
          'Error!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/ic_close_circle.svg',
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 12,
      backgroundColor: Colors.red,
      duration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 800),
      margin: EdgeInsets.symmetric(horizontal: Get.width / 5, vertical: 64),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;
  HiveDatabase get hive => _hive;
}
