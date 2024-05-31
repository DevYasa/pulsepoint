import 'package:flutter/material.dart';

class DonateBloodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Blood'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Donate Blood page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
