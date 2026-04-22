import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeatureFlags {
  const FeatureFlags({
    required this.enableOnboarding,
    required this.enablePaywall,
    required this.enableAds,
    required this.enableBanner,
    required this.enableInterstitial,
    required this.enableRewarded,
    required this.enableUnityMediation,
    required this.enableAnalytics,
    required this.enableRemoteConfig,
    required this.enableAuth,
    required this.enableBackendSync,
  });

  final bool enableOnboarding;
  final bool enablePaywall;
  final bool enableAds;
  final bool enableBanner;
  final bool enableInterstitial;
  final bool enableRewarded;
  final bool enableUnityMediation;
  final bool enableAnalytics;
  final bool enableRemoteConfig;
  final bool enableAuth;
  final bool enableBackendSync;

  factory FeatureFlags.fromEnvironment() {
    return const FeatureFlags(
      enableOnboarding:
          bool.fromEnvironment('ENABLE_ONBOARDING', defaultValue: true),
      enablePaywall: bool.fromEnvironment('ENABLE_PAYWALL', defaultValue: true),
      enableAds: bool.fromEnvironment('ENABLE_ADS', defaultValue: true),
      enableBanner:
          bool.fromEnvironment('ENABLE_BANNER_ADS', defaultValue: true),
      enableInterstitial:
          bool.fromEnvironment('ENABLE_INTERSTITIAL_ADS', defaultValue: true),
      enableRewarded:
          bool.fromEnvironment('ENABLE_REWARDED_ADS', defaultValue: true),
      enableUnityMediation:
          bool.fromEnvironment('ENABLE_UNITY_MEDIATION', defaultValue: false),
      enableAnalytics:
          bool.fromEnvironment('ENABLE_ANALYTICS', defaultValue: true),
      enableRemoteConfig:
          bool.fromEnvironment('ENABLE_REMOTE_CONFIG', defaultValue: false),
      enableAuth: bool.fromEnvironment('ENABLE_AUTH', defaultValue: false),
      enableBackendSync:
          bool.fromEnvironment('ENABLE_BACKEND_SYNC', defaultValue: false),
    );
  }
}

final featureFlagsProvider = Provider<FeatureFlags>((ref) {
  return FeatureFlags.fromEnvironment();
});
