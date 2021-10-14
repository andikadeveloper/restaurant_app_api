import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.menuItems,
    required this.menuIcon,
  }) : super(key: key);

  final List<Category> menuItems;
  final IconData menuIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.2,
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final menu = menuItems[index].name;

          return Card(
            color: primaryColor.withOpacity(0.5),
            margin: const EdgeInsets.only(right: 10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Spacer(),
                  Expanded(
                    child: Text(
                      menu,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(child: Icon(menuIcon))
                ],
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
      ),
    );
  }
}
