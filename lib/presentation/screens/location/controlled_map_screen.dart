import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';
import 'package:miscelaneos/presentation/screens/screens.dart';

class ControlledMapScreen extends ConsumerWidget {
  const ControlledMapScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userLocationAsync = ref.watch(userLocationProvider);

    //return watchUserLocationStream.
    return userLocationAsync.when(
      data: (data) => _MapAndControls(latitude: data.$1, longitude: data.$2),
      error: (error, _) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _MapAndControls extends ConsumerWidget {
  final double latitude;
  final double longitude;

  const _MapAndControls({required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context, ref) {
    final mapControllerState = ref.watch(mapControllerProvider);
    final mapControllerNotifier = ref.read(mapControllerProvider.notifier);

    return Stack(
      children: [
        MapView(
          initialLattitude: latitude,
          initialLongitude: longitude,
          controlMap: true,
        ),
        Positioned(
          top: 40,
          left: 10,
          child: IconButton.filledTonal(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_outlined),
          ),
        ),
        Positioned(
          bottom: 140,
          left: 10,
          child: IconButton.filledTonal(
            onPressed: () {
              ref.read(mapControllerProvider.notifier).addMarkerCurrentPosition();
            },
            icon: const Icon(Icons.pin_drop),
          ),
        ),
        Positioned(
          bottom: 90,
          left: 10,
          child: IconButton.filledTonal(
            onPressed: () => mapControllerNotifier.toggleFollowUser(),
            icon: mapControllerState.followUser ? const Icon(Icons.directions_run_outlined) : const Icon(Icons.accessibility_new_outlined),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 10,
          child: IconButton.filledTonal(
            onPressed: ()  => mapControllerNotifier.findUser(),
            icon: const Icon(Icons.location_searching),
          ),
        ),
      ],
    );
  }
}
