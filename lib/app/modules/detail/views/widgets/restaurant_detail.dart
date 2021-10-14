import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/modules/detail/views/widgets/restaurant_menu.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';

class RestaurantDetail extends StatelessWidget {
  const RestaurantDetail({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: Get.textTheme.headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  restaurant.address!,
                  style: Get.textTheme.caption,
                ),
                Text(
                  restaurant.city,
                  style: Get.textTheme.caption,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Kategori: ',
                  style: Get.textTheme.subtitle2,
                ),
                RichText(
                  text: TextSpan(
                    children: List.generate(
                      restaurant.categories!.length,
                      (index) => TextSpan(
                        text: '#' + restaurant.categories![index].name + ' ',
                        style: Get.textTheme.caption,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 30,
              width: 40,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(2),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                restaurant.rating.toString(),
                style: TextStyle(color: backGroundColor),
              ),
            ),
          ],
        ),
        Divider(),
        Text(
          restaurant.description,
          textAlign: TextAlign.justify,
        ),
        Divider(),
        RestaurantMenu(menus: restaurant.menus!)
      ],
    );
  }
}
