import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class UIUtils {
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child:  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: ColorManager.primary ,),
              const SizedBox(width: 20),
              const Text(
                "Loading...",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void hideLoading(BuildContext context) => Navigator.of(context, rootNavigator: true).pop();



  static void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}