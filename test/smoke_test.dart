import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smooth_template/app.dart';

void main() {
  testWidgets('Template app builds', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: TemplateApp()));
    await tester.pumpAndSettle();
    expect(find.byType(ProviderScope), findsOneWidget);
    expect(find.byType(Router<Object>), findsOneWidget);
  });
}
