import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();

    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
