import 'package:flutter_smooth_template/services/purchases/purchase_service.dart';

class DisabledPurchaseService implements PurchaseService {
  @override
  Future<void> initialize() async {}

  @override
  Future<bool> isPremium() async => false;

  @override
  Future<void> restorePurchases() async {}

  @override
  Future<bool> showPaywall() async => false;
}
