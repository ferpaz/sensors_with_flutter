import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class AdFullScreen extends ConsumerWidget {
  const AdFullScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adInterstitialAsync = ref.watch(adInterstitialProvider);

    // Esto permite escuchar el proveedor y saber cuando cambia de valor
    // con esto podemos mostrar el anuncio
    ref.listen(adInterstitialProvider, (previous, next) {
      if (next.hasError) return;
      if (next.isLoading) return;
      if (!next.hasValue) return;
      if (next.value == null) return;

      next.value!.show();
    });

    if (adInterstitialAsync.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // if (adsAreVisible && adInterstitialAsync.hasValue && adInterstitialAsync.value != null) {
    //   adInterstitialAsync.value!.show();
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Full Screen'),
      ),
      body: const Center(
        child: Text('Ya puedes ver esta pantalla.', style: TextStyle(fontSize: 28),),
      ),
    );
  }
}