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
    final asyncPermissions = ref.watch(asyncPermissionsProvider);

    return asyncPermissions.when(
        data: (value) => ListView(
              children: [
                CheckboxListTile(
                  value: value.cameraGranted,
                  title: const Text('Cámara'),
                  subtitle: const Text('Permite tomar fotos y videos'),
                  onChanged: (_) => ref.read(asyncPermissionsProvider.notifier).requestCameraAccess(),
                ),

                CheckboxListTile(
                  value: value.photoLibraryGranted,
                  title: const Text('Galería'),
                  subtitle: const Text('Permite acceder a la galería de fotos y videos'),
                  onChanged: (_) => ref.read(asyncPermissionsProvider.notifier).requestPhotoLibraryAccess(),
                ),

                CheckboxListTile(
                  value: value.sensorsGranted,
                  title: const Text('Sensores'),
                  subtitle: const Text('Permite acceder a los sensores del dispositivo'),
                  onChanged: (_) => ref.read(asyncPermissionsProvider.notifier).requestSensorsAccess(),
                ),

                CheckboxListTile(
                  value: value.locationGranted,
                  title: const Text('Ubicación'),
                  subtitle: const Text('Permite acceder a la ubicación del dispositivo'),
                  onChanged: (_) => ref.read(asyncPermissionsProvider.notifier).requestLocationAccess(),
                ),

                CheckboxListTile(
                  value: value.locationAlwaysGranted,
                  title: const Text('Ubicación siempre'),
                  subtitle: const Text('Permite acceder a la ubicación del dispositivo siempre'),
                  onChanged: (_) => ref.read(asyncPermissionsProvider.notifier).requestLocationAlwaysAccess(),
                ),

                CheckboxListTile(
                  value: value.locationWhenInUseGranted,
                  title: const Text('Ubicación cuando se usa'),
                  subtitle: const Text('Permite acceder a la ubicación del dispositivo solamente cuando esta App está en uso'),
                  onChanged: (_) => ref.read(asyncPermissionsProvider.notifier).requestLocationWhenInUseAccess(),
                ),
              ],
            ),
        error: (error, stack) => Center(child: Text('Error al obtener los permisos: $error')),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
