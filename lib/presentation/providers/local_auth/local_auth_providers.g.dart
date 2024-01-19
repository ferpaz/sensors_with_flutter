// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$canCheckBiometricsHash() =>
    r'b6a36a0f47306550f35fd3b9089a667e18532cf7';

/// See also [canCheckBiometrics].
@ProviderFor(canCheckBiometrics)
final canCheckBiometricsProvider = AutoDisposeFutureProvider<bool>.internal(
  canCheckBiometrics,
  name: r'canCheckBiometricsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$canCheckBiometricsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CanCheckBiometricsRef = AutoDisposeFutureProviderRef<bool>;
String _$localAuthHash() => r'ea6bd0d2af83b83dc90a1db05403fbb4af3ef254';

/// See also [LocalAuth].
@ProviderFor(LocalAuth)
final localAuthProvider =
    AutoDisposeNotifierProvider<LocalAuth, AuthState>.internal(
  LocalAuth.new,
  name: r'localAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$localAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocalAuth = AutoDisposeNotifier<AuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
