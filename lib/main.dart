import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app_api/app/theme/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Restaurant app with API",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: appTheme,
    ),
  );
}
