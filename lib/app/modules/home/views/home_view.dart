import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app_api/app/controllers/list_restaurant_controller.dart';
import 'package:restaurant_app_api/app/controllers/scheduling_controller.dart';
import 'package:restaurant_app_api/app/controllers/user_controller.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';

import 'widgets/restaurant_grid.dart';

class HomeView extends StatelessWidget {
  final listRestaurantController = Get.find<ListRestaurantController>();
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(userController.user.name!),
              accountEmail: Text(userController.user.email!),
              currentAccountPicture: CircleAvatar(
                backgroundColor: backGroundColor,
                child: Icon(
                  Icons.person,
                  color: primaryColor,
                ),
              ),
              currentAccountPictureSize: Size.square(50),
            ),
            GetBuilder<SchedulingController>(
              init: SchedulingController(),
              builder: (scheduling) {
                return SwitchListTile(
                  title: Text('Notif rekomendasi restoran'),
                  activeColor: primaryColor,
                  value: scheduling.isScheduled,
                  onChanged: (value) {
                    scheduling.scheduledRestaurant(value);
                  },
                );
              },
            )
          ],
        ),
      ),
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/home.png'),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Rekomendasi untukmu',
              style: Get.textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: buildRestaurantGrid(),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Semua restoran',
              style: Get.textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: buildRestaurantGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRestaurantGrid() {
    return listRestaurantController.obx(
      (_) {
        return RestaurantGrid(
          restaurants: listRestaurantController.restaurants,
        );
      },
      onLoading: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      ),
      onError: (_) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            'Oops, sepertinya ada kesalahan nih. Coba cek koneksi internet kamu ya',
            style: Get.textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: 'Restaurant',
                style: Get.textTheme.headline6!
                    .copyWith(fontWeight: FontWeight.bold)),
            TextSpan(
              text: ' App',
              style: Get.textTheme.headline6!
                  .copyWith(color: primaryColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
