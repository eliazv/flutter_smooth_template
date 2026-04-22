import 'package:flutter_smooth_template/services/analytics/analytics_service.dart';

class DisabledAnalyticsService implements AnalyticsService {
  @override
  Future<void> initialize() async {}

  @override
  Future<void> setUserId(String? userId) async {}

  @override
  Future<void> trackEvent(
    String name, {
    Map<String, Object?> parameters = const {},
  }) async {}
}
