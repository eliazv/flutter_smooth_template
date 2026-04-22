import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smooth_template/services/services.dart';
import 'package:flutter_smooth_template/shared/widgets/ui/app_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_toast/smooth_toast.dart';
import 'package:smooth_paywall/smooth_paywall.dart';

class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paywall')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SmoothPaywall(
          title: 'Sblocca Premium',
          subtitle: 'Rimuovi ads e ottieni funzionalita avanzate.',
          features: const [
            PaywallFeature(title: 'Nessuna pubblicita', icon: Icons.block),
            PaywallFeature(title: 'Accesso completo', icon: Icons.star),
            PaywallFeature(
                title: 'Supporto prioritario', icon: Icons.support_agent),
          ],
          plans: const [
            PaywallPlan(
              id: 'yearly',
              title: 'Annuale',
              priceLabel: '24.99 EUR',
              periodLabel: '/anno',
              badge: 'Miglior valore',
            ),
            PaywallPlan(
              id: 'monthly',
              title: 'Mensile',
              priceLabel: '4.99 EUR',
              periodLabel: '/mese',
            ),
          ],
          onPurchase: (selectedPlan) async {
            final purchaseService = ref.read(purchaseServiceProvider);
            final adsService = ref.read(adsServiceProvider);

            final unlocked = await purchaseService.showPaywall();
            if (unlocked) {
              adsService.setPremium(true);
              if (context.mounted) {
                AppToast.show(
                  context,
                  'Premium attivato. Ads disattivate.',
                  type: SmoothToastType.success,
                );
              }
              return const PaywallActionResult.success();
            }

            if (context.mounted) {
              AppToast.show(
                context,
                'Acquisto non completato.',
                type: SmoothToastType.warning,
              );
            }
            return const PaywallActionResult.cancelled();
          },
          onClose: () => context.go('/home'),
        ),
      ),
    );
  }
}
