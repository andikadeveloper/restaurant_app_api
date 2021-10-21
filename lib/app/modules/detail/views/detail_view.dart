import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app_api/app/controllers/user_controller.dart';
import 'package:restaurant_app_api/app/modules/detail/views/widgets/list_customer_review.dart';
import 'package:restaurant_app_api/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';
import 'package:restaurant_app_api/app/widgets/my_text_field.dart';

import '../controllers/detail_controller.dart';
import 'widgets/image_with_icon_button.dart';
import 'widgets/restaurant_detail.dart';

class DetailView extends GetView<DetailController> {
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    controller.getRestaurantByID(Get.arguments.toString());

    return Scaffold(
      body: controller.obx(
        (_) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageWithIconButton(
                    imageId: controller.restaurant.pictureId,
                    favoriteButton: GetBuilder<FavoriteController>(
                      builder: (favoriteController) {
                        return IconButton(
                          icon: favoriteController
                                  .checkIsFavorite(controller.restaurant.id)
                              ? Icon(
                                  Icons.favorite,
                                  color: primaryColor,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: primaryColor,
                                ),
                          onPressed: () {
                            if (!favoriteController
                                .checkIsFavorite(controller.restaurant.id)) {
                              favoriteController
                                  .addToFavorite(controller.restaurant);
                            } else {
                              favoriteController
                                  .removeFromFavorite(controller.restaurant.id);
                            }
                          },
                        );
                      },
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: RestaurantDetail(
                    restaurant: controller.restaurant,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Review dari pelanggan:',
                    style: Get.textTheme.headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                ListCustomerReview(
                  listReview: controller.restaurant.customerReviews!,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: MyTextField(
                    controller: controller.reviewTextController,
                    hintText: 'Tambahkan review dari kamu...',
                    onEditingComplete: () {
                      controller.addReview(
                        controller.restaurant.id,
                        userController.user.name ?? 'No name',
                        controller.reviewTextController.text,
                      );

                      controller.reviewTextController.text = '';
                    },
                  ),
                ),
              ],
            ),
          );
        },
        onLoading: Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
        onError: (error) {
          return Center(
            child: Text(
              'Oops, sepertinya ada kesalahan nih. Coba cek koneksi internet kamu ya',
              style: Get.textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
