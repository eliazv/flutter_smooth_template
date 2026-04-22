import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smooth_template/core/config/ads_provider_config.dart';
import 'package:flutter_smooth_template/core/config/app_modules.dart';
import 'package:flutter_smooth_template/core/config/feature_flags.dart';
import 'package:flutter_smooth_template/services/ads/ad_unit_config.dart';
import 'package:flutter_smooth_template/services/ads/admob_ads_service.dart';
import 'package:flutter_smooth_template/services/ads/ads_service.dart';
import 'package:flutter_smooth_template/services/ads/disabled_ads_service.dart';
import 'package:flutter_smooth_template/services/ads/unity_mediation_ads_service.dart';
import 'package:flutter_smooth_template/services/analytics/analytics_service.dart';
import 'package:flutter_smooth_template/services/analytics/disabled_analytics_service.dart';
import 'package:flutter_smooth_template/services/analytics/firebase_analytics_service.dart';
import 'package:flutter_smooth_template/services/purchases/disabled_purchase_service.dart';
import 'package:flutter_smooth_template/services/purchases/purchase_service.dart';
import 'package:flutter_smooth_template/services/purchases/revenuecat_purchase_service.dart';
import 'package:flutter_smooth_template/services/storage/memory_storage_service.dart';
import 'package:flutter_smooth_template/services/storage/storage_service.dart';

final appModulesProvider = Provider<AppModules>((ref) {
  final flags = ref.watch(featureFlagsProvider);
  return AppModules(flags);
});

final adsProviderConfigProvider = Provider<AdsProviderConfig>((ref) {
  return AdsProviderConfig.fromEnvironment();
});

final storageServiceProvider = Provider<StorageService>((ref) {
  // Default del template: in-memory, sostituibile app per app.
  return MemoryStorageService();
});

final purchaseServiceProvider = Provider<PurchaseService>((ref) {
  final modules = ref.watch(appModulesProvider);
  if (!modules.paywallEnabled) {
    return DisabledPurchaseService();
  }
  return RevenueCatPurchaseService();
});

final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  final modules = ref.watch(appModulesProvider);
  if (!modules.analyticsEnabled) {
    return DisabledAnalyticsService();
  }
  return FirebaseAnalyticsService(FirebaseAnalytics.instance);
});

final adsServiceProvider = Provider<AdsService>((ref) {
  final modules = ref.watch(appModulesProvider);
  if (!modules.adsEnabled) {
    return DisabledAdsService();
  }

  final config = ref.watch(adsProviderConfigProvider);
  final adUnitConfig = AdUnitConfig.fromEnvironment();

  switch (config.provider) {
    case AdsProvider.disabled:
      return DisabledAdsService();
    case AdsProvider.unityMediation:
      return UnityMediationAdsService(config: adUnitConfig);
    case AdsProvider.hybrid:
      // Base pronta: puoi specializzare fallback banner/interstitial/rewarded.
      return UnityMediationAdsService(config: adUnitConfig);
    case AdsProvider.admob:
      return AdMobAdsService(config: adUnitConfig);
  }
});
