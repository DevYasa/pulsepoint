import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pulsepoint/login/login_page.dart';
import 'package:pulsepoint/signup/signup_page.dart';
import 'package:pulsepoint/welcome/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PulsePoint',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const WelcomePage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
      },
    );
  }
}
