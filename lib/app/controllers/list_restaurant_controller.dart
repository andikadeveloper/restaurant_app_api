import 'package:get/get.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/data/providers/restaurant_provider.dart';
import 'package:http/http.dart' as http;

class ListRestaurantController extends GetxController
    with StateMixin<List<Restaurant>> {
  late RestaurantProvider _restaurantProvider;

  var restaurants = <Restaurant>[].obs;

  // Restauran yang berhasil dicari di pencarian
  var foundedRestaurant = <Restaurant>[].obs;

  // Favorite restaurant
  var favoriteRestaurant = <Restaurant>[].obs;

  void getAllRestaurant() async {
    change(null, status: RxStatus.loading());

    try {
      restaurants.value = await _restaurantProvider.getAllRestaurant();

      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  void onSearch(String text) async {
    if (text.isNotEmpty) {
      change(null, status: RxStatus.loading());

      try {
        foundedRestaurant.value =
            await _restaurantProvider.searchRestaurant(text);

        change(null, status: RxStatus.success());
      } catch (e) {
        change(null, status: RxStatus.error());
      }
    } else {
      change(null, status: RxStatus.success());
      foundedRestaurant.value = [];
    }
  }

  void addToFavorite(Restaurant restaurant) {
    favoriteRestaurant.add(restaurant);
  }

  void removeFromFavorite(Restaurant restaurant) {
    favoriteRestaurant.remove(restaurant);
    update();
  }

  bool checkIsFavorite(String restaurantId) {
    bool isFavorite = false;

    if (favoriteRestaurant.isNotEmpty) {
      favoriteRestaurant.forEach(
        (element) {
          if (element.id == restaurantId) {
            isFavorite = true;
          }
        },
      );
    }
    return isFavorite;
  }

  @override
  void onInit() {
    super.onInit();
    _restaurantProvider = RestaurantProvider(client: http.Client());

    getAllRestaurant();
  }
}
