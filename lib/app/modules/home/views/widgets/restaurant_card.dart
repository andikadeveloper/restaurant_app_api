import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/routes/app_pages.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL, arguments: restaurant.id);
      },
      child: Card(
        elevation: 0.5,
        shadowColor: Colors.grey,
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://restaurant-api.dicoding.dev/images/small/' +
                          restaurant.pictureId,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    restaurant.name,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    restaurant.city,
                    style: Get.textTheme.caption,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
