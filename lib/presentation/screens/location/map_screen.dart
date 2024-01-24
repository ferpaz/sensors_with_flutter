import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final currentPositionAsync = ref.watch(userLocationProvider);

    return currentPositionAsync.when(
      data: (data) => Scaffold(
        appBar: AppBar(title: const Text('Map Screen')),
        body: _MapSample(
          initialLattitude: data.$1,
          initialLongitude: data.$2,
        ),
      ),
      error: (error, _) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator(),)
    );
  }
}

class _MapSample extends StatefulWidget {
  final double initialLattitude;
  final double initialLongitude;

  const _MapSample({ required this.initialLattitude, required this.initialLongitude });

  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<_MapSample> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLattitude, widget.initialLongitude),
          zoom: 16,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
    );
  }
}