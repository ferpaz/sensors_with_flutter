import 'package:miscelaneos/config/plugins/geolocator_plugin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'watch_user_location_provider.g.dart';

@riverpod
Stream<(double, double)> watchUserLocation (WatchUserLocationRef ref) {
  final stream = GeoLocatorPlugin.getPositionStream();

  return stream.map((event) {
    if (event.$1 == null) throw event.$2;
    return (event.$1!.latitude, event.$1!.longitude);
  });
}