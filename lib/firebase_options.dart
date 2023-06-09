// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCJERlAxnWmM3yduNHTgLsKU2sBut6FRBk',
    appId: '1:182406421247:web:c3ff6ec0999e36dc2d8aca',
    messagingSenderId: '182406421247',
    projectId: 'projetradio-898ec',
    authDomain: 'projetradio-898ec.firebaseapp.com',
    databaseURL: 'https://projetradio-898ec-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'projetradio-898ec.appspot.com',
    measurementId: 'G-1FGK8Z1DQW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhPU8Zm8SluwyWk5IhMLbZr_l9bJNkvIc',
    appId: '1:182406421247:android:21db20284ac1c82e2d8aca',
    messagingSenderId: '182406421247',
    projectId: 'projetradio-898ec',
    databaseURL: 'https://projetradio-898ec-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'projetradio-898ec.appspot.com',
  );
}
