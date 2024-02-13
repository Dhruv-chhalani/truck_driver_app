// // File generated by FlutterFire CLI.
// // ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;

// /// Default [FirebaseOptions] for use with your Firebase apps.
// ///
// /// Example:
// /// ```dart
// /// import 'firebase_options.dart';
// /// // ...
// /// await Firebase.initializeApp(
// ///   options: DefaultFirebaseOptions.currentPlatform,
// /// );
// /// ```
// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     if (kIsWeb) {
//       return web;
//     }
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;
//       case TargetPlatform.macOS:
//         return macos;
//       case TargetPlatform.windows:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for windows - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       case TargetPlatform.linux:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for linux - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       default:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions are not supported for this platform.',
//         );
//     }
//   }

//   static const FirebaseOptions web = FirebaseOptions(
//     apiKey: 'AIzaSyCArpl3ffklBmNI3ft46z-RYzhgmY4vh60',
//     appId: '1:479541959104:web:92186248f87b58e57ed025',
//     messagingSenderId: '479541959104',
//     projectId: 'truckive-driver',
//     authDomain: 'truckive-driver.firebaseapp.com',
//     storageBucket: 'truckive-driver.appspot.com',
//     measurementId: 'G-LE0S4BX4K3',
//   );

//   static const FirebaseOptions android = FirebaseOptions(
//     apiKey: 'AIzaSyD_tWnce-3X-nEMl_RtBqQv_CrwYsmyF7M',
//     appId: '1:479541959104:android:652dbdaabd3261b27ed025',
//     messagingSenderId: '479541959104',
//     projectId: 'truckive-driver',
//     storageBucket: 'truckive-driver.appspot.com',
//   );

//   static const FirebaseOptions ios = FirebaseOptions(
//     apiKey: 'AIzaSyCr-E960csb5aLQ6YBg7Ma01xyIb0WNLdg',
//     appId: '1:479541959104:ios:1b8911422df25d827ed025',
//     messagingSenderId: '479541959104',
//     projectId: 'truckive-driver',
//     storageBucket: 'truckive-driver.appspot.com',
//     iosBundleId: 'com.example.truckDriverApp',
//   );

//   static const FirebaseOptions macos = FirebaseOptions(
//     apiKey: 'AIzaSyCr-E960csb5aLQ6YBg7Ma01xyIb0WNLdg',
//     appId: '1:479541959104:ios:ed89e274cd115c5e7ed025',
//     messagingSenderId: '479541959104',
//     projectId: 'truckive-driver',
//     storageBucket: 'truckive-driver.appspot.com',
//     iosBundleId: 'com.example.truckDriverApp.RunnerTests',
//   );
// }