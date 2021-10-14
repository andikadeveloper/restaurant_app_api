import 'package:flutter/material.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    primary: primaryColor,
    onPrimary: backGroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);
