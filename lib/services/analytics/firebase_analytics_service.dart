import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_smooth_template/services/analytics/analytics_service.dart';

class FirebaseAnalyticsService implements AnalyticsService {
  FirebaseAnalyticsService(this._analytics);

  final FirebaseAnalytics _analytics;

  @override
  Future<void> initialize() async {}

  @override
  Future<void> setUserId(String? userId) {
    return _analytics.setUserId(id: userId);
  }

  @override
  Future<void> trackEvent(
    String name, {
    Map<String, Object?> parameters = const {},
  }) {
    final payload = <String, Object>{};
    for (final entry in parameters.entries) {
      final value = entry.value;
      if (value != null) {
        payload[entry.key] = value;
      }
    }

    return _analytics.logEvent(
      name: name,
      parameters: payload.isEmpty ? null : payload,
    );
  }
}
