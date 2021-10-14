import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';

import 'menu_card.dart';

class RestaurantMenu extends StatelessWidget {
  const RestaurantMenu({Key? key, required this.menus}) : super(key: key);

  final Menus menus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Menu makanan: ',
          style: Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
        ),
        MenuCard(
          menuItems: menus.foods,
          menuIcon: Icons.food_bank_sharp,
        ),
        Text(
          'Menu minuman: ',
          style: Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
        ),
        MenuCard(
          menuItems: menus.drinks,
          menuIcon: Icons.local_drink_sharp,
        )
      ],
    );
  }
}
