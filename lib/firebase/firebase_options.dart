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
    apiKey: 'AIzaSyBtag89kWvGMZaaQv7CtZwRD49C5vSPogQ',
    appId: '1:918117743660:web:2d7cd76701cb7ca22aa589',
    messagingSenderId: '918117743660',
    projectId: 'gpt-quiz-aded8',
    authDomain: 'gpt-quiz-aded8.firebaseapp.com',
    storageBucket: 'gpt-quiz-aded8.appspot.com',
    measurementId: 'G-RVNW3H3J7W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPYrqX1XhsGx2FP4hD2vW9eJkfO3FqvEA',
    appId: '1:918117743660:android:a2228559f6b9e2072aa589',
    messagingSenderId: '918117743660',
    projectId: 'gpt-quiz-aded8',
    storageBucket: 'gpt-quiz-aded8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASPGaCLVn_Uog2lrP7MjPOdfy77WOL3_M',
    appId: '1:918117743660:ios:9cffb70e05bf7d772aa589',
    messagingSenderId: '918117743660',
    projectId: 'gpt-quiz-aded8',
    storageBucket: 'gpt-quiz-aded8.appspot.com',
    iosClientId: '918117743660-m3sf7f7467h9vfn7o51t2rli9hcfak8a.apps.googleusercontent.com',
    iosBundleId: 'com.example.gptQuiz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASPGaCLVn_Uog2lrP7MjPOdfy77WOL3_M',
    appId: '1:918117743660:ios:9cffb70e05bf7d772aa589',
    messagingSenderId: '918117743660',
    projectId: 'gpt-quiz-aded8',
    storageBucket: 'gpt-quiz-aded8.appspot.com',
    iosClientId: '918117743660-m3sf7f7467h9vfn7o51t2rli9hcfak8a.apps.googleusercontent.com',
    iosBundleId: 'com.example.gptQuiz',
  );
}
