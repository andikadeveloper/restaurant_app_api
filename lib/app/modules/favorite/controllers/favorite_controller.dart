import 'package:get/get.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/utils/database_helper.dart';

class FavoriteController extends GetxController {
  late DatabaseHelper _databaseHelper;

  // Favorite restaurant
  var _favoriteRestaurant = <Restaurant>[];

  List<Restaurant> get favoriteRestaurant => _favoriteRestaurant;

  void getFavoriteRestaurants() async {
    _favoriteRestaurant = await _databaseHelper.getFavoriteRestaurants();
    update();
  }

  void addToFavorite(Restaurant restaurant) async {
    await _databaseHelper.addToFavorite(restaurant);
    getFavoriteRestaurants();
  }

  void removeFromFavorite(String id) async {
    await _databaseHelper.removeFromFavorite(id);
    getFavoriteRestaurants();
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

    _databaseHelper = DatabaseHelper();
  }
}
