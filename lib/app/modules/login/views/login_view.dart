import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app_api/app/controllers/user_controller.dart';
import 'package:restaurant_app_api/app/data/models/user_model.dart';
import 'package:restaurant_app_api/app/modules/main_page.dart';
import 'package:restaurant_app_api/app/widgets/my_text_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final userController = Get.put(UserController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/login.png'),
              MyTextField(
                hintText: 'Nama',
                controller: controller.nameController,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                hintText: 'Email',
                controller: controller.emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                hintText: 'Password',
                controller: controller.passwordController,
                isPassword: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Masuk'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: () {
                  User user = User(
                    id: DateTime.now().toString(),
                    email: controller.emailController.text,
                    name: controller.nameController.text,
                    password: controller.passwordController.text,
                  );
                  userController.addUser(user);

                  Get.offAll(MainPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
