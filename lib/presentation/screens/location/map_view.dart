import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class MapView extends ConsumerStatefulWidget {
  final double initialLattitude;
  final double initialLongitude;
  final bool controlMap;

  const MapView({super.key, required this.initialLattitude, required this.initialLongitude, this.controlMap = false});

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {

  @override
  Widget build(BuildContext context) {
    final mapControllerState = ref.watch(mapControllerProvider);

    return GoogleMap(
      markers: mapControllerState.markersSet,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.initialLattitude, widget.initialLongitude),
        zoom: 14.4746,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,
      onMapCreated: (controller) {
        if (widget.controlMap) {
          ref.read(mapControllerProvider.notifier).setMapController(controller);
        }
      },
      onLongPress: (latLng) {
        ref.read(mapControllerProvider.notifier).addMarker(latLng.latitude, latLng.longitude, name: 'Marcador puesto con long press');
      },
    );
  }
}
