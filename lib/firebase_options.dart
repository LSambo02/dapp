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
    apiKey: 'AIzaSyCYDkUzpqqnkHCk2EYBicMtsaLrznkC8hI',
    appId: '1:252005392436:web:74a467574407a07f83aa61',
    messagingSenderId: '252005392436',
    projectId: 'despensa-1bed3',
    authDomain: 'despensa-1bed3.firebaseapp.com',
    databaseURL: 'https://despensa-1bed3.firebaseio.com',
    storageBucket: 'despensa-1bed3.appspot.com',
    measurementId: 'G-222N5H3V53',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXP33lUnwG_PjE2sxN8gwgrWQZvorj1aM',
    appId: '1:252005392436:android:dd90d8b52e6bbb8b83aa61',
    messagingSenderId: '252005392436',
    projectId: 'despensa-1bed3',
    databaseURL: 'https://despensa-1bed3.firebaseio.com',
    storageBucket: 'despensa-1bed3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWQd53uF4EtZOvSuZMq_2AGT9iqCRgDj0',
    appId: '1:252005392436:ios:fe327924c43bf14483aa61',
    messagingSenderId: '252005392436',
    projectId: 'despensa-1bed3',
    databaseURL: 'https://despensa-1bed3.firebaseio.com',
    storageBucket: 'despensa-1bed3.appspot.com',
    androidClientId: '252005392436-l9us5jesbkvalo82lj2hb2f4bttt4df8.apps.googleusercontent.com',
    iosClientId: '252005392436-hquplpj0i8abl5jea8chvfp535v48d0d.apps.googleusercontent.com',
    iosBundleId: 'com.lsambo02.despensa',
  );
}