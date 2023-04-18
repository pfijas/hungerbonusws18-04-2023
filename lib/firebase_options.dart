import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
          apiKey: "AIzaSyCw4BHQXdoGWsVsaA79pdlKE5pZnE_POD0",
          authDomain: "shoes-kart.firebaseapp.com",
          databaseURL: "https://shoes-kart-default-rtdb.firebaseio.com",
          projectId: "shoes-kart",
          storageBucket: "shoes-kart.appspot.com",
          messagingSenderId: "302761832124",
          appId: "1:302761832124:web:60d95efbc7505e7b3f2ab9",
          measurementId: "G-MPL06W02VL"
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
          apiKey: "AIzaSyCw4BHQXdoGWsVsaA79pdlKE5pZnE_POD0",
          authDomain: "shoes-kart.firebaseapp.com",
          databaseURL: "https://shoes-kart-default-rtdb.firebaseio.com",
          projectId: "shoes-kart",
          storageBucket: "shoes-kart.appspot.com",
          messagingSenderId: "302761832124",
          appId: "1:302761832124:web:60d95efbc7505e7b3f2ab9",
          measurementId: "G-MPL06W02VL"
      );
    } else {
      // Android
      return const FirebaseOptions(
          apiKey: "AIzaSyCw4BHQXdoGWsVsaA79pdlKE5pZnE_POD0",
          authDomain: "shoes-kart.firebaseapp.com",
          databaseURL: "https://shoes-kart-default-rtdb.firebaseio.com",
          projectId: "shoes-kart",
          storageBucket: "shoes-kart.appspot.com",
          messagingSenderId: "302761832124",
          appId: "1:302761832124:web:60d95efbc7505e7b3f2ab9",
          measurementId: "G-MPL06W02VL"
      );
    }
  }
}