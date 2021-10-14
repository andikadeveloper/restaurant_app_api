import 'package:flutter/material.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';

class ButtonWithLoading extends StatefulWidget {
  final Function() onPress;
  final Widget child;
  const ButtonWithLoading({required this.child, required this.onPress});

  @override
  State<ButtonWithLoading> createState() => _ButtonWithLoadingState();
}

class _ButtonWithLoadingState extends State<ButtonWithLoading> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50),
      ),
      onPressed: () async {
        setState(() {
          _isLoading = true;
        });
        await Future.delayed(Duration(seconds: 2));

        widget.onPress();
      },
      child: _isLoading
          ? CircularProgressIndicator(
              color: backGroundColor,
            )
          : widget.child,
    );
  }
}
