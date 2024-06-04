import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart'; // For date formatting

class OrganizeCamps extends StatefulWidget {
  const OrganizeCamps({super.key});

  @override
  _OrganizeCampsState createState() => _OrganizeCampsState();
}

class _OrganizeCampsState extends State<OrganizeCamps> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _venueController = TextEditingController();
  String _generatedPoster = '';

  get DateFormat => null;

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        controller.text = DateFormat.yMd().format(picked);
      });
    }
  }

  void _generatePoster() {
    if (_formKey.currentState!.validate()) {
      // You can replace this with the logic to generate the poster
      setState(() {
        _generatedPoster =
            'Saving Lives One Drop at a Time: \n     Join Us in Donating Blood!\n\n\n' +
                '          Start Date: ${_startDateController.text}\n' +
                '          End Date: ${_endDateController.text}\n' +
                '          Venue: ${_venueController.text}';
      });

      // Clear the text fields after generating poster
      _startDateController.clear();
      _endDateController.clear();
      _venueController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organize Blood Donation Camp',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 136, 13, 4),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _startDateController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today,
                        color: Color.fromARGB(255, 136, 13, 4)),
                    labelText: 'Start Date',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 136, 13, 4), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 137, 13, 4), width: 2.0),
                    ),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _selectDate(context, _startDateController);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the start date';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _endDateController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today,
                        color: Color.fromARGB(255, 137, 13, 4)),
                    labelText: 'End Date',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 137, 13, 4), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 137, 13, 4), width: 2.0),
                    ),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _selectDate(context, _endDateController);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the end date';
                    }
                    return null;
                  },
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _venueController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_on,
                        color: Color.fromARGB(255, 137, 13, 4)),
                    labelText: 'Venue',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 137, 13, 4), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 137, 13, 4), width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the venue';
                    }
                    return null;
                  },
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _generatePoster,
                  child: const Text('Generate',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 137, 13, 4),
                  ),
                ),
                if (_generatedPoster.isNotEmpty)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 188, 191, 181),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.white, width: 2.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          _generatedPoster,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 136, 13, 4),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Image.asset('assets/images/hand.png',
                            height: 200, width: 200),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
