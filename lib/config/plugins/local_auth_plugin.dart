import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class LocalAuthPlugin {
  static final LocalAuthentication _auth = LocalAuthentication();

  static availableBiometrics() async {
    final List<BiometricType> availableBiometrics = await _auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Some biometrics are enrolled.
    }

    if (availableBiometrics.contains(BiometricType.strong)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }
  }

  static Future<bool> canCheckBiometrics() async {
    return await _auth.canCheckBiometrics;
  }

  static Future<(bool, String)> authenticate() async {
    try {
      final bool didAuthenticate = await _auth.authenticate(
          localizedReason: 'Por favor autentíquese para continuar',
          options: const AuthenticationOptions(
            biometricOnly: false,  // Only biometrics will be used to authenticate (false allows to use PIN/Password)
            useErrorDialogs: true,
          ));

      return (didAuthenticate, didAuthenticate ? 'Autenticado' : 'No se pudo autenticar');

    } on PlatformException catch (e) {
      switch (e.code) {
        case auth_error.lockedOut:
          return (false, 'Demasiados intentos fallidos');
        case auth_error.permanentlyLockedOut:
          return (false, 'Demasiados intentos fallidos, bloqueado permanentemente, se requiere desbloquear el dispositivo');
        case auth_error.passcodeNotSet:
          return (false, 'No hay un PIN configurado');
        case auth_error.notAvailable:
          return (false, 'No hay biométricos disponibles');
        case auth_error.notEnrolled:
          return (false, 'No hay biométricos configurados');
        default:
          return (false, 'No se pudo autenticar ${e.message}');
      }
    }
  }
}
