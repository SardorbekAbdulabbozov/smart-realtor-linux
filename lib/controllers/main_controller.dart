import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/controllers/base/base_controller.dart';
import 'package:my_home/models/ui_models/tab_data.dart';

class MainController extends BaseController with GetTickerProviderStateMixin {
  late TabController tabController;

  List<TabData> tabItems = [];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    tabItems = [
      TabData(
        title: 'Home',
        icon: 'home',
      ),
      TabData(
        title: localSource.isAdmin() ? 'Admin' : 'Search',
        icon: localSource.isAdmin() ? 'admin' : 'search',
      ),
      TabData(
        title: localSource.isAdmin() ? 'Users' : 'Favourites',
        icon: localSource.isAdmin() ? 'users' : 'favourite',
      ),
      TabData(
        title: 'Profile',
        icon: localSource.getGender() ? 'user_male' : "user_female",
      ),
    ];
  }

  @override
  void onReady() {
    super.onReady();
    tabController.addListener(() {
      update();
    });
  }
}
