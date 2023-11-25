import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../shared/main_menu_widget.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: const Text(
            'About Me',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello, my name is Raihan Harits. I'm from Indonesia, this is my final year project for my degree in Information Technology. I'm currently a student at Universiti Utara Malaysia.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                    "My project title is 'Salinity and pH Monitoring System' and I'm using Flutter for the mobile app. I'm also using Arduino Uno and ESP32 DEVKIT V1 for the hardware. These systems are typically used for monitoring the environmental conditions of tanks, ponds, or other water bodies. While pH gauges the amount of hydrogen ions in water, salinity assesses electrical conductivity.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                const Text(
                    "My aims are to create this system to identify the salinity and pH value of water in TM male hostel bathroom, Universiti Utara Malaysia.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                const Text(
                    "If you have any questions or feedback, please don't hesitate to contact me.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _showGithub(),
                      child: Image.asset(
                        'assets/images/github.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    GestureDetector(
                      onTap: () => _showInstagram(),
                      child: Image.asset(
                        'assets/images/instagram.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    GestureDetector(
                      onTap: () => _showLinkedin(),
                      child: Image.asset(
                        'assets/images/linkedin.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    GestureDetector(
                      onTap: () => _showEmail(),
                      child: Image.asset(
                        'assets/images/email.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        drawer: const MainMenuWidget(),
      ),
    );
  }

  Future<void> _showGithub() async {
    final Uri launchUri =
        Uri(scheme: 'https', path: "www.github.com/haritsrhn");
    await launchUrl(launchUri);
  }

  Future<void> _showInstagram() async {
    final Uri launchUri =
        Uri(scheme: 'https', path: "www.instagram.com/haritsrhn");
    await launchUrl(launchUri);
  }

  Future<void> _showLinkedin() async {
    final Uri launchUri = Uri(
        scheme: 'https', path: "www.linkedin.com/in/harits-raihan-751863220/");
    await launchUrl(launchUri);
  }

  Future<void> _showEmail() async {
    final Uri launchUri =
        Uri(scheme: 'mailto', path: "haritsraihan75@gmail.com");
    await launchUrl(launchUri);
  }
}
