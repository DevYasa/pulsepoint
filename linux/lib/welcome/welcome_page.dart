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
      body: SafeArea(
        top: false, // This disables the top part of the SafeArea
        bottom: true,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.42, // Takes 45% of the screen height
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/welcome_img.png"),
                      fit: BoxFit.cover, // Ensures it covers the full container
                    ),
                  ),
                ),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                        child: Text(
                          "PulsePoint",
                          style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.w800,
                            color: Color.fromRGBO(189, 17, 30, 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                        child: Text(
                          "\"Where every drop counts. Join us in saving lives today!\"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
            // Positioned red circle at the bottom
            Positioned(
              bottom: -85,
              left: 0,
              right: 0,
              top: 470,
              child: Image.asset(
                "assets/images/mask_img.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            // Positioned hand image on top of the red circle
            Positioned(
              bottom: 0, // Adjust this value based on your visual requirements
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/hand.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            // Positioned Buttons on the red circle
            Positioned(
              bottom: 150,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0), // New text color for Login
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 28),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Login"),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0), // New text color for Signup
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 28),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Signup"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
