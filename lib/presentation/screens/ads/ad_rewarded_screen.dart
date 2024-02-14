import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AdRewardedScreen extends ConsumerWidget {
  const AdRewardedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adsRewardPoints = ref.watch(adsRewardPointsProvider);
    final adRewardedAsync = ref.watch(adRewardedProvider);

    ref.listen(adRewardedProvider, (previous, next) {
      if (next.hasError) return;
      if (next.isLoading) return;
      if (!next.hasValue) return;
      if (next.value == null) return;

      next.value!.show(onUserEarnedReward: (ad, reward) {
        ref.read(adsRewardPointsProvider.notifier).update((state) => state + reward.amount.toInt());
       });
    });

    if (adRewardedAsync.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // if (adsAreVisible && adRewardedAsync.hasValue && adRewardedAsync.value != null) {
    //   adRewardedAsync.value!.show(onUserEarnedReward: (ad, reward) {
    //     ref.read(adsRewardPointsProvider.notifier).update((state) => state + reward.amount.toInt());
    //    });
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Rewarded Screen'),
      ),
      body: Center(
        child: Text('Ya lograste $adsRewardPoints puntos!', style: const TextStyle(fontSize: 26),),
      ),
    );
  }
}