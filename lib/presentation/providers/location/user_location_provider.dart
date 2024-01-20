import 'package:miscelaneos/config/plugins/geolocator_plugin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location_provider.g.dart';

@riverpod
FutureOr<(double, double)> userLocation (UserLocationRef ref) async {
  final (posicion, error) = await GeoLocatorPlugin.getCurrentPosition();

  if (posicion == null) throw error;

  return (posicion.latitude, posicion.longitude);
}

@riverpod
Stream<(double, double)> watchUserLocation (WatchUserLocationRef ref) {
  final stream = GeoLocatorPlugin.getPositionStream();

  return stream.map((event) {
    if (event.$1 == null) throw event.$2;
    return (event.$1!.latitude, event.$1!.longitude);
  });
}