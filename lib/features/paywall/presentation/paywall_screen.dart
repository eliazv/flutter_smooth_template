import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smooth_template/services/services.dart';
import 'package:flutter_smooth_template/shared/widgets/ui/app_toast.dart';
import 'package:go_router/go_router.dart';

class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paywall')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Sostituisci questa schermata con smooth_paywall nel progetto clonato.',
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () async {
                final purchaseService = ref.read(purchaseServiceProvider);
                final adsService = ref.read(adsServiceProvider);

                final unlocked = await purchaseService.showPaywall();
                if (unlocked) {
                  adsService.setPremium(true);
                  if (context.mounted) {
                    AppToast.show(
                        context, 'Premium attivato. Ads disattivate.');
                  }
                } else {
                  if (context.mounted) {
                    AppToast.show(context, 'Nessun acquisto completato.');
                  }
                }
              },
              child: const Text('Avvia acquisto'),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Torna alla home'),
            ),
          ],
        ),
      ),
    );
  }
}
