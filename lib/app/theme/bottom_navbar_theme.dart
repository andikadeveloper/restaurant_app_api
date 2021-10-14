import 'package:flutter/material.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';

final bottomNavbarTheme = BottomNavigationBarThemeData(
  backgroundColor: backGroundColor,
  elevation: 5,
  selectedIconTheme: IconThemeData(color: primaryColor),
  unselectedIconTheme: IconThemeData(color: Colors.black54),
  type: BottomNavigationBarType.fixed,
  showSelectedLabels: false,
  showUnselectedLabels: false,
);
