import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/presentation/widgets/widgets.dart';

import '../../providers/providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final adBannerAsync = ref.watch(adBannerProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: const Text('Sensores y Permisos'),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () => context.push('/permissions'),
                      ),
                    ],
                  ),

                  const MainMenu(),
                ],
              ),
            ),
          ),

          // Ad banner
          adBannerAsync.when(
            data: (ad) => ad == null
              ? const SizedBox()
              : SizedBox(
                height: ad.size.height.toDouble(),
                width: ad.size.width.toDouble(),
                child: AdWidget(ad: ad),
              ),
            loading: () => const LinearProgressIndicator(),
            error: (_, __) => const SizedBox(),
          ),
        ],
      ),
    );
  }
}
