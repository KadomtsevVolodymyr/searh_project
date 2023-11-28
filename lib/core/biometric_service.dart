import 'dart:io';

import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';
import 'package:search_project/core/logger.dart';
import 'package:search_project/generated/l10n.dart';

enum BiometricTypeShort { fingerprint, faceId, none }

class BiometricService {
  // Constructor
  BiometricService({
    required LocalAuthentication localAuthentication,
  }) : _auth = localAuthentication;

  // Dependencies
  final LocalAuthentication _auth;

  // Local fields
  late final BiometricTypeShort _biometricType;
  final Logger _logger = getLogger('BiometricService');

  // Getters
  BiometricTypeShort get availableBiometricType => _biometricType;

  // Init
  Future<void> init() async {
    _logger.i('init()');

    final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;
    _logger.i('canAuthenticateWithBiometrics: $canAuthenticateWithBiometrics');

    final bool isDeviceSupported = await _auth.isDeviceSupported();
    _logger.i('isDeviceSupported: $isDeviceSupported');

    if (canAuthenticateWithBiometrics && isDeviceSupported) {
      final List<BiometricType> availableBiometrics =
          await _auth.getAvailableBiometrics();
      _logger.i('availableBiometrics: $availableBiometrics');

      if (availableBiometrics.contains(BiometricType.face)) {
        _biometricType = BiometricTypeShort.faceId;
        _logger.i('biometric set to $_biometricType');
        return;
      }

      if (availableBiometrics.contains(BiometricType.fingerprint) ||
          availableBiometrics.contains(BiometricType.strong)) {
        _biometricType = BiometricTypeShort.fingerprint;
        _logger.i('biometric set to $_biometricType');
        return;
      }

      _biometricType = BiometricTypeShort.none;
      _logger.i('biometric not available');
    } else {
      _logger.i('biometric not available');
      _biometricType = BiometricTypeShort.none;
    }
  }

  String getCurrentMethodTitle() {
    switch (_biometricType) {
      case BiometricTypeShort.fingerprint:
        if (Platform.isIOS) return S.current.biometric_touchId;
        return S.current.biometric_fingerprint;
      case BiometricTypeShort.faceId:
        if (Platform.isIOS) return S.current.biometric_faceId;
        return S.current.biometric_faceUnlock;
      case BiometricTypeShort.none:
        return 'none';
    }
  }

  // Authenticate
  Future<bool> authenticate({required String promptMessage}) async {
    _logger.i('authenticate()');

    final bool didAuthenticate = await _auth.authenticate(
      localizedReason: promptMessage,
      options: const AuthenticationOptions(biometricOnly: true),
    );

    _logger.i('didAuthenticate: $didAuthenticate');

    return didAuthenticate;
  }
}
