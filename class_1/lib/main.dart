import 'package:class_1/screens/auth/login.dart';
import 'package:class_1/screens/auth/signIn.dart';
import 'package:class_1/screens/dashboard.dart';
import 'package:class_1/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Class 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Dasboard(),
    );
  }
}
