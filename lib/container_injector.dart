import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:taskX/core/firebase/firestore_manager.dart';
import 'package:taskX/core/network/connectivity_checker.dart';
import 'package:taskX/features/auth/auth_injector.dart';
import 'package:taskX/features/category/category_injector.dart';
import 'package:taskX/features/credential/credential_injector.dart';
import 'package:taskX/features/home/home_injector.dart';

final sl = GetIt.instance;

Future<void> initApp() async {
  _initCore();
  _initFirebase();
  initAuth();
  initCredential();
  initHome();
  initCategory();
}

void _initCore() {
  // add user manager
  sl.registerLazySingleton<FirestoreManager>(
    () => FirestoreManager(
      firestore: sl(),
    ),
  );

  // add connectivity
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  // add checkInternetConnectivity
  sl.registerLazySingleton<BaseCheckInternetConnectivity>(
    () => CheckInternetConnectivity(connectivity: sl()),
  );
}

// Init firebase Emulator
void _initFirebase() async {
  var firebaseConfig = await _readJsonFile('firebase.json');
  final firestorePort = firebaseConfig['emulators']['firestore']['port'] as int;
  final authPort = firebaseConfig['emulators']['auth']['port'] as int;
  final functionsPort = firebaseConfig['emulators']['functions']['port'] as int;
  // final storagePort = firebaseConfig['emulators']['storage']['post'];

  // add firebase auth instance
  sl.registerLazySingleton<FirebaseAuth>(() {
    var authInstance = FirebaseAuth.instance;
    // Use firestore emulator - localhost
    authInstance.useAuthEmulator("127.0.0.1", 9099);

    return authInstance;
  });

  // add firebase firestore instance
  sl.registerLazySingleton<FirebaseFirestore>(() {
    var firestoreInstance = FirebaseFirestore.instance;
    // Use firestore emulator - localhost
    firestoreInstance.useFirestoreEmulator("127.0.0.1", 8080);
    firestoreInstance.settings = const Settings(sslEnabled: false);
    return firestoreInstance;
  });
}

dynamic _readJsonFile(String filePath) async {
  final String response = await rootBundle.loadString(filePath);
  return await json.decode(response);
}
