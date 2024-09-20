import 'package:flutter/material.dart';
import 'package:router/screen/home.dart';

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimal Contrast App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
        buttonTheme: const ButtonThemeData(buttonColor: Colors.blueGrey),
      ),
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Haircut Page'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          // Full screen image
          Positioned.fill(
            child: Image.asset(
              'assets/image/hairstyle.jpg', // Your image
              fit: BoxFit.cover,
            ),
          ),
          // Gradient at the bottom to fade the image
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200, // Adjust as needed for the fade effect
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.white.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),
          // Text and button positioned over the gradient
          Positioned(
            bottom: 40, // Adjust as needed for the position of text and button
            left: 16,
            right: 16,
            child: Column(
              children: [
                const Text(
                  'Haircut recommendation for your face shape',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondPage()),
                    );
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pimple Detection'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          // Full screen image
          Positioned.fill(
            child: Image.asset(
              'assets/image/pimple.jpg', // Your image
              fit: BoxFit.cover,
            ),
          ),
          // Gradient at the bottom to fade the image
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200, // Adjust as needed for the fade effect
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.white.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),
          // Text and button positioned over the gradient
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: Column(
              children: [
                const Text(
                  'Pimple Detection and suggestion',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThirdPage()),
                    );
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Specs Recommendation'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          // Full screen image
          Positioned.fill(
            child: Image.asset(
              'assets/image/specs.jpg', // Your image
              fit: BoxFit.cover,
            ),
          ),
          // Gradient at the bottom to fade the image
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200, // Adjust as needed for the fade effect
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.white.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),
          // Text and button positioned over the gradient
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: Column(
              children: [
                const Text(
                  'Specs recommended for your face',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyPage()),
                    );
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  bool _isChecked = false; // To keep track of the checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        // Added this to make content scrollable
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Privacy Policy', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            const Text(
              '''
Effective Date:

At MoodMotion, we understand the importance of privacy and are committed to safeguarding your personal information. This privacy policy describes how we collect, use, protect, and share your information when you use our app.

1. Information We Collect
When you use MoodMotion, we collect the following types of data:

Facial Images: To offer personalized recommendations, we capture images of your face using your device's camera. This data is processed to suggest suitable hairstyles, detect skin conditions like pimples, and recommend eyewear (specs) based on your face shape.

Device and Usage Data: We gather non-personal information such as the type of device you are using, operating system, and how you interact with our app. This helps us understand app performance and improve user experience.

2. How We Use Your Information
We only use your data for the following purposes:

Facial Recognition for Recommendations: The images we collect are used locally on your device to analyze your face shape and skin condition. Based on this analysis, we suggest hairstyles, skincare recommendations, and specs.

App Improvement: The usage data we collect helps us track how you interact with the app, which features you use most, and where improvements can be made. This data is crucial for enhancing the app’s overall functionality.

3. Data Storage and Security
Facial Images: All image processing occurs on your device. We do not store, transfer, or retain your facial images on our servers or any third-party services. Your facial data is only used during your session and is not accessible to anyone else.

Usage Data: This information may be stored on secure servers. We use industry-standard encryption to protect your data and ensure that it is only used to enhance app performance and user experience.

Security Measures: We employ technical and administrative safeguards to protect your information from unauthorized access, alteration, or disclosure. However, no system is entirely foolproof, and we cannot guarantee complete security of your data.

4. Third-Party Sharing
At MoodMotion, we respect your privacy and do not share any of your personal information or facial data with third parties. We do not sell, trade, or rent your personal data for marketing or other purposes. We may only share anonymized data (which does not identify you) for analytics to improve the app’s functionality.

5. Your Control Over Data
We believe in giving you full control over your data. You have the following options:

Camera Access: You can enable or disable camera access in your device settings at any time. Without camera access, the app will not function as intended for facial recognition, but you can still access non-facial features.

Opt-Out: If you no longer agree with the data collection or processing described in this privacy policy, you can stop using the app and uninstall it from your device.

6. Your Rights
You have the right to:

Request access to the data we collect and store.
Request deletion of any data that we have collected, where applicable.
Withdraw consent to data processing at any time by uninstalling the app or managing your device permissions.
7. Children’s Privacy
Our app is not intended for use by children under the age of 13. We do not knowingly collect personal information from children under this age. If we become aware of data collection from children under 13 without parental consent, we will delete the information immediately.

8. Policy Updates
We may update this privacy policy from time to time to reflect changes in our practices or legal requirements. Any updates will be posted directly within the app.
              ''',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Add the Row widget with Checkbox and Accept button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isChecked = newValue ?? false;
                    });
                  },
                ),
                const Text('I accept the terms'), // Text beside the checkbox
                const SizedBox(
                    width: 10), // Add spacing between checkbox and button
                ElevatedButton(
                  onPressed:
                      _isChecked // Enable the button only if the checkbox is checked
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Home()), // Navigate to Main() page
                              );
                            }
                          : null,
                  child: const Text('Accept'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
