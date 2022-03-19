import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {

  CustomSnackBar({
    Key? key,
    required String message,
    String btnLabel = 'OK',
    Duration duration = const Duration(seconds: 2),
    VoidCallback? onPressed
  }) : super(
    key: key,
    content: Text(message),
    duration: duration,
    action: onPressed == null ? null : SnackBarAction(
      onPressed: onPressed,
      label: btnLabel, 
    )
  );
}