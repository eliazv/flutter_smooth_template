import 'package:flutter_smooth_template/services/ads/ads_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DisabledAdsService implements AdsService {
  bool _isPremium = true;

  @override
  Future<void> initialize() async {}

  @override
  Future<BannerAd?> createBannerAd(AdSize size) async {
    return null;
  }

  @override
  Future<void> showInterstitial({void Function()? onDismissed}) async {
    onDismissed?.call();
  }

  @override
  Future<void> showRewarded({
    required void Function(double amount) onRewardEarned,
    void Function()? onDismissed,
  }) async {
    onDismissed?.call();
  }

  @override
  bool get isPremium => _isPremium;

  @override
  void setPremium(bool isPremium) {
    _isPremium = isPremium;
  }
}
