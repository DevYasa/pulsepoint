import 'package:flutter/material.dart';
import 'package:pulsepoint/welcome/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PulsePoint',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(189, 17, 30, 1)),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}
