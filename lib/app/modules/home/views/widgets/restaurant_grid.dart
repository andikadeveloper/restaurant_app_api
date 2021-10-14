import 'package:flutter/material.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';

import 'restaurant_card.dart';

class RestaurantGrid extends StatelessWidget {
  const RestaurantGrid({
    Key? key,
    required this.restaurants,
  }) : super(key: key);

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: restaurants.length,
      scrollDirection: Axis.horizontal,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (context, index) {
        Restaurant restaurant = restaurants[index];
        return RestaurantCard(
          restaurant: restaurant,
        );
      },
    );
  }
}
