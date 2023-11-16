import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class GyroscopeBallScreen extends ConsumerWidget {
  const GyroscopeBallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Giroscopio'),
        ),
        body: SizedBox.expand(
          child: switch (gyroscope$) {
            AsyncData(:final value) => _MovingBall(x: value.x, y: value.y),
            AsyncError(:final error) => Text(error.toString()),
            _ => const CircularProgressIndicator(),
          },
        ));
  }
}

class _MovingBall extends StatelessWidget {
  final double x;
  final double y;

  const _MovingBall({required this.x, required this.y});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    double screenWidth = size.width;
    double screenHeight = size.height;

    double currentXPos = (x * 300);
    double currentYPos = (y * 200);

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          left: (currentYPos-60) + screenWidth / 2,
          top: (currentXPos-110) + screenHeight / 2,
          child: const _Ball(),
        ),
        Text(
          '[ ${x.toStringAsFixed(0)} , ${y.toStringAsFixed(0)} ]',
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ]
    );
  }
}

class _Ball extends StatelessWidget {
  const _Ball();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 120,
      height: 120,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
