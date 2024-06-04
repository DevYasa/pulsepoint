import 'package:pulsepoint/home_screen/bloodbank_history_screen.dart';
import 'package:pulsepoint/home_screen/donor_login_screen.dart';
import 'package:pulsepoint/home_screen/raise_request_screen.dart';
import 'package:pulsepoint/home_screen/requests_screen.dart';
import 'package:pulsepoint/home_screen/search_result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String dropdownvalue = 'Select Hospital';

  var items = [
    'Asiri Hospital',
    'The central Hospital',
    'Jeewaka Hospital',
    'Medical Center',
    'Winsetha Hospital',
    'Nawaloka Hospital',
    'General Hospital',
    'Oasis Hospital',
    'Golden Key',
    'Asiri Sirgical',
    'Venus Hospital',
    'Co-operative Hospital',
    'Ruhunu Hospital',
    'Hemas Hospital'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
          backgroundColor: Colors.red,
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Image(
                    image: AssetImage('assets/images/bgimage.jpg'),
                    height: 180,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    title: const Text(
                      '- View Availability',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DonorLoginScreen()));
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    title: const Text(
                      '- View History',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BloodBankHistoryScreen()));
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    title: const Text(
                      '- Blood Bank',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RequestScreen()));
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    title: const Text(
                      '- Request',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RaiseRequestScreen()));
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                ],
              )
            ],
          )),
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: 40,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Image(
              image: AssetImage('assets/images/bgimage.jpg'),
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PULSEPOINT SEARCH',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 38,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * .89,
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                  hint: Text(
                    dropdownvalue,
                    style: const TextStyle(fontSize: 19),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(fontSize: 19),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: const Text(
                      'A+',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: const Text(
                      'B+',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: const Text(
                      'AB+',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: const Text(
                      'O+',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: const Text(
                      'A-',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: const Text(
                      'B-',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: const Text(
                      'AB-',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: const Text(
                      'O-',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              elevation: 15,
              shape: const CircleBorder(),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchResult()));
                    },
                    icon: Icon(Icons.search),
                    iconSize: 80,
                    splashColor: Colors.grey,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
