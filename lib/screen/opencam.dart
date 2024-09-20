import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:router/screen/chatbot.dart';

class opencamera extends StatelessWidget {
  const opencamera({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moodmotion',
      home: OpenCamera(),
    );
  }
}

class OpenCamera extends StatefulWidget {
  const OpenCamera({super.key});

  @override
  State<OpenCamera> createState() => _OpenCameraState();
}

class _OpenCameraState extends State<OpenCamera> {
  File? _image; // Nullable File type
  final ImagePicker _picker = ImagePicker();

  // Method to pick image from camera
  Future<void> getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  // Method to pick image from gallery
  Future<void> getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  // Method to handle Next button press
  void onNextPressed() {
    // Perform action when Next is pressed, like navigating to another screen
    print('Next button pressed. Image selected: ${_image?.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image == null
            ? const Text("No image selected")
            : Image.file(_image!), // Use Image.file to display the image
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            onPressed: getImageFromCamera,
            label: const Text('Camera'),
            icon: const Icon(Icons.camera_alt),
            backgroundColor: Colors.blue,
          ),
          const SizedBox(width: 10), // Space between buttons
          FloatingActionButton.extended(
            onPressed: getImageFromGallery,
            label: const Text('Gallery'),
            icon: const Icon(Icons.photo),
            backgroundColor: Colors.green,
          ),
          // Conditionally render the Next button if an image is selected
          if (_image != null) ...[
            const SizedBox(width: 10), // Space between buttons
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatBotApp(
                            selectedIndex: 0,
                          )), // Navigate to Main() page
                );
              },
              label: const Text('Next'),
              icon: const Icon(Icons.arrow_forward),
              backgroundColor: Colors.orange,
            ),
          ],
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // To center the buttons at the bottom
    );
  }
}
