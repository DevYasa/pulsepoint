import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final List<String> hospitals = [
    'City Hospital',
    'Green Valley Medical Center',
    'Sunrise Hospital',
    'Riverbank Health Center',
    'St. Mary\'s Hospital',
    'Lakeside Clinic',
    'Downtown Medical Facility',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: hospitals.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              hospitals[index],
              style: TextStyle(color: Colors.red), // Change text color to red
            ),
          );
        },
      ),
    );
  }
}
