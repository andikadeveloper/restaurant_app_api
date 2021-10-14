import 'package:get/get.dart';
import 'package:restaurant_app_api/app/data/models/user_model.dart';

class UserController extends GetxController {
  late User user;

  addUser(User newUser) {
    user = newUser;
    update();
  }
}
