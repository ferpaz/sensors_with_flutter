import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'magnetometer_provider.g.dart';

@riverpod
Stream<MagnetometerState> magnetometer(MagnetometerRef ref) async* {
  await for (final event in magnetometerEvents) {
    yield MagnetometerState(event.x, event.y, event.z);
  }
}

class MagnetometerState {
  final double x;
  final double y;
  final double z;

  MagnetometerState(double x, double y, double z)
    : x = double.parse(x.toStringAsFixed(2)),
      y = double.parse(y.toStringAsFixed(2)),
      z = double.parse(z.toStringAsFixed(2));

  @override
  String toString() {
    return '''
x: ${x.toStringAsFixed(2)}
y: ${y.toStringAsFixed(2)}
z: ${z.toStringAsFixed(2)}
''';
  }
}