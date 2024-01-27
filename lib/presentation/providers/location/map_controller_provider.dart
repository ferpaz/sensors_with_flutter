import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/config/plugins/geolocator_plugin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_controller_provider.g.dart';

@riverpod
class MapController extends _$MapController {
  StreamSubscription? _userLocation$;

  (double, double)? _lastPosition;

  MapController() : super() {
    _watchUserLocation().take(1).listen((event) {
      findUser();
    });
  }

  @override
  MapState build() {
    return MapState();
  }

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(controller: controller, isReady: true);
  }

  void findUser() {
    if (_lastPosition == null) return;
    _goToLocation(_lastPosition!.$1, _lastPosition!.$2);
  }

  void toggleFollowUser() {
    state = state.copyWith(followUser: !state.followUser);

    if (state.followUser) {
      findUser();

      _userLocation$ = _watchUserLocation().listen((event) {
        _goToLocation(event.$1, event.$2);
      });
    } else {
      _userLocation$?.cancel();
    }
  }

  void addMarkerCurrentPosition({String? name}) {
    if (_lastPosition == null) return;
    addMarker(_lastPosition!.$1, _lastPosition!.$2, name: name);
  }

  void addMarker(double latitude, double longitude, {String? name}) {
    var markerId = 'marker-${state.markers.length}';

    Marker newMarker = Marker(
      markerId: MarkerId(markerId),
      infoWindow: InfoWindow(
        title: name ?? 'Marker ${state.markers.length}',
        snippet: 'Eso es el snipet del InfoWindow',
        onTap: () => removeMarker(markerId),
      ),
      position: LatLng(latitude, longitude),
    );
    state = state.copyWith(markers: [...state.markers, newMarker]);
  }

  void removeMarker(String markerId) {
    state = state.copyWith(markers: state.markers.where((element) => element.markerId.value != markerId).toList());
  }

  void clearMarkers() {
    state = state.copyWith(markers: []);
  }

  Stream<(double, double)> _watchUserLocation() async* {
    await for (final (position, _) in GeoLocatorPlugin.getPositionStream()) {
      if (position != null) {
        _lastPosition = (position.latitude, position.longitude);

        yield (position.latitude, position.longitude);
      }
    }
  }

  void _goToLocation(double latitude, double longitude) {
    state.controller?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 14.4746,
      ),
    ));
  }
}

class MapState {
  final bool isReady;
  final bool followUser;
  final List<Marker> markers;
  final GoogleMapController? controller;

  MapState({
    this.isReady = false,
    this.followUser = false,
    this.markers = const [],
    this.controller,
  });

  Set<Marker> get markersSet => markers.toSet();

  MapState copyWith({
    bool? isReady,
    bool? followUser,
    List<Marker>? markers,
    GoogleMapController? controller,
  }) {
    return MapState(
      isReady: isReady ?? this.isReady,
      followUser: followUser ?? this.followUser,
      markers: markers ?? this.markers,
      controller: controller ?? this.controller,
    );
  }
}
