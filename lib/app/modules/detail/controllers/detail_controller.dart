import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/data/providers/restaurant_provider.dart';

class DetailController extends GetxController with StateMixin<Restaurant> {
  late RestaurantProvider _restaurantProvider;
  late TextEditingController reviewTextController;
  late Restaurant restaurant;

  void getRestaurantByID(String id) async {
    change(null, status: RxStatus.loading());

    try {
      restaurant = await _restaurantProvider.getRestaurant(id);

      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  void addReview(String restaurantId, String username, String review) async {
    change(null, status: RxStatus.loading());

    try {
      restaurant.customerReviews =
          await _restaurantProvider.postReview(restaurantId, username, review);

      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  @override
  void onInit() {
    super.onInit();
    reviewTextController = TextEditingController();

    _restaurantProvider = RestaurantProvider();
  }

  @override
  void dispose() {
    super.dispose();

    reviewTextController.dispose();
  }
}
