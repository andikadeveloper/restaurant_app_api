import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.onChanged,
    this.onEditingComplete,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final ValueChanged? onChanged;
  final Function()? onEditingComplete;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  // Untuk mengecek password
  bool _isPassVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: primaryColor,
      autocorrect: false,
      obscureText: widget.isPassword == true ? _isPassVisible : false,
      style: Get.textTheme.bodyText2,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Wajib diisi';
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        hintText: widget.hintText,
        hintStyle: Get.textTheme.bodyText2!.copyWith(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryColor),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isPassVisible = !_isPassVisible;
                  });
                },
                icon: _isPassVisible
                    ? Icon(
                        Icons.visibility,
                        color: primaryColor,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
              )
            : null,
      ),
    );
  }
}
