import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';
import 'package:restaurant_app_api/app/theme/app_theme.dart';
import 'package:restaurant_app_api/app/utils/background_service.dart';
import 'package:restaurant_app_api/app/utils/notification_helper.dart';

import 'app/routes/app_pages.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  await AndroidAlarmManager.initialize();

  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

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
