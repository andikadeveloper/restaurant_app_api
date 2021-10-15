import 'dart:isolate';
import 'dart:math';

import 'dart:ui';

import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/data/providers/restaurant_provider.dart';
import 'package:restaurant_app_api/app/utils/notification_helper.dart';

import '../../main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _service;
  static String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._createObject();

  factory BackgroundService() {
    if (_service == null) {
      _service = BackgroundService._createObject();
    }
    return _service!;
  }

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> callback() async {
    final NotificationHelper _notificationHelper = NotificationHelper();
    var result = await RestaurantProvider().getAllRestaurant();

    Restaurant restaurant = result[Random().nextInt(result.length)];

    await _notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, restaurant);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
