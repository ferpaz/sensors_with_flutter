import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'accelerometer_provider.g.dart';

@riverpod
Stream<AccelerometerState> accelerometerUser(AccelerometerUserRef ref) async* {
  await for (final event in userAccelerometerEvents) {
    yield AccelerometerState(event.x, event.y, event.z);
  }
}


@riverpod
Stream<AccelerometerState> accelerometerGravity(AccelerometerGravityRef ref) async* {
  await for (final event in accelerometerEvents) {
    yield AccelerometerState(event.x, event.y, event.z);
  }
}


class AccelerometerState {
  final double x;
  final double y;
  final double z;

  AccelerometerState(double x, double y, double z)
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