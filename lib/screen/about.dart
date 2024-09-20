import 'package:flutter/material.dart';


class MyAppa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'About Us Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutUsPage(),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/image/logo.jpg'), // Make sure to have this image in your assets folder
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'About Our Company',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We are a group of engineering students who believe that the best ideas are born in the most unexpected moments – daydreams. Driven by curiosity and a passion for creating, we’ve combined our technical skills with our wild imaginations to bring something unique to life.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10.0),
            Text(
              'As dreamers and problem solvers, we thrive on turning abstract ideas into real-world solutions. Our app is the result of countless hours of brainstorming, coding, and collaboration. It’s more than just a project – it’s a reflection of who we are: innovators who dare to dream big.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10.0),
            Text(
              'We created this app not only to showcase our skills but also to make a difference. Whether it’s simplifying a task, bringing joy, or solving a problem, we hope our app inspires others to embrace creativity and take on challenges with the same passion that brought us here.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
              ],
            ),
        ),
    );
  }
}
