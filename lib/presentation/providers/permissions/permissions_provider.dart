import 'package:miscelaneos/presentation/providers/permissions/permission_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permissions_provider.g.dart';

/*
  Se prefirió agregar un AsyncProvider para poder manejar el estado de los permisos
  de manera que se tenga un ejemplo de como funciona y se pueda reutilizar en otras Apps
  Y para aprovechar los nuevos generadores de código de la versión 2.x de Riverpod.

  Se pudo haber utilizado un StateNotifierProvider que es mas simple, y los métodos igual
  pudieron ser Future<void> que igual hubiera funcionado bien.
*/

// Se requiere que siempre este activo, para que no se reinicie el estado por ninguna razón

@Riverpod(keepAlive: true)
class Permissions extends _$Permissions {

  Future<PermissionState> _initialize() async {
    final permissionsArray = await Future.wait([
      Permission.camera.status,
      Permission.mediaLibrary.status,
      Permission.sensors.status,
      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);

    return PermissionState(
      camera: permissionsArray[0],
      photoLibrary: permissionsArray[1],
      sensors: permissionsArray[2],
      location: permissionsArray[3],
      locationAlways: permissionsArray[4],
      locationWhenInUse: permissionsArray[5],
    );
  }

  @override
  FutureOr<PermissionState> build() async => _initialize();

  Future<void> checkSettings() async {
    final newState = await _initialize();

    state = AsyncValue.data(newState);
  }

  Future<void> requestCameraAccess() async {
    // Set the state to loading
    state = const AsyncValue.loading();

    // Set the state with permission request result
    final status = await Permission.camera.request();
    state = AsyncValue.data(state.value!.copyWith(camera: status));

    if (status == PermissionStatus.permanentlyDenied) openAppSettings();
  }

  Future<void> requestPhotoLibraryAccess() async {
    // Set the state to loading
    state = const AsyncValue.loading();

    // Set the state with permission request result
    final status = await Permission.mediaLibrary.request();
    state = AsyncValue.data(state.value!.copyWith(photoLibrary: status));

    if (status == PermissionStatus.permanentlyDenied) openAppSettings();
  }

  Future<void> requestSensorsAccess() async {
    // Set the state to loading
    state = const AsyncValue.loading();

    // Set the state with permission request result
    final status = await Permission.sensors.request();
    state = AsyncValue.data(state.value!.copyWith(sensors: status));

    if (status == PermissionStatus.permanentlyDenied) openAppSettings();
  }

  Future<void> requestLocationAccess() async {
    // Set the state to loading
    state = const AsyncValue.loading();

    // Set the state with permission request result
    final status = await Permission.location.request();
    state = AsyncValue.data(state.value!.copyWith(location: status));

    if (status == PermissionStatus.permanentlyDenied) openAppSettings();
  }

  Future<void> requestLocationAlwaysAccess() async {
    // Set the state to loading
    state = const AsyncValue.loading();

    // Set the state with permission request result
    final status = await Permission.locationAlways.request();
    state = AsyncValue.data(state.value!.copyWith(locationAlways: status));

    if (status == PermissionStatus.permanentlyDenied) openAppSettings();
  }

  Future<void> requestLocationWhenInUseAccess() async {
    // Set the state to loading
    state = const AsyncValue.loading();

    // Set the state with permission request result
    final status = await Permission.locationWhenInUse.request();
    state = AsyncValue.data(state.value!.copyWith(locationWhenInUse: status));

    if (status == PermissionStatus.permanentlyDenied) openAppSettings();
  }
}