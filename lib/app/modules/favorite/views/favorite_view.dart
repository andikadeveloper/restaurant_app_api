import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app_api/app/controllers/list_restaurant_controller.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/routes/app_pages.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';
import 'package:restaurant_app_api/app/widgets/restaurant_tile.dart';

class FavoriteView extends StatelessWidget {
  final listRestaurantController = Get.find<ListRestaurantController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Your favorite restaurant',
          style: Get.textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: listRestaurantController.obx(
        (state) {
          List<Restaurant> restaurants =
              listRestaurantController.favoriteRestaurant;

          if (restaurants.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/not-found.png'),
                    Text(
                      'Sepertinya kamu tidak memiliki restoran favorit nih. Coba tambahkan restoran favoritmu disini ya.',
                      style: Get.textTheme.caption,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                Restaurant restaurant = restaurants[index];

                return RestaurantTile(
                  restaurant: restaurant,
                  onTap: () {
                    Get.toNamed(Routes.DETAIL, arguments: restaurant.id);
                  },
                  trailing: IconButton(
                    icon:
                        listRestaurantController.checkIsFavorite(restaurant.id)
                            ? Icon(
                                Icons.favorite,
                                color: primaryColor,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: primaryColor,
                              ),
                    onPressed: () {
                      if (listRestaurantController
                          .checkIsFavorite(restaurant.id)) {
                        listRestaurantController.removeFromFavorite(restaurant);
                      } else {}
                    },
                  ),
                );
              },
            );
          }
        },
        onError: (err) {
          return Center(
            child: Text(
              'Oops, sepertinya ada kesalahan nih. Coba cek koneksi internet kamu ya',
              style: Get.textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
          );
        },
        onLoading: Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
