import 'package:flutter/material.dart';
import 'package:router/constant/color.dart';
import 'package:router/screen/about.dart';
import 'package:router/screen/chatbot.dart';
import 'package:router/screen/opencam.dart';
import 'package:router/screen/profile.dart';
import 'package:router/screen/support.dart';

class Main extends StatefulWidget {
  final int selectedIndex;
  final String name; // Add this to handle selected index

  Main({required this.selectedIndex, required this.name, super.key});
  // String user = 'Hello$name';
  @override
  State<Main> createState() => _MyMainPagaeState();
}

class _MyMainPagaeState extends State<Main> {
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _selectedIndex =
        widget.selectedIndex; // Initialize with the passed selectedIndex
  }

  // Handle navigation when icons are pressed
  void _onItemTapped(int index) {
    // Navigate to the corresponding screen
    switch (index) {
      case 0:
        // Navigate to the Chatbot screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChatBotApp(selectedIndex: index),
          ),
        );
        break;
      case 2:
        // Navigate to the Home screen (Main)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Main(
              selectedIndex: index,
              name: '',
            ),
          ),
        );
        break;
      case 4:
        // Navigate to the Profile screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePageApp(
              
            ),
          ),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatBox('Hairstyle suggestion', Colors.red,
                    'assets/image/logo.jpg'),
                _buildStatBox('Spetacle suggestion', Colors.purple,
                    'assets/image/logo.jpg'),
              ],
            ),
            const SizedBox(height: 16),
            _buildStatBoxFullWidth(
                'Pimple Detection', Colors.pink, 'assets/image/logo.jpg'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: tdbottom,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(Icons.smart_toy_outlined, "Chatbot", 0),
            // buildNavItem(Icons.home, "sollala", 1),
            buildNavItem(Icons.home, "Home", 2),
            // buildNavItem(Icons.home, "sollala", 3),
            buildNavItem(Icons.person, "Profile", 4),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String label, Color color, String imagePath) {
    return Container(
      width: 180,
      // height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 40,
          ),
          const SizedBox(height: 30),
          Text(label),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        OpenCamera()), // Navigate to Main() page
              );
            },
            child: const Text('Go'),
          ),
        ],
      ),
    );
  }

  // Widget for the full-width box
  Widget _buildStatBoxFullWidth(String label, Color color, String imagePath) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 40,
          ),
          const SizedBox(height: 30),
          Text(label),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        OpenCamera()), // Navigate to Main() page
              );
            },
            child: const Text('Go'),
          ),
        ],
      ),
    );
  }

  Widget buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _selectedIndex == index
                  ? Colors.white
                  : Colors.transparent, // Circle only if selected
            ),
            child: Icon(
              icon,
              color: _selectedIndex == index ? tdtouch : Colors.white,
              size: _selectedIndex == index ? 30 : 20,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: _selectedIndex == index ? 20 : 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStatCard2(String label, Color color, String imagePath) {
    return Container(
      // height: 0,
      // width: double.infinity,
      color: color,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: tdtouch,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text('Support'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MoodMotionApp()), // Navigate to Main() page
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_2),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProfilePageApp()), // Navigate to Main() page
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyAppa()), // Navigate to Main() page
              );
            },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor:
          Colors.white, // Update to match your desired background color
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'MoodMotion',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/image/logo.jpg'),
            ),
          )
        ],
      ),
      iconTheme: const IconThemeData(
          color: Colors.black), // Ensure the menu icon is visible
    );
  }
}
