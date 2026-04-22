import 'package:flutter/material.dart';

class AppBottomSheet {
  const AppBottomSheet._();

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool isScrollControlled = true,
    bool useSafeArea = true,
  }) {
    // Wrapper centralizzato: qui puoi sostituire implementazione con smooth_bottom_sheet.
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      useSafeArea: useSafeArea,
      builder: (_) => child,
    );
  }
}
