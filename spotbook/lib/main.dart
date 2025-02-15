import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spotbook/auth/auth_gate.dart';
import 'package:spotbook/firebase_options.dart';
import 'package:spotbook/pages/authPages/logor_reg.dart';
import 'package:spotbook/theme/light_theme.dart';


void main() async{
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lighmode,
      home: AuthGate(),
    );
  }
}

