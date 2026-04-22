abstract class AnalyticsService {
  Future<void> initialize();
  Future<void> trackEvent(String name,
      {Map<String, Object?> parameters = const {}});
  Future<void> setUserId(String? userId);
}
