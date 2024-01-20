// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userLocationHash() => r'1c3b8b674900cea72eee42d569debdf3f3fb3521';

/// See also [userLocation].
@ProviderFor(userLocation)
final userLocationProvider =
    AutoDisposeFutureProvider<(double, double)>.internal(
  userLocation,
  name: r'userLocationProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserLocationRef = AutoDisposeFutureProviderRef<(double, double)>;
String _$watchUserLocationHash() => r'4b255672d2223d97de36bd133550c795863d9997';

/// See also [watchUserLocation].
@ProviderFor(watchUserLocation)
final watchUserLocationProvider =
    AutoDisposeStreamProvider<(double, double)>.internal(
  watchUserLocation,
  name: r'watchUserLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchUserLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchUserLocationRef = AutoDisposeStreamProviderRef<(double, double)>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
