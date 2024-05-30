// ignore_for_file: prefer_const_constructors
// import 'dart:ui';

import 'package:pulsepoint/home_screen/bloodbank_history_screen.dart';
import 'package:pulsepoint/home_screen/donor_login_screen.dart';
import 'package:pulsepoint/home_screen/raise_request_screen.dart';
import 'package:pulsepoint/home_screen/requests_screen.dart';
import 'package:pulsepoint/home_screen/search_result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //  void Donor_login_screen() {
  //   // Method implementation
  // }

  // void Bloodbank_login_screen() {
  //   // Method implementation
  // }

  // void Requests_screen() {
  //   // Method implementation
  // }

  // void Raise_request_screen() {
  //   // Method implementation
  // }

  // void Search_result_screen() {
  //   // Method implementation
  // }
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
                  SizedBox(
                    height: 40,
                  ),
                  Image(
                    image: AssetImage('assets/images/bgimage.jpg'),
                    height: 180,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    title: Text(
                      '- View Availability',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DonorLoginScreen()));
                    },
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    title: Text(
                      '- View History',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BloodBankHistoryScreen()));
                    },
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    title: Text(
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
                  Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    title: Text(
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
                  Divider(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
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
            Container(
              width: MediaQuery.of(context).size.width * .89,
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                  hint: Text(
                    dropdownvalue,
                    style: TextStyle(fontSize: 19),
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
            SizedBox(
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
                    child: Text(
                      'A+',
                      style: TextStyle(fontSize: 23),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'B+',
                      style: TextStyle(fontSize: 23),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'AB+',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'O+',
                      style: TextStyle(fontSize: 23),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
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
                    child: Text(
                      'A-',
                      style: TextStyle(fontSize: 23),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'B-',
                      style: TextStyle(fontSize: 23),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'AB-',
                      style: TextStyle(fontSize: 23),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'O-',
                      style: TextStyle(fontSize: 23),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
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
