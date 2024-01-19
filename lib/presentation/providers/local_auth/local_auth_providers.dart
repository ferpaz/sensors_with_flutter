import 'package:flutter/material.dart';
import 'package:miscelaneos/config/plugins/local_auth_plugin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_auth_providers.g.dart';

@riverpod
FutureOr<bool> canCheckBiometrics(CanCheckBiometricsRef ref) async {
  return await LocalAuthPlugin.canCheckBiometrics();
}

enum LocalAuthStatus { authenticated, unauthenticated, authenticating }

// Clase estado para guardar la información de la autenticación
@immutable
class AuthState {
  final bool authenticated;
  final LocalAuthStatus status;
  final String message;

  const AuthState({ this.status = LocalAuthStatus.unauthenticated, this.authenticated = false, this.message = ''});

  AuthState copyWith({LocalAuthStatus? status, bool? authenticated, String? message})
    => AuthState(
      status: status ?? this.status,
      authenticated: authenticated ?? this.authenticated,
      message: message ?? this.message,
    );

  @override
  String toString() => '''{
    status: $status,
    authenticated: $authenticated,
    message: $message
}''';
}

@riverpod
class LocalAuth extends _$LocalAuth {
  @override
  AuthState build() {
    return const AuthState();
  }

  void authenticate() async {
    state = state.copyWith(status: LocalAuthStatus.authenticating);

    final (authenticated, message) = await LocalAuthPlugin.authenticate();

    state = state.copyWith(
      status: authenticated ? LocalAuthStatus.authenticated : LocalAuthStatus.unauthenticated,
      authenticated: authenticated,
      message: message,
    );
  }

  void logout() {
    state = state.copyWith(status: LocalAuthStatus.unauthenticated, authenticated: false);
  }
}
