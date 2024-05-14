// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDQxs1lNqWoUqPkVsBJqYD_avW5NbCb4Gk',
    appId: '1:203763891843:web:93df620443425f7fe765b6',
    messagingSenderId: '203763891843',
    projectId: 'gebmobile-6584d',
    authDomain: 'gebmobile-6584d.firebaseapp.com',
    storageBucket: 'gebmobile-6584d.appspot.com',
    measurementId: 'G-NNNZSEFR0X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqSBZCYN76tqQSzvxjFVl3bdnn664WFCE',
    appId: '1:203763891843:android:1eb469c891fbc430e765b6',
    messagingSenderId: '203763891843',
    projectId: 'gebmobile-6584d',
    storageBucket: 'gebmobile-6584d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkFhE1e0RW_0uBeDTCk5BxKSTZSyiqGhE',
    appId: '1:203763891843:ios:55bd8c902a513087e765b6',
    messagingSenderId: '203763891843',
    projectId: 'gebmobile-6584d',
    storageBucket: 'gebmobile-6584d.appspot.com',
    iosBundleId: 'com.example.gebMobile1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkFhE1e0RW_0uBeDTCk5BxKSTZSyiqGhE',
    appId: '1:203763891843:ios:55bd8c902a513087e765b6',
    messagingSenderId: '203763891843',
    projectId: 'gebmobile-6584d',
    storageBucket: 'gebmobile-6584d.appspot.com',
    iosBundleId: 'com.example.gebMobile1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDQxs1lNqWoUqPkVsBJqYD_avW5NbCb4Gk',
    appId: '1:203763891843:web:7335913f72dd3b94e765b6',
    messagingSenderId: '203763891843',
    projectId: 'gebmobile-6584d',
    authDomain: 'gebmobile-6584d.firebaseapp.com',
    storageBucket: 'gebmobile-6584d.appspot.com',
    measurementId: 'G-9HN12WY8PC',
  );
}
