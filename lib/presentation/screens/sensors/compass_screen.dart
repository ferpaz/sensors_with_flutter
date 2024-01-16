import'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';
import 'package:miscelaneos/presentation/screens/screens.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locationGranted = ref.watch(asyncPermissionsProvider).value?.locationGranted ?? false;

    final compassState = ref.watch(compassProvider);

    if (!locationGranted) return const AskLocationScreen();

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Brújula', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: compassState.when(
          data: (data) => data.sensorPresent ? Compass(direction: data.direction) : const Text('Sensor no disponible'),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => Center(child: Text('Error obteniendo datos: $e')),
        ));
  }
}

class Compass extends StatefulWidget {
  final double direction;
  const Compass({
    super.key,
    required this.direction,
  });

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  double prevValue = 0.0;
  double turns = 0;

  double getTurns() {
    double direction = (widget.direction < 0) ? (360 + widget.direction): widget.direction;

    double diff = direction - prevValue;
    if(diff.abs() > 180) {

      if(prevValue > direction) {
        diff = 360 - (direction-prevValue).abs();
      } else {
        diff = -1 * (360 - (prevValue-direction).abs());
      }
    }

    turns += (diff / 360);
    prevValue = direction;

    return turns * -1;
  }

  // function para convertir de degrees a radians
  double degreesToRadians(double degrees) {
    return -1 * degrees * math.pi / 180;
  }

  // function para formatear degrees a 0-360
  int formatDegrees(double degrees) {
    double degreesInCircle = degrees < 0 ? 360 + degrees : degrees;
    return degreesInCircle.round();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${formatDegrees(widget.direction)}°', style: const TextStyle(color: Colors.white, fontSize: 30)),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              // Rota la aguja y no tiene animación

              // Image.asset('assets/images/compass/quadrant-1.png'),
              // Transform.rotate(
              //   angle: degreesToRadians(widget.direction),
              //   child: Image.asset('assets/images/compass/needle-1.png'),
              // ),

              // Rota la aguja con animación

              // Image.asset('assets/images/compass/quadrant-1.png'),
              // AnimatedRotation(
              //   curve: Curves.easeOut,
              //   turns: getTurns(),
              //   duration: const Duration(milliseconds: 500),
              //   child: Image.asset('assets/images/compass/needle-1.png'),
              // ),

              // Rota el fondo con animación
              AnimatedRotation(
                curve: Curves.easeOut,
                turns: getTurns(),
                duration: const Duration(milliseconds: 500),
                child: Image.asset('assets/images/compass/quadrant-1.png'),
              ),

              Image.asset('assets/images/compass/needle-1.png'),
            ],
          )
        ],
      ),
    );
  }
}
