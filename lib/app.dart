import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smooth_template/core/config/feature_flags.dart';
import 'package:flutter_smooth_template/core/router/app_router.dart';
import 'package:flutter_smooth_template/core/theme/app_theme.dart';

class TemplateApp extends ConsumerWidget {
  const TemplateApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flags = ref.watch(featureFlagsProvider);
    final router = buildAppRouter(flags);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Smooth Template',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: router,
    );
  }
}
