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
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/login.png'),
                MyTextField(
                  hintText: 'Nama',
                  controller: controller.nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama wajib diisi';
                    } else if (value.length < 6) {
                      return 'Nama harus memiliki panjang minimal 6 karakter';
                    }
                  },
                  onChanged: (value) {
                    _formKey.currentState!.validate();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  hintText: 'Email',
                  controller: controller.emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email wajib diisi';
                    } else if (!GetUtils.isEmail(value)) {
                      return 'Email anda tidak valid';
                    }
                  },
                  onChanged: (value) {
                    _formKey.currentState!.validate();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  hintText: 'Password',
                  controller: controller.passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password wajib diisi';
                    } else if (value.length < 8) {
                      return 'Password harus memiliki panjang minimal 8 karakter';
                    }
                  },
                  onChanged: (value) {
                    _formKey.currentState!.validate();
                  },
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
                    if (_formKey.currentState!.validate()) {
                      User user = User(
                      id: DateTime.now().toString(),
                      email: controller.emailController.text,
                      name: controller.nameController.text,
                      password: controller.passwordController.text,
                      );
                      userController.addUser(user);
                      Get.offAll(MainPage());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
