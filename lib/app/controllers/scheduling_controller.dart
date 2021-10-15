import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_api/app/utils/background_service.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';
import 'package:restaurant_app_api/app/utils/date_time_helper.dart';

class SchedulingController extends GetxController {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduledRestaurant(bool value) async {
    _isScheduled = value;

    if (_isScheduled) {
      update();
      Get.snackbar(
        'Notifikasi',
        'Rekomendasi restoran telah diaktifkan',
        backgroundColor: backGroundColor,
      );

      return await AndroidAlarmManager.periodic(
        Duration(days: 1),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      update();
      Get.snackbar(
        'Notifikasi',
        'Rekomendasi restoran telah dimatikan',
        backgroundColor: backGroundColor,
      );

      return await AndroidAlarmManager.cancel(1);
    }
  }
}
