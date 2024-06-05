import 'package:flutter/material.dart';

class VerifyDonor extends StatefulWidget {
  const VerifyDonor({super.key});

  @override
  _VerifyDonorState createState() => _VerifyDonorState();
}

class _VerifyDonorState extends State<VerifyDonor> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _verifyUser() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(
        const Duration(seconds: 1)); // Simulate a network request

    String username = _usernameController.text;
    String password = _passwordController.text;

    setState(() {
      _isLoading = false;
    });

    if ((username == 'admin' && password == 'admin123') ||
        (username == 'user' && password == 'user123')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successful verification and login')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blood Donation App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 136, 13, 4),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/cells.png",
                height: 200, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Image.asset("assets/images/user.png", height: 100),
            const SizedBox(height: 20),
            const Text(
              '"Ensuring Safe Blood Donations!"',
              style: TextStyle(
                fontSize: 19,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 136, 13, 4),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'User Verification',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person,
                            color: Color.fromARGB(255, 136, 13, 4)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 136, 13, 4)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 136, 13, 4),
                              width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 136, 13, 4),
                              width: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock,
                            color: Color.fromARGB(255, 136, 13, 4)),
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 136, 13, 4)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(255, 136, 13, 4),
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 136, 13, 4),
                              width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 136, 13, 4),
                              width: 2.0),
                        ),
                      ),
                      obscureText: _obscureText,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _verifyUser,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 136, 13, 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Verify',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
