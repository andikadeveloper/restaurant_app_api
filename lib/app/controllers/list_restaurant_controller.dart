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

  @override
  void onInit() {
    super.onInit();
    _restaurantProvider = RestaurantProvider(client: http.Client());

    getAllRestaurant();
  }
}
