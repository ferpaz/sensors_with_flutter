import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class MagnetometerScreen extends ConsumerWidget {
  const MagnetometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final magnetometer$ = ref.watch(magnetometerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnetómetro'),
      ),
      body:  Center(
        child: switch (magnetometer$) {

            AsyncData(:final value) => Text(value.x.toString(), style: const TextStyle(fontSize: 30)),

            AsyncError(:final error) => Text(error.toString()),

            _ => const CircularProgressIndicator(),
        }
      ),
    );
  }
}