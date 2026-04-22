import 'package:flutter_smooth_template/services/ads/admob_ads_service.dart';

class UnityMediationAdsService extends AdMobAdsService {
  UnityMediationAdsService({required super.config});

  // Nota: la mediazione Unity con AdMob viene configurata lato dashboard + adapter native.
  // Il codice Dart resta equivalente all'implementazione AdMob.
}
