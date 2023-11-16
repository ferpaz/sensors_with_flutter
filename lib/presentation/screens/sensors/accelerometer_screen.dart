import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AccelerometerScreen extends ConsumerWidget {
  const AccelerometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //final accelerometer$ = ref.watch(accelerometerUserProvider);
    final accelerometer$ = ref.watch(accelerometerUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Acelerometro'),
      ),
      body: Center(
        child: switch (accelerometer$) {

              AsyncData(:final value) => Text(value.toString(), style: const TextStyle(fontSize: 30)),

              AsyncError(:final error) => Text(error.toString()),

              _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}