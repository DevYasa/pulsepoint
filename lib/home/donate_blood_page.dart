import 'package:flutter/material.dart';

class DonateBloodPage extends StatelessWidget {
  const DonateBloodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate Blood'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Donate Blood page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
