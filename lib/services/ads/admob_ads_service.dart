import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_smooth_template/services/ads/ad_unit_config.dart';
import 'package:flutter_smooth_template/services/ads/ads_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobAdsService implements AdsService {
  AdMobAdsService({required AdUnitConfig config}) : _config = config;

  final AdUnitConfig _config;
  bool _isPremium = false;

  @override
  bool get isPremium => _isPremium;

  @override
  void setPremium(bool isPremium) {
    _isPremium = isPremium;
  }

  @override
  Future<void> initialize() async {
    if (kIsWeb) return;
    await MobileAds.instance.initialize();
  }

  @override
  Future<BannerAd?> createBannerAd(AdSize size) async {
    if (_isPremium || _config.banner.isEmpty || kIsWeb) return null;

    final completer = Completer<BannerAd?>();
    final ad = BannerAd(
      adUnitId: _config.banner,
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) => completer.complete(ad as BannerAd),
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          completer.complete(null);
        },
      ),
    );
    ad.load();
    return completer.future;
  }

  @override
  Future<void> showInterstitial({void Function()? onDismissed}) async {
    if (_isPremium || _config.interstitial.isEmpty || kIsWeb) {
      onDismissed?.call();
      return;
    }

    InterstitialAd.load(
      adUnitId: _config.interstitial,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              onDismissed?.call();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              onDismissed?.call();
            },
          );
          ad.show();
        },
        onAdFailedToLoad: (error) {
          onDismissed?.call();
        },
      ),
    );
  }

  @override
  Future<void> showRewarded({
    required void Function(double amount) onRewardEarned,
    void Function()? onDismissed,
  }) async {
    if (_isPremium || _config.rewarded.isEmpty || kIsWeb) {
      onDismissed?.call();
      return;
    }

    RewardedAd.load(
      adUnitId: _config.rewarded,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              onDismissed?.call();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              onDismissed?.call();
            },
          );
          ad.show(
            onUserEarnedReward: (ad, reward) {
              onRewardEarned(reward.amount.toDouble());
            },
          );
        },
        onAdFailedToLoad: (error) {
          onDismissed?.call();
        },
      ),
    );
  }
}
