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
    apiKey: 'AIzaSyD1xclxb13aCeszUcKjaLI36zPT7NyWElM',
    appId: '1:893487518354:web:de4923c518d1509de30c4b',
    messagingSenderId: '893487518354',
    projectId: 'book-app-b0761',
    authDomain: 'book-app-b0761.firebaseapp.com',
    storageBucket: 'book-app-b0761.appspot.com',
    measurementId: 'G-3KQZXFBCD3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCxP9AR_Zle2E_AQ0ChEocvI_2Q6HkG9s',
    appId: '1:893487518354:android:0098a965682bafd6e30c4b',
    messagingSenderId: '893487518354',
    projectId: 'book-app-b0761',
    storageBucket: 'book-app-b0761.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqsrenet_uYFLQaQtFxRhBDVPvx8hMXoU',
    appId: '1:893487518354:ios:0115f741043b3bade30c4b',
    messagingSenderId: '893487518354',
    projectId: 'book-app-b0761',
    storageBucket: 'book-app-b0761.appspot.com',
    iosClientId: '893487518354-o92j44sj5eq2iaddi2h8jlfkbd6sievd.apps.googleusercontent.com',
    iosBundleId: 'com.example.book',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqsrenet_uYFLQaQtFxRhBDVPvx8hMXoU',
    appId: '1:893487518354:ios:0115f741043b3bade30c4b',
    messagingSenderId: '893487518354',
    projectId: 'book-app-b0761',
    storageBucket: 'book-app-b0761.appspot.com',
    iosClientId: '893487518354-o92j44sj5eq2iaddi2h8jlfkbd6sievd.apps.googleusercontent.com',
    iosBundleId: 'com.example.book',
  );
}
