import 'package:flutter/material.dart';

void main() {
  runApp(BloodDonationApp());
}

class BloodDonationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donation'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserProfileWidget(),
            SizedBox(height: 20),
            EmergencyBar(),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  ServiceTile(
                    title: 'Need a Donor',
                    onTap: () {
                      // Navigate to need a donor page
                    },
                  ),
                  ServiceTile(
                    title: 'Donate Blood',
                    onTap: () {
                      // Navigate to donate blood page
                    },
                  ),
                  ServiceTile(
                    title: 'Body Checkup',
                    onTap: () {
                      // Navigate to body checkup page
                    },
                  ),
                  ServiceTile(
                    title: 'Assistance',
                    onTap: () {
                      // Navigate to assistance page
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'My Donation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'Blood Banks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class UserProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement changing profile image from gallery
      },
      child: CircleAvatar(
        radius: 50,
        // Update the image path to reflect the new file structure
        backgroundImage: AssetImage('assets/bgimage.jpg'),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmergencyBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.red,
      child: Row(
        children: [
          Icon(Icons.warning, color: Colors.white),
          SizedBox(width: 10),
          Text(
            'Emergency!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ServiceTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
