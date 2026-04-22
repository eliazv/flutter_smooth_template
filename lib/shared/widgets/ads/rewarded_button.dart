import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smooth_template/services/services.dart';

class RewardedButton extends ConsumerWidget {
  const RewardedButton({
    super.key,
    required this.label,
    required this.onRewardEarned,
  });

  final String label;
  final void Function(double amount) onRewardEarned;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () async {
        final adsService = ref.read(adsServiceProvider);
        await adsService.showRewarded(
          onRewardEarned: onRewardEarned,
          onDismissed: () {},
        );
      },
      child: Text(label),
    );
  }
}
