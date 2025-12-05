import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PermanentDetailsScreen extends StatefulWidget {
  const PermanentDetailsScreen({super.key});

  @override
  State<PermanentDetailsScreen> createState() => _PermanentDetailsScreenState();
}

class _PermanentDetailsScreenState extends State<PermanentDetailsScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  String? _selectedSex;
  bool? _isMarried;

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permanent Controller Details'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Login Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            const Text(
              'Sex:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: _selectedSex,
                    onChanged: (value) {
                      setState(() {
                        _selectedSex = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Female'),
                    value: 'Female',
                    groupValue: _selectedSex,
                    onChanged: (value) {
                      setState(() {
                        _selectedSex = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            if (_selectedSex != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: LinearProgressIndicator(
                  value: _selectedSex == 'Male' ? 0.5 : 1.0, // Example progress
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _selectedSex == 'Male' ? Colors.blue : Colors.pink,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Married:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Yes'),
                    value: true,
                    groupValue: _isMarried,
                    onChanged: (value) {
                      setState(() {
                        _isMarried = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('No'),
                    value: false,
                    groupValue: _isMarried,
                    onChanged: (value) {
                      setState(() {
                        _isMarried = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission or data display
                Get.snackbar(
                  'Form Data',
                  'Email: ${_emailController.text}\nPhone: ${_phoneController.text}\nSex: ${_selectedSex ?? 'N/A'}\nUsername: ${_usernameController.text}\nMarried: ${_isMarried == true
                      ? 'Yes'
                      : _isMarried == false
                      ? 'No'
                      : 'N/A'}',
                  snackPosition: SnackPosition.TOP,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
