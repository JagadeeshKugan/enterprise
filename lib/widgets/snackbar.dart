import 'package:flutter/material.dart';

class GlobalSnackBar {
  final String message;

  const GlobalSnackBar({
    required this.message,
  });

  static void show(BuildContext context, String message, Color co) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 10.0,
        //behavior: SnackBarBehavior.floating,
        content: Text(message),
        duration: const Duration(seconds: 5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: co,
        action: SnackBarAction(
          textColor: const Color(0xFFFAF2FB),
          label: 'close',
          onPressed: () {},
        ),
      ),
    );
  }
}
