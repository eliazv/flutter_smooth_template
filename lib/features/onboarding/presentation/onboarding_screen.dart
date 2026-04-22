import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smooth_template/shared/widgets/ads/rewarded_button.dart';
import 'package:flutter_smooth_template/shared/widgets/ui/app_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Sostituisci questa schermata con smooth_onboarding nel progetto clonato.',
            ),
            const SizedBox(height: 16),
            RewardedButton(
              label: 'Guarda rewarded demo',
              onRewardEarned: (amount) {
                AppBottomSheet.show<void>(
                  context: context,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('Reward ricevuta: $amount'),
                  ),
                );
              },
            ),
            const Spacer(),
            FilledButton(
              onPressed: () => context.go('/home'),
              child: const Text('Continua'),
            ),
          ],
        ),
      ),
    );
  }
}
