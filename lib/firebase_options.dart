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
    apiKey: 'AIzaSyDXmuH9ORC5p5GHJq-r-fL_h5d_UszOdMk',
    appId: '1:200473317031:web:bce5d6c66d30927203d582',
    messagingSenderId: '200473317031',
    projectId: 'wakandashop-32f8d',
    authDomain: 'wakandashop-32f8d.firebaseapp.com',
    storageBucket: 'wakandashop-32f8d.appspot.com',
    measurementId: 'G-QVRYL8570Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmYRD7VaSOGjwckHwEMNhpLnZVG9Rw_n8',
    appId: '1:200473317031:android:b8cdc027f57e690b03d582',
    messagingSenderId: '200473317031',
    projectId: 'wakandashop-32f8d',
    storageBucket: 'wakandashop-32f8d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6GlCO9vaZvcqrxy2CkGXT73S3R4Q5wYI',
    appId: '1:200473317031:ios:81a1d16d3d8d0e2e03d582',
    messagingSenderId: '200473317031',
    projectId: 'wakandashop-32f8d',
    storageBucket: 'wakandashop-32f8d.appspot.com',
    androidClientId: '200473317031-1nuhtr81n1u9l0el21s6dbtoid5h0ckj.apps.googleusercontent.com',
    iosClientId: '200473317031-po9iahosv8auq5u3hr8km9tie928j6at.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6GlCO9vaZvcqrxy2CkGXT73S3R4Q5wYI',
    appId: '1:200473317031:ios:4c933eac4d402f6903d582',
    messagingSenderId: '200473317031',
    projectId: 'wakandashop-32f8d',
    storageBucket: 'wakandashop-32f8d.appspot.com',
    androidClientId: '200473317031-1nuhtr81n1u9l0el21s6dbtoid5h0ckj.apps.googleusercontent.com',
    iosClientId: '200473317031-tq0d2haahd0cohg3ebddrak8vdf8j8gb.apps.googleusercontent.com',
    iosBundleId: 'com.example.app.RunnerTests',
  );
}
