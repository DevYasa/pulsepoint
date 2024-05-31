import 'package:flutter/material.dart';
import 'package:pulsepoint/home_screen/bloodbank_history_screen.dart';
import 'package:pulsepoint/login/login_page.dart';
import 'package:pulsepoint/signup/signup_page.dart';
import 'package:pulsepoint/welcome/welcome_page.dart';
import 'package:pulsepoint/home/home.dart';
import 'package:pulsepoint/home/donate_blood_page.dart';
import 'package:pulsepoint/home_screen/home_screen.dart';

void main() {
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
      routes: {
        '/': (context) =>
            HomePage(), // This sets the HomeScreen as the initial route
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home_screen': (context) => const HomeScreen(),
        '/home': (context) => HomePage(),
        '/home': (context) => DonateBloodPage(),
      },
    );
  }
}
