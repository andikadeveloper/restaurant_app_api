import 'package:flutter/material.dart';
import 'package:restaurant_app_api/app/theme/app_bar_theme.dart';
import 'package:restaurant_app_api/app/theme/bottom_navbar_theme.dart';
import 'package:restaurant_app_api/app/theme/elevated_button_theme.dart';
import 'package:restaurant_app_api/app/theme/text_theme.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';

final appTheme = ThemeData(
  primaryColor: primaryColor,
  textTheme: textTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: backGroundColor,
  appBarTheme: appBarTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  bottomNavigationBarTheme: bottomNavbarTheme,
);
