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
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.blue,
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Blood Champ",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                const Text(
                  "Welcome to Bload donation champ application",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      backgroundColor: Colors.red),
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
