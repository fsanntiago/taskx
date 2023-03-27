import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:taskX/core/firebase/firestore_manager.dart';
import 'package:taskX/features/auth/auth_injector.dart';
import 'package:taskX/features/credential/credential_injector.dart';

final sl = GetIt.instance;

Future<void> initApp() async {
  _initCore();
  _initFirebase();
  initAuth();
  initCredential();
}

void _initCore() {
  // add user manager
  sl.registerLazySingleton<FirestoreManager>(
    () => FirestoreManager(
      firestore: sl(),
    ),
  );
}

void _initFirebase() {
  // add firebase auth instance
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  // add firebase firestore instance
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}
