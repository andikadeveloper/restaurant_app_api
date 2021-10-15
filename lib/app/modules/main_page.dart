import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_api/app/controllers/list_restaurant_controller.dart';
import 'package:restaurant_app_api/app/modules/favorite/views/favorite_view.dart';
import 'package:restaurant_app_api/app/modules/home/views/home_view.dart';
import 'package:restaurant_app_api/app/modules/search/views/search_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final listRestaurantController =
      Get.put(ListRestaurantController(), permanent: true);

  int _navbarIndex = 0;

  final _listPage = [
    HomeView(),
    SearchView(),
    FavoriteView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listPage[_navbarIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navbarIndex,
        onTap: (index) {
          setState(() {
            _navbarIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favorite'),
        ],
      ),
    );
  }
}
