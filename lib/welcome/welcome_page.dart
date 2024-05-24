// ignore: file_names
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
        color: const Color.fromARGB(255, 255, 0, 0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "PulsePoint",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 213, 25, 8)),
                  ),
                ),
                const Text(
                  "Welcome to Pulse Point",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 255, 0, 0)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Let's Start")),
                )
              ]),
        ),
      )),
    );
  }
}
