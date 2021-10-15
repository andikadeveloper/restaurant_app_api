import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:restaurant_app_api/app/routes/app_pages.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';
import 'package:restaurant_app_api/app/widgets/restaurant_tile.dart';

class FavoriteView extends GetView<FavoriteController> {
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
        body: GetBuilder<FavoriteController>(
          init: FavoriteController(),
          builder: (controller) {
            List<Restaurant> restaurants = controller.favoriteRestaurant;

            if (restaurants.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/not-found.png'),
                      Text(
                        'Hmm..., sepertinya kamu belum memiliki restoran favorit nih.',
                        style: Get.textTheme.caption,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              );
            }

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
                    icon: controller.checkIsFavorite(restaurant.id)
                        ? Icon(
                            Icons.favorite,
                            color: primaryColor,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: primaryColor,
                          ),
                    onPressed: () {
                      controller.removeFromFavorite(restaurant.id);
                    },
                  ),
                );
              },
            );
          },
        ));
  }
}
