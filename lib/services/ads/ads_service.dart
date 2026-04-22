import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class AdsService {
  Future<void> initialize();
  Future<BannerAd?> createBannerAd(AdSize size);
  Future<void> showInterstitial({void Function()? onDismissed});
  Future<void> showRewarded({
    required void Function(double amount) onRewardEarned,
    void Function()? onDismissed,
  });
  void setPremium(bool isPremium);
  bool get isPremium;
}
