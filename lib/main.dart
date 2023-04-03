import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskX/bloc_observer.dart';
import 'package:taskX/config/local_storage.dart';
import 'package:taskX/container_injector.dart';

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await initApp();
  await LocalStorage.init();

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
