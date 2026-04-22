abstract class PurchaseService {
  Future<void> initialize();
  Future<bool> isPremium();
  Future<bool> showPaywall();
  Future<void> restorePurchases();
}
