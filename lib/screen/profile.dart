import 'package:flutter/material.dart';
import 'package:router/constant/color.dart';

class ProfilePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  // Example data for profile
  final String profileName = "";
  final String dob = "";
  final String gender = "";
  final String city = "";
  final String description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        backgroundColor: tdtouch,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Profile picture
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(''), // Replace with your image path
              ),
            ),
            SizedBox(height: 20),

            // Profile fields display (without input)
            ProfileInfo(label: "Name", value: profileName),
            ProfileInfo(label: "Date of Birth", value: dob),
            ProfileInfo(label: "Gender", value: gender),
            ProfileInfo(label: "City", value: city),
            ProfileInfo(label: "Description", value: description),
          ],
        ),
      ),
    );
  }
}

// Custom widget for displaying profile info side-by-side
class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  ProfileInfo({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Align the label and value
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(width: 20), // Add space between label and value
          Flexible(
            // Ensure the text wraps if it's too long
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              overflow: TextOverflow.ellipsis, // Truncate long text
            ),
          ),
        ],
      ),
    );
  }
}
