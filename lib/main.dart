import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:search_project/app_entry.dart';
import 'package:search_project/core/firebase_options.dart';
import 'package:search_project/core/logger.dart';
import 'package:search_project/data/datasource/local/secure_storage.dart';

void main(List<String> args) async {
  await configureApp();
  const flutterSecureStorage = FlutterSecureStorage();
  final secureStorage = SecureStorage(secureStorage: flutterSecureStorage);

  runApp(AppEntry(secureStorage: secureStorage));
}

Future configureApp() async {
  final Logger logger = getLogger('main');

  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (exception, stackTrace) {
    logger.e('New uncatched exception: $exception, st: $stackTrace');
  }
}
