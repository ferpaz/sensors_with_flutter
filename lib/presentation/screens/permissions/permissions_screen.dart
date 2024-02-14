import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permisos'),
      ),
      body: const _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {
  const _PermissionsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAds = ref.watch(showAdsProvider);
    final asyncPermissions = ref.watch(permissionsProvider);

    return asyncPermissions.when(
        data: (value) => ListView(
              children: [
                CheckboxListTile(
                  value: value.cameraGranted,
                  title: const Text('Cámara'),
                  subtitle: const Text('Permite tomar fotos y videos'),
                  onChanged: (_) => ref.read(permissionsProvider.notifier).requestCameraAccess(),
                ),

                CheckboxListTile(
                  value: value.photoLibraryGranted,
                  title: const Text('Galería'),
                  subtitle: const Text('Permite acceder a la galería de fotos y videos'),
                  onChanged: (_) => ref.read(permissionsProvider.notifier).requestPhotoLibraryAccess(),
                ),

                CheckboxListTile(
                  value: value.sensorsGranted,
                  title: const Text('Sensores'),
                  subtitle: const Text('Permite acceder a los sensores del dispositivo'),
                  onChanged: (_) => ref.read(permissionsProvider.notifier).requestSensorsAccess(),
                ),

                CheckboxListTile(
                  value: value.locationGranted,
                  title: const Text('Ubicación'),
                  subtitle: const Text('Permite acceder a la ubicación del dispositivo'),
                  onChanged: (_) => ref.read(permissionsProvider.notifier).requestLocationAccess(),
                ),

                CheckboxListTile(
                  value: value.locationAlwaysGranted,
                  title: const Text('Ubicación siempre'),
                  subtitle: const Text('Permite acceder a la ubicación del dispositivo siempre'),
                  onChanged: (_) => ref.read(permissionsProvider.notifier).requestLocationAlwaysAccess(),
                ),

                CheckboxListTile(
                  value: value.locationWhenInUseGranted,
                  title: const Text('Ubicación cuando se usa'),
                  subtitle: const Text('Permite acceder a la ubicación del dispositivo solamente cuando esta App está en uso'),
                  onChanged: (_) => ref.read(permissionsProvider.notifier).requestLocationWhenInUseAccess(),
                ),

                CheckboxListTile(
                  value: showAds,
                  title: const Text('Mostrar Anuncios'),
                  subtitle: const Text('Permite controlar si se muestran anuncios o no en la App'),
                  onChanged: (_) => ref.read(showAdsProvider.notifier).toggleAds(),
                ),
              ],
            ),
        error: (error, stack) => Center(child: Text('Error al obtener los permisos: $error')),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
