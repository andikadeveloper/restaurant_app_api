import 'package:flutter/material.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    Key? key,
    required this.restaurant,
    required this.onTap,
    required this.trailing,
  }) : super(key: key);

  final Restaurant restaurant;
  final Function() onTap;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: primaryColor,
        backgroundImage: NetworkImage(
          'https://restaurant-api.dicoding.dev/images/small/' +
              restaurant.pictureId,
        ),
      ),
      title: Text(restaurant.name),
      subtitle: Text(restaurant.city),
      trailing: trailing,
    );
  }
}
