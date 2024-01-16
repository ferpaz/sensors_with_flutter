import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_compass/flutter_compass.dart';

part 'compass_provider.g.dart';

@riverpod
Stream<CompassState> compass(CompassRef ref) async* {
  if (FlutterCompass.events == null) throw Exception(ArgumentError('Compass sensor not available'));

  try {
    await for (final event in FlutterCompass.events!) {
      yield CompassState(event.heading);
    }
  } catch (e) {
    throw Exception('Error getting compass heading $e');
  }
}

class CompassState {
  final bool sensorPresent;
  final double direction;

  CompassState(double? direction)
      : direction = direction ?? 0,
        sensorPresent = direction != null;
}
