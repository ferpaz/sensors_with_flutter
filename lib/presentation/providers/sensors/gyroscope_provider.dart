import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'gyroscope_provider.g.dart';

@riverpod
Stream<GyroscopeState> gyroscope(GyroscopeRef ref) async* {
  await for (final event in gyroscopeEvents) {
    yield GyroscopeState(event.x, event.y, event.z);
  }
}

class GyroscopeState {
  final double x;
  final double y;
  final double z;

  GyroscopeState(double x, double y, double z)
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