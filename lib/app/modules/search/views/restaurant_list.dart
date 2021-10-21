import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/routes/app_pages.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';

import '../../../widgets/restaurant_tile.dart';

class RestaurantList extends StatelessWidget {
  RestaurantList({
    Key? key,
    required this.listRestaurant,
  }) : super(key: key);

  final List<Restaurant> listRestaurant;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listRestaurant.length,
      itemBuilder: (context, index) {
        Restaurant restaurant = listRestaurant[index];

        return RestaurantTile(
          restaurant: restaurant,
          trailing: CircleAvatar(
            backgroundColor: primaryColor.withOpacity(0.5),
            foregroundColor: Colors.black54,
            radius: 10,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(restaurant.rating.toString()),
              ),
            ),
          ),
          onTap: () {
            Get.toNamed(Routes.DETAIL, arguments: restaurant.id);
          },
        );
      },
    );
  }
}
