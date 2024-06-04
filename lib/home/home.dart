import 'dart:io'; // For File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pulsepoint/home_screen/bloodbank_history_screen.dart';
import 'package:pulsepoint/home_screen/home_screen.dart'; // For ImagePicker and XFile

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('                       PulsePoint'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            UserProfileWidget(),
            SizedBox(height: 20),
            EmergencyBar(),
            SizedBox(height: 20),
            Text(
              'Services',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  ServiceTile(
                    title: 'Need a Donor',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BloodBankHistoryScreen()));
                      // Navigate to need a donor page
                    },
                    backgroundColor: Color.fromARGB(
                        255, 243, 71, 71), // Red background color
                    textColor: Colors.white, // White text color
                  ),
                  ServiceTile(
                    title: 'Donate Blood',
                    onTap: () {
                      // Navigate to donate blood page
                    },
                    backgroundColor: Color.fromARGB(255, 187, 57, 57),
                    textColor: Colors.white,
                  ),
                  ServiceTile(
                    title: 'Search Blood',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                      // Navigate to body checkup page
                    },
                    backgroundColor: Color.fromARGB(255, 148, 98, 98),
                    textColor: Colors.white,
                  ),
                  ServiceTile(
                    title: 'Assistance',
                    onTap: () {
                      // Navigate to assistance page
                    },
                    backgroundColor: Color.fromARGB(255, 133, 48, 48),
                    textColor: Colors.white,
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
        selectedItemColor:
            Color.fromARGB(255, 255, 102, 102), // Light red for selected icon
        unselectedItemColor:
            Color.fromARGB(255, 255, 204, 204), // Lighter red for unselected
      ),
    );
  }
}

class UserProfileWidget extends StatefulWidget {
  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  final ImagePicker _picker = ImagePicker();
  late ImageProvider _imageProvider;

  @override
  void initState() {
    super.initState();
    _imageProvider = AssetImage('assets/images/bgimage.jpg');
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageProvider = FileImage(File(image.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: _imageProvider,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Icon(
                Icons.edit,
                color: Colors.red,
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
  final Color backgroundColor;
  final Color textColor;

  const ServiceTile({
    required this.title,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: backgroundColor,
        margin: EdgeInsets.all(10),
        elevation: 2,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

// Custom Search Delegate Class
class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search Results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = [
      'Blood Donor',
      'Blood Bank',
      'Emergency Services',
    ];

    final filteredSuggestions = query.isEmpty
        ? suggestions
        : suggestions
            .where((suggestion) => suggestion.contains(query))
            .toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredSuggestions[index]),
          onTap: () {
            close(context, filteredSuggestions[index]);
          },
        );
      },
    );
  }
}
