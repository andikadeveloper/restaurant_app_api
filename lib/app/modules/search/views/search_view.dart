import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app_api/app/controllers/list_restaurant_controller.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/routes/app_pages.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    final listRestaurantController = Get.find<ListRestaurantController>();
    final searchController = Get.put(SearchController());

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController.searchTextController,
          cursorColor: primaryColor,
          decoration: InputDecoration(
            fillColor: Colors.grey[200],
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            suffixIcon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            hintText: 'Ketik nama restoran atau menu',
            hintStyle: Get.textTheme.caption,
          ),
          onChanged: (value) {
            listRestaurantController.onSearch(value);
          },
        ),
        centerTitle: true,
      ),
      body: listRestaurantController.obx(
        (_) {
          // Untuk menampilkan error saat pencarian tidak ditemukan
          if (searchController.searchTextController.text.isEmpty ||
              listRestaurantController.foundedRestaurant.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/not-found.png'),
                    Text(
                      'Sepertinya restoran yang kamu cari tidak ada. Coba cari dengan kata kunci yang lain ya.',
                      style: Get.textTheme.caption,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: listRestaurantController.foundedRestaurant.length,
              itemBuilder: (context, index) {
                Restaurant restaurant =
                    listRestaurantController.foundedRestaurant[index];

                return ListTile(
                  onTap: () {
                    Get.toNamed(Routes.DETAIL, arguments: restaurant.id);
                  },
                  leading: CircleAvatar(
                    backgroundColor: primaryColor,
                    backgroundImage: NetworkImage(
                      'https://restaurant-api.dicoding.dev/images/small/' +
                          restaurant.pictureId,
                    ),
                  ),
                  title: Text(restaurant.name),
                  subtitle: Text(restaurant.city),
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
