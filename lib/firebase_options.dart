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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyAAnRj-upyhB7GyGPZQGDfCn5PJqQti9Ko',
    appId: '1:896744297494:web:597c4ecbae1448a007d137',
    messagingSenderId: '896744297494',
    projectId: 'flutter-l2',
    authDomain: 'flutter-l2.firebaseapp.com',
    storageBucket: 'flutter-l2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIoyWyyGmmt2-HMXpIbb_sT75ABbD3a_E',
    appId: '1:896744297494:android:6e2b48d987db509507d137',
    messagingSenderId: '896744297494',
    projectId: 'flutter-l2',
    storageBucket: 'flutter-l2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRFB2lQm6_Jb_kfRoCmLKmuyrC1AkKI38',
    appId: '1:896744297494:ios:d27bcc836e653e6307d137',
    messagingSenderId: '896744297494',
    projectId: 'flutter-l2',
    storageBucket: 'flutter-l2.appspot.com',
    iosBundleId: 'com.example.firebaseL2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBRFB2lQm6_Jb_kfRoCmLKmuyrC1AkKI38',
    appId: '1:896744297494:ios:dcaada72fd312d0807d137',
    messagingSenderId: '896744297494',
    projectId: 'flutter-l2',
    storageBucket: 'flutter-l2.appspot.com',
    iosBundleId: 'com.example.firebaseL2.RunnerTests',
  );
}
