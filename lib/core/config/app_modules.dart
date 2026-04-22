import 'package:flutter_smooth_template/core/config/feature_flags.dart';

class AppModules {
  const AppModules(this.flags);

  final FeatureFlags flags;

  bool get onboardingEnabled => flags.enableOnboarding;
  bool get paywallEnabled => flags.enablePaywall;
  bool get adsEnabled => flags.enableAds;
  bool get analyticsEnabled => flags.enableAnalytics;

  bool get bannerAdsEnabled => adsEnabled && flags.enableBanner;
  bool get interstitialAdsEnabled => adsEnabled && flags.enableInterstitial;
  bool get rewardedAdsEnabled => adsEnabled && flags.enableRewarded;
  bool get unityMediationEnabled => adsEnabled && flags.enableUnityMediation;
}
