import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_home/bindings/splash_binding.dart';
import 'package:my_home/core/app_pages/app_pages.dart';
import 'package:my_home/core/app_routes/app_route_names.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/data/hive/hive_database.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void _setTargetPlatformForDesktop() {
  TargetPlatform? targetPlatform;

  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setTargetPlatformForDesktop();
  await Hive.initFlutter();
  await HiveDatabase.getInstance().initializeHive();
  await GetStorage.init();
  const keyApplicationId = 'Q8MVZxU1JydIgL2buCyKgOFILDtMml3jyJlErxUI';
  const keyClientKey = 'DXY9qbHbX0f2fBukAgkA8AI5Ef4xcAin59m3tbft';
  const keyParseServerUrl = 'https://parseapi.back4app.com';
  Parse parseResult = await Parse().initialize(
      keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
      appName: 'smart-realtor');
  debugPrint('parseResult: ${parseResult.hasParseBeenInitialized()}');
  runApp(const SmartRealtor());
}

class SmartRealtor extends StatelessWidget {
  const SmartRealtor({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Realtor',
      theme:
          ThemeData(primarySwatch: Colors.red, backgroundColor: Colors.white),
      getPages: AppPages.pages,
      initialRoute: AppRouteNames.INITIAL,
      locale: const Locale('en'),
      initialBinding: SplashBinding(),
      navigatorKey: AppConstants.navigatorKey,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }
}
