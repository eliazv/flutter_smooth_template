import 'package:flutter/material.dart';

class AppToast {
  const AppToast._();

  static void show(
    BuildContext context,
    String message, {
    Color? backgroundColor,
  }) {
    // Wrapper centralizzato: qui puoi sostituire implementazione con smooth_toast.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
