import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/ui/widgets/snack_bar_body.dart';

class UiHelper {
  static void showSnackBar({
    required BuildContext context,
    required String message,
    bool isErrorSnackBar = false,
  }) {
    var snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      content: SnackBarBody(
        backgroundColor: isErrorSnackBar
            ? const Color(0xFFFFEEEF)
            : const Color(0xFFD4FFFE),
        color: isErrorSnackBar
            ? const Color(0xFFE77282)
            : const Color(0xFF009688),
        message: message,
        iconData: isErrorSnackBar ? Icons.error : Icons.check_circle,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
