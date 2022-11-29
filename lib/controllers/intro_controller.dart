import 'package:flutter/material.dart';
import 'package:my_home/controllers/base/base_controller.dart';
import 'package:my_home/core/constants/app_constants.dart';

class IntroController extends BaseController {
  int currentIndex = 0;
  PageController pageController =
      PageController(viewportFraction: 1, initialPage: 0);

  void onPageChanged(int index) {
    if (3 < index || index < 0) {
      return;
    }
    currentIndex = index;
    pageController.jumpToPage(index);
    update();
  }

  List<Widget> indicators() {
    return List<Widget>.generate(
      4,
      (index) {
        return Container(
          margin: AppConstants.marginAll4,
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }

  List<String> introInfo = [
    'Easily search for your dream house',
    'Give information about an apartment or a house',
    'Easily negotiate with clients',
    'Buy Real Estate easily',
  ];
}
