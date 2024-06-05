import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pulsepoint/home_screen/bloodbank_history_screen.dart';
import 'package:pulsepoint/home/donate_blood_page.dart';
import 'package:pulsepoint/home_screen/requests_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildSearchBar(),
            _buildDonationEligibility(),
            _buildEmergencySection(),
            _buildServicesSection(context), // Pass context here
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
            radius: 30,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: FutureBuilder<User?>(
              future: _getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text(
                    'Hello,\nLoading...',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                } else if (snapshot.hasError) {
                  return const Text(
                    'Hello,\nError',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                } else if (snapshot.hasData) {
                  final user = snapshot.data;
                  return Text(
                    'Hello,\n${user?.displayName ?? 'User'}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                } else {
                  return const Text(
                    'Hello,\nGuest',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                }
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
    );
  }

  Future<User?> _getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for blood requests & donate...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildDonationEligibility() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.pink[50],
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                '0 days Left\nYou are now eligible for donate blood!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Emergency', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // Handle See all button press
                },
                child: const Text('See all'),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.local_hospital, size: 40),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Matara', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Asiri Hospital, 2 km away\nRequested 25 min ago'),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(189, 17, 30, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Urgent!', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Handle See all button press
                  },
                  child: const Text('See all'),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                children: [
                  _buildServiceCard(context, Icons.search, 'Need a\nBlood donor'),
                  _buildServiceCard(context, Icons.favorite, 'I want to\nDonate Blood', navigateToDonateBlood: true), // Pass navigation flag here
                  _buildServiceCard(context, Icons.medical_services, 'I want my\nBody Checkup'),
                  _buildServiceCard(context, Icons.help, 'Help?\nAssistance'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, IconData icon, String text, {bool navigateToDonateBlood = false}) {
    return GestureDetector(
      onTap: () {
        if (navigateToDonateBlood) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DonateBloodPage()),
          );
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: const Color.fromRGBO(189, 17, 30, 1)),
              const SizedBox(height: 10),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'My donations'),
        BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: 'Blood banks'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      selectedItemColor: const Color.fromRGBO(189, 17, 30, 1),
      unselectedItemColor: Colors.grey,
      backgroundColor: const Color.fromRGBO(189, 17, 30, 1),
      onTap: (index) {
        switch (index) {
          case 0:
            // Handle Home tap
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BloodBankHistoryScreen()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RequestScreen()),
            );
            break;
          case 3:
            // Handle Profile tap
            break;
        }
      },
    );
  }
}
