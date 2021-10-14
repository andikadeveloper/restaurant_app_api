import 'package:get/get.dart';

import '../models/restaurant_model.dart';

class RestaurantProvider extends GetConnect {
  final String _baseURL = 'https://restaurant-api.dicoding.dev/';

  Future<Restaurant> getRestaurant(String id) async {
    final response = await get(_baseURL + 'detail/$id');

    if (response.statusCode == 200) {
      final data = response.body['restaurant'];

      return Restaurant.fromJson(data);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<List<Restaurant>> getAllRestaurant() async {
    final response = await get(_baseURL + 'list');

    if (response.statusCode == 200) {
      final List data = response.body['restaurants'];

      return data.map((e) => Restaurant.fromJson(e)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<List<CustomerReview>> postReview(
      String restaurantId, String username, String review) async {
    final response = await post(
      _baseURL + "review",
      {
        "id": restaurantId,
        "name": username,
        "review": review,
      },
      headers: {"Content-Type": "application/json", "X-Auth-Token": "12345"},
    );

    if (response.statusCode == 200) {
      final List data = response.body["customerReviews"];

      return data.map((e) => CustomerReview.fromJson(e)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<List<Restaurant>> searchRestaurant(String query) async {
    final response = await get(_baseURL + '/search?q=$query');

    if (response.statusCode == 200) {
      final List data = response.body['restaurants'];

      return data.map((e) => Restaurant.fromJson(e)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }
}
