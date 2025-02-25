import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:listify/auth/auth_gate.dart';
import 'package:listify/firebase_options.dart';
import 'package:listify/theme/lightMode.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listify',
      theme: lightMode,
      home: AuthGate(),
    );
  }
}
