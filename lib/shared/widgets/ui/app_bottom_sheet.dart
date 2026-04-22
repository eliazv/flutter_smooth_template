import 'package:flutter/material.dart';
import 'package:smooth_bottom_sheet/smooth_bottom_sheet.dart';

class AppBottomSheet {
  const AppBottomSheet._();

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    String? subtitle,
  }) {
    return showSmoothBottomSheet<T>(
      context: context,
      title: title,
      subtitle: subtitle,
      child: child,
    );
  }
}
