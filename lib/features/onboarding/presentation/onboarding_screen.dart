import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_onboarding/smooth_onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingGate(
      storageKey: 'onboarding_template',
      pages: const [
        OnboardingPage(
          title: 'Benvenuto',
          body: Text('Template pronto per nuove app Flutter.'),
        ),
        OnboardingPage(
          title: 'Architettura moderna',
          body: Text('Feature-first, Riverpod, router e servizi pluggabili.'),
        ),
        OnboardingPage(
          title: 'Pronto a partire',
          body: Text(
              'Configura flags e provider, poi sviluppa la prima feature.'),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Onboarding completato')),
        body: Center(
          child: FilledButton(
            onPressed: () => context.go('/home'),
            child: const Text('Vai alla home'),
          ),
        ),
      ),
    );
  }
}
