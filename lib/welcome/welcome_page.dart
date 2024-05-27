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
                  height: MediaQuery.of(context).size.height * 0.45, // Takes 45% of the screen height
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/welcome_img.png"),
                      fit: BoxFit.cover, // Ensures it covers the full container
                    ),
                  ),
                ),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // Adjusted for text to start higher
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
                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0), // Reduced vertical padding
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
                      SizedBox(height: 30), // Space before the bottom
                    ],
                  ),
                ),
              ],
            ),
            // Positioned Image at the bottom
            Positioned(
              bottom: -75, // Align it to the bottom of the screen
              left: 0,
              right: 0,
              top: 500,
              child: Image.asset(
                "assets/images/mask_img.png", // Path to your red circle image
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width, // Ensure it covers the entire width
              ),
            ),
            // Positioned Buttons on the red circle
            Positioned(
              bottom: 130, // Increased bottom space to push the buttons further up
              left: 0,
              right: 0,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {}, // Implement navigation to login
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 255, 17, 0),
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Login"),
                  ),
                  const SizedBox(height: 10), // Reduced height from 110 to 10
                  ElevatedButton(
                    onPressed: () {}, // Implement navigation to signup
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 255, 17, 0),
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
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
