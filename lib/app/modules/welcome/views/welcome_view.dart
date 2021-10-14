import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app_api/app/routes/app_pages.dart';

import '../../../widgets/button_with_loading.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Padding buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Spacer(),
          Column(
            children: [
              Image.asset('assets/images/welcome.png'),
              Text(
                'Selamat datang di Aplikasi rekomendasi restoran',
                textAlign: TextAlign.center,
                style: Get.textTheme.headline6!
                    .copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
          Spacer(),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: ButtonWithLoading(
              child: Text('Mulai'),
              onPress: () {
                Get.offAllNamed(Routes.LOGIN);
              },
            ),
          ),
        ],
      ),
    );
  }
}
