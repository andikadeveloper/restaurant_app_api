import 'package:get/get.dart';

import 'package:restaurant_app_api/app/modules/detail/bindings/detail_binding.dart';
import 'package:restaurant_app_api/app/modules/detail/views/detail_view.dart';
import 'package:restaurant_app_api/app/modules/home/views/home_view.dart';
import 'package:restaurant_app_api/app/modules/login/bindings/login_binding.dart';
import 'package:restaurant_app_api/app/modules/login/views/login_view.dart';
import 'package:restaurant_app_api/app/modules/search/bindings/search_binding.dart';
import 'package:restaurant_app_api/app/modules/search/views/search_view.dart';
import 'package:restaurant_app_api/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
  ];
}
