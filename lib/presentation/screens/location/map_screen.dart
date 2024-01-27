import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

import 'map_view.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final currentPositionAsync = ref.watch(userLocationProvider);

    return currentPositionAsync.when(
      data: (data) => Scaffold(
        appBar: AppBar(title: const Text('Map Screen')),
        body: MapView(
          initialLattitude: data.$1,
          initialLongitude: data.$2,
        ),
      ),
      error: (error, _) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator(),)
    );
  }
}
