import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

enum _PermissionType {
  camera,
  photoLibrary,
  sensors,
  location,
  locationAlways,
  locationWhenInUse,
}

@immutable
class PermissionState {
  final Map<_PermissionType, PermissionStatus> _permissions;

  PermissionState({
    PermissionStatus camera = PermissionStatus.denied,
    PermissionStatus photoLibrary = PermissionStatus.denied,
    PermissionStatus sensors = PermissionStatus.denied,
    PermissionStatus location = PermissionStatus.denied,
    PermissionStatus locationAlways = PermissionStatus.denied,
    PermissionStatus locationWhenInUse = PermissionStatus.denied,
  }) : _permissions = {
          _PermissionType.camera: camera,
          _PermissionType.photoLibrary: photoLibrary,
          _PermissionType.sensors: sensors,
          _PermissionType.location: location,
          _PermissionType.locationAlways: locationAlways,
          _PermissionType.locationWhenInUse: locationWhenInUse,
        };

  PermissionState copyWith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensors,
    PermissionStatus? location,
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse,
  }) =>
      PermissionState(
        camera: camera ?? _permissions[_PermissionType.camera]!,
        photoLibrary: photoLibrary ?? _permissions[_PermissionType.photoLibrary]!,
        sensors: sensors ?? _permissions[_PermissionType.sensors]!,
        location: location ?? _permissions[_PermissionType.location]!,
        locationAlways: locationAlways ?? _permissions[_PermissionType.locationAlways]!,
        locationWhenInUse: locationWhenInUse ?? _permissions[_PermissionType.locationWhenInUse]!,
      );

  get cameraGranted => _permissions[_PermissionType.camera] == PermissionStatus.granted;

  get photoLibraryGranted => _permissions[_PermissionType.photoLibrary] == PermissionStatus.granted;

  get sensorsGranted => _permissions[_PermissionType.sensors] == PermissionStatus.granted;

  get locationGranted => _permissions[_PermissionType.location] == PermissionStatus.granted;

  get locationAlwaysGranted => _permissions[_PermissionType.locationAlways] == PermissionStatus.granted;

  get locationWhenInUseGranted => _permissions[_PermissionType.locationWhenInUse] == PermissionStatus.granted;
}
