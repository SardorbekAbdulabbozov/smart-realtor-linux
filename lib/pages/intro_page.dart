import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/controllers/intro_controller.dart';
import 'package:my_home/core/app_routes/app_route_names.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/custom_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder<IntroController>(
        builder: (logic) {
          return Container(
            padding: AppConstants.marginVertical36,
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: 4,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: logic.pageController,
                    onPageChanged: logic.onPageChanged,
                    itemBuilder: (_, i) {
                      return Image.asset(
                        'assets/png/ic_intro_${i + 1}.png',
                        scale: 7,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    logic.introInfo[logic.currentIndex],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: IconButton(
                        onPressed: logic.currentIndex != 0
                            ? () {
                                logic.onPageChanged(logic.currentIndex - 1);
                              }
                            : null,
                        icon: const Icon(Icons.arrow_back_ios_rounded),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: logic.indicators(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: IconButton(
                        onPressed: logic.currentIndex != 3
                            ? () {
                                logic.onPageChanged(logic.currentIndex + 1);
                              }
                            : null,
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ],
                ),
                if (logic.currentIndex == 3)
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24,
                      left: Get.width / 3,
                      right: Get.width / 3,
                    ),
                    child: CustomButton(
                      title: 'Continue',
                      onPressed: () async {
                        Get.offAllNamed(AppRouteNames.LOGIN);
                        await logic.localSource.setIntroShowStatus();
                      },
                      // constraints: const Size(200, 60),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
