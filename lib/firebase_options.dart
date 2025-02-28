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
    apiKey: 'AIzaSyAaNiwjEThCQ9uYloTtMPkJsXDBlpJyJg4',
    appId: '1:501538201117:web:1cb5c58ac67c92685ff0f4',
    messagingSenderId: '501538201117',
    projectId: 'chat-app-8b059',
    authDomain: 'chat-app-8b059.firebaseapp.com',
    storageBucket: 'chat-app-8b059.appspot.com',
    measurementId: 'G-WZ5PY1CST3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_p5NjFmUQJ5sKw-LVTNF5EcYfpUXOvIU',
    appId: '1:501538201117:android:9b63563b2999d8b45ff0f4',
    messagingSenderId: '501538201117',
    projectId: 'chat-app-8b059',
    storageBucket: 'chat-app-8b059.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCoDppgeMLgVnBxSrWE0yhFqwHYlD3aY0I',
    appId: '1:501538201117:ios:6fa9ce160e7707725ff0f4',
    messagingSenderId: '501538201117',
    projectId: 'chat-app-8b059',
    storageBucket: 'chat-app-8b059.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCoDppgeMLgVnBxSrWE0yhFqwHYlD3aY0I',
    appId: '1:501538201117:ios:6fa9ce160e7707725ff0f4',
    messagingSenderId: '501538201117',
    projectId: 'chat-app-8b059',
    storageBucket: 'chat-app-8b059.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAaNiwjEThCQ9uYloTtMPkJsXDBlpJyJg4',
    appId: '1:501538201117:web:a923a3bf39eacf1e5ff0f4',
    messagingSenderId: '501538201117',
    projectId: 'chat-app-8b059',
    authDomain: 'chat-app-8b059.firebaseapp.com',
    storageBucket: 'chat-app-8b059.appspot.com',
    measurementId: 'G-3V31YZXKT6',
  );
}
