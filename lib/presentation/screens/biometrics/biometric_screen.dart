import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class BiometricScreen extends ConsumerWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final canCheckBiometricsAsync = ref.watch(canCheckBiometricsProvider);
    final authState = ref.watch(localAuthProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.fingerprint, size: 100),

            const SizedBox(height: 40),

            FilledButton.tonal(
              onPressed: () {
                ref.read ( localAuthProvider.notifier ).authenticate();
              },
              child: const Text('Autenticar'),
            ),

            canCheckBiometricsAsync.when(
              data: (canCheck) => Text('Can check biometrics: $canCheck'),
              loading: () => const CircularProgressIndicator(),
              error: (error, _) => Text('Error: $error'),
            ),

            const SizedBox(height: 40),

            const Text('Estado del Biométrico: ', style: TextStyle(fontSize: 30)),
            Text(authState.toString()),
          ],
        ),
      ),
    );
  }
}