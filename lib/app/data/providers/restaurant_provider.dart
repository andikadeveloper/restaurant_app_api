import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/restaurant_model.dart';

class RestaurantProvider {
  final String _baseURL = 'https://restaurant-api.dicoding.dev/';
  late final http.Client client;

  RestaurantProvider({required this.client});

  Future<Restaurant> getRestaurant(String id) async {
    final Uri url = Uri.parse(_baseURL + 'detail/$id');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body)['restaurant'];

      return Restaurant.fromJson(res);
    } else {
      throw Exception('Failed to load data restaurant');
    }
  }

  Future<List<Restaurant>> getAllRestaurant() async {
    final Uri url = Uri.parse(_baseURL + 'list');

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)['restaurants'];

      return data.map((e) => Restaurant.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data restaurants');
    }
  }

  Future<List<CustomerReview>> postReview(
      String restaurantId, String username, String review) async {
    final Uri url = Uri.parse(_baseURL + "review");
    final response = await client.post(
      url,
      body: {
        "id": restaurantId,
        "name": username,
        "review": review,
      },
      headers: {"Content-Type": "application/json", "X-Auth-Token": "12345"},
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)["customerReviews"];

      return data.map((e) => CustomerReview.fromJson(e)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<List<Restaurant>> searchRestaurant(String query) async {
    final Uri url = Uri.parse(_baseURL + '/search?q=$query');

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)['restaurants'];

      return data.map((e) => Restaurant.fromJson(e)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }
}
