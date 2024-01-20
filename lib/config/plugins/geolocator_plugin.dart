import 'package:geolocator/geolocator.dart';

class GeoLocatorPlugin {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  static Future<(Position?, String)> getCurrentPosition() async {
    final error = await _checkPermissions();
    if (error.isNotEmpty) return (null, error);

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return (await Geolocator.getCurrentPosition(), '');
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  static Stream<(Position?, String)> getPositionStream() async* {
    final error = await _checkPermissions();
    if (error.isNotEmpty) yield (null, error);

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    await for (final location in Geolocator.getPositionStream()) {
     yield (location, '');
    }
  }

  static Future<String> _checkPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return 'Location services are disabled.';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return 'Location permissions are denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return 'Location permissions are permanently denied, we cannot request permissions.';
    }

    return '';
  }
}
