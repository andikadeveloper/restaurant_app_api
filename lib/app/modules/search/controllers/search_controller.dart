import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  late TextEditingController searchTextController;

  @override
  void onInit() {
    super.onInit();

    searchTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    searchTextController.dispose();
  }
}
