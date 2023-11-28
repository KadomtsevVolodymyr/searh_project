import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCQgQ05lskIbesvWeN5TXrkz_Qovtrhedw',
    appId: '1:371148984128:web:204b89270e3d3d8013b4a5',
    messagingSenderId: '371148984128',
    projectId: 'solution-starter-35b1b',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBX-mMI3H8B1Y0sZac0lDvBPfxWo_fRtVM',
    appId: '1:838263498405:android:da87e79a7b2f86a0244f4c',
    messagingSenderId: '838263498405',
    projectId: 'solution-starter',
    storageBucket: 'solution-starter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAp_6EU2S02bptamhxgsElQDy6wGE7yKxU',
    appId: '1:838263498405:ios:1fe3672e39c56a10244f4c',
    messagingSenderId: '838263498405',
    projectId: 'solution-starter',
    storageBucket: 'solution-starter.appspot.com',
    androidClientId:
        '838263498405-28dmrs178tthvja3bc65el5c64fv31uh.apps.googleusercontent.com',
    iosClientId:
        '838263498405-8jc4f2j5p27iklfgm6q5kl9gqknlv5it.apps.googleusercontent.com',
    iosBundleId: 'com.example.solutionStarter',
  );
}
