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
    apiKey: 'AIzaSyATtB18PUJ6w0Qvl0yuN-nHYY8dERjXx1Q',
    appId: '1:277442579623:web:6237a693b133667e0cdf82',
    messagingSenderId: '277442579623',
    projectId: 'edulearn-nns',
    authDomain: 'edulearn-nns.firebaseapp.com',
    storageBucket: 'edulearn-nns.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiKCzbDPGL0y4t_3e0BptdzHmxOheho3M',
    appId: '1:277442579623:android:ad0a8d3df9f8ccb70cdf82',
    messagingSenderId: '277442579623',
    projectId: 'edulearn-nns',
    storageBucket: 'edulearn-nns.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfHuO1zBQ0-K7Lvv3I22HzyISQVWrJz1s',
    appId: '1:277442579623:ios:400b0d371d7226c80cdf82',
    messagingSenderId: '277442579623',
    projectId: 'edulearn-nns',
    storageBucket: 'edulearn-nns.appspot.com',
    iosBundleId: 'com.example.edulearn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDfHuO1zBQ0-K7Lvv3I22HzyISQVWrJz1s',
    appId: '1:277442579623:ios:562278f17ebbd2bb0cdf82',
    messagingSenderId: '277442579623',
    projectId: 'edulearn-nns',
    storageBucket: 'edulearn-nns.appspot.com',
    iosBundleId: 'com.example.edulearn.RunnerTests',
  );
}
