import 'package:flutter/material.dart';

class MoodMotionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoodMotion Support',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SupportPage(),
    );
  }
}

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support - MoodMotion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.support_agent,
                size: 100.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'How can we help you?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'At MoodMotion, your experience is important to us. Feel free to reach out with any issues or questions you have!',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20.0),
            Text(
              'Contact Support',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(Icons.email, color: Colors.blue),
                SizedBox(width: 10.0),
                Text(
                  'daydreamer.m@gmail.com',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(Icons.phone, color: Colors.blue),
                SizedBox(width: 10.0),
                Text(
                  '+90472152535',

                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(width: 40,),
                Icon(Icons.phone, color: Colors.blue),
                SizedBox(width: 10.0),
                Text(
                  '+ 0426 0052 8090',

                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'FAQs',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                children: [
                  _buildFAQItem(
                    'How do I reset my password?',
                    'To reset your password, go to the login page and tap "Forgot Password." Follow the instructions sent to your email.',
                  ),
                  _buildFAQItem(
                    'How do I contact customer service?',
                    'You can contact customer service by emailing support@moodmotion.com or calling +1 800 123 4567.',
                  ),
                  _buildFAQItem(
                    'How do I update my profile?',
                    'To update your profile, go to the "Profile" section of the app and click "Edit Profile."',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: Text(question, style: TextStyle(fontWeight: FontWeight.bold)),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
