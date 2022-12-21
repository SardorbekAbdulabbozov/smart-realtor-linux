import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/controllers/main_controller.dart';
import 'package:my_home/core/custom_widgets/tab_bar_item.dart';
import 'package:my_home/pages/admin_page.dart';
import 'package:my_home/pages/favourite_page.dart';
import 'package:my_home/pages/home_page.dart';
import 'package:my_home/pages/profile_page.dart';
import 'package:my_home/pages/search_page.dart';
import 'package:my_home/pages/users_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainController>(
        builder: (logic) {
          return SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                TabBar(
                  controller: logic.tabController,
                  tabs: List.generate(
                    logic.tabItems.length,
                    (index) => TabBarItem(
                      title: logic.tabItems[index].title,
                      icon: logic.tabItems[index].icon,
                      isSelected: index == logic.tabController.index,
                    ),
                  ),
                ),
                const Divider(height: 0, thickness: 2),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: logic.tabController,
                    children: [
                      const HomePage(),
                      logic.localSource.isAdmin()|| logic.localSource.isOwner()
                          ? const AdminPage()
                          : const SearchPage(),
                      logic.localSource.isAdmin()
                          ? const UsersPage()
                          : const FavouritePage(),
                      const ProfilePage(),
                    ],
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
