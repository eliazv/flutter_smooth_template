import 'package:flutter_smooth_template/services/purchases/purchase_service.dart';

class RevenueCatPurchaseService implements PurchaseService {
  bool _isPremium = false;

  @override
  Future<void> initialize() async {
    // Integrazione reale da completare nel progetto clonato:
    // - configure SDK RevenueCat
    // - identify user
    // - preload offerings
  }

  @override
  Future<bool> isPremium() async => _isPremium;

  @override
  Future<void> restorePurchases() async {
    // TODO: integrare restore tramite SDK RevenueCat.
  }

  @override
  Future<bool> showPaywall() async {
    // TODO: integrare smooth_paywall + RevenueCat.
    return _isPremium;
  }

  void setPremiumForTesting(bool value) {
    _isPremium = value;
  }
}
