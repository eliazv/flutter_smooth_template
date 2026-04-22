import 'package:flutter/material.dart';
import 'package:smooth_toast/smooth_toast.dart';

class AppToast {
  const AppToast._();

  static void show(
    BuildContext context,
    String message, {
    SmoothToastType type = SmoothToastType.info,
  }) {
    SmoothToast.show(
      context,
      message: message,
      type: type,
    );
  }
}
