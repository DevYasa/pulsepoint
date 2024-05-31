import 'package:flutter/material.dart';

void main() {
  runApp(const BloodDonationApp());
}

class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Donation'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
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
            const UserProfileWidget(),
            const SizedBox(height: 20),
            const EmergencyBar(),
            const SizedBox(height: 20),
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
        items: const [
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
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement changing profile image from gallery
      },
      child: const CircleAvatar(
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
  const EmergencyBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.red,
      child: const Row(
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

  const ServiceTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
