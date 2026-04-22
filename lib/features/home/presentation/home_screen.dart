import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smooth_template/services/services.dart';
import 'package:flutter_smooth_template/shared/widgets/ads/smart_banner.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_smooth_template/features/home/presentation/widgets/home_module_tile.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modules = ref.watch(appModulesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Smooth Template'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Starter kit pronto: attiva solo i moduli che servono in questa app.',
          ),
          const SizedBox(height: 16),
          HomeModuleTile(
            title: 'Onboarding',
            description: 'Flusso iniziale utente',
            enabled: modules.onboardingEnabled,
          ),
          HomeModuleTile(
            title: 'Paywall',
            description: 'Acquisti premium',
            enabled: modules.paywallEnabled,
          ),
          HomeModuleTile(
            title: 'Ads',
            description: 'Banner, interstitial, rewarded',
            enabled: modules.adsEnabled,
          ),
          HomeModuleTile(
            title: 'Analytics',
            description: 'Eventi standard app',
            enabled: modules.analyticsEnabled,
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: modules.onboardingEnabled
                ? () => context.go('/onboarding')
                : null,
            child: const Text('Apri onboarding'),
          ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed:
                modules.paywallEnabled ? () => context.go('/paywall') : null,
            child: const Text('Apri paywall'),
          ),
          const SizedBox(height: 24),
          if (modules.bannerAdsEnabled) const SmartBanner(),
        ],
      ),
    );
  }
}
