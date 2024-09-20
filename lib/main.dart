import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:router/screen/dashboard.dart';
import 'package:router/screen/starting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoodMotion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Add initial route
      initialRoute: '/',
      routes: {
        '/': (context) => const MyApps(),
        '/dashboard': (context) => Main(
              selectedIndex: 2,
              name: '',
            ), // Include your routes
      },
    );
  }
}
