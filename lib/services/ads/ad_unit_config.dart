import 'package:flutter/foundation.dart';

class AdUnitConfig {
  const AdUnitConfig({
    required this.banner,
    required this.interstitial,
    required this.rewarded,
  });

  final String banner;
  final String interstitial;
  final String rewarded;

  factory AdUnitConfig.fromEnvironment() {
    const banner = String.fromEnvironment('ADMOB_BANNER_ID', defaultValue: '');
    const interstitial =
        String.fromEnvironment('ADMOB_INTERSTITIAL_ID', defaultValue: '');
    const rewarded =
        String.fromEnvironment('ADMOB_REWARDED_ID', defaultValue: '');

    if (banner.isNotEmpty || interstitial.isNotEmpty || rewarded.isNotEmpty) {
      return const AdUnitConfig(
        banner: banner,
        interstitial: interstitial,
        rewarded: rewarded,
      );
    }

    // Test IDs di default per sviluppo.
    if (kIsWeb) {
      return const AdUnitConfig(banner: '', interstitial: '', rewarded: '');
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const AdUnitConfig(
          banner: 'ca-app-pub-3940256099942544/6300978111',
          interstitial: 'ca-app-pub-3940256099942544/1033173712',
          rewarded: 'ca-app-pub-3940256099942544/5224354917',
        );
      case TargetPlatform.iOS:
        return const AdUnitConfig(
          banner: 'ca-app-pub-3940256099942544/2934735716',
          interstitial: 'ca-app-pub-3940256099942544/4411468910',
          rewarded: 'ca-app-pub-3940256099942544/1712485313',
        );
      default:
        return const AdUnitConfig(banner: '', interstitial: '', rewarded: '');
    }
  }
}
