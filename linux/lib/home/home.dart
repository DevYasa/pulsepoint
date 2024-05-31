import 'dart:io'; // For File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For ImagePicker and XFile

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
            const SizedBox(height: 20),
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

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  final ImagePicker _picker = ImagePicker();
  late ImageProvider _imageProvider;

  @override
  void initState() {
    super.initState();
    _imageProvider = const AssetImage('assets/images/bgimage.jpg');
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
        child: const Stack(
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

// Custom Search Delegate Class
class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
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
