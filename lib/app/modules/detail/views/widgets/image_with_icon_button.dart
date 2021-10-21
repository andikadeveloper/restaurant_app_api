import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';

class ImageWithIconButton extends StatelessWidget {
  const ImageWithIconButton({
    Key? key,
    required this.imageId,
    required this.favoriteButton,
  }) : super(key: key);

  final String? imageId;
  final Widget favoriteButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 0.8),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (context, ulr) => Center(
                  child: CircularProgressIndicator(
                color: primaryColor,
              )),
              imageUrl: 'https://restaurant-api.dicoding.dev/images/large/' +
                  imageId!,
            ),
          ),
        ),
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: primaryColor,
                ),
              ),
              favoriteButton,
            ],
          ),
        )
      ],
    );
  }
}
