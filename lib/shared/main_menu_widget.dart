import 'package:flutter/material.dart';

import '../screens/aboutscreen.dart';
import '../screens/mainscreen.dart';
import '../screens/userguidelinesscreen.dart';

class MainMenuWidget extends StatefulWidget {
  const MainMenuWidget({super.key});

  @override
  State<MainMenuWidget> createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      elevation: 10,
      child: ListView(
        children: [
          ListTile(
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (content) => const MainScreen()));
            },
          ),
          ListTile(
            title: const Text(
              "About Me",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (content) => const AboutScreen()));
            },
          ),
          ListTile(
            title: const Text(
              "User Guidelines",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => const UserGuidelinesScreen()));
            },
          ),
        ],
      ),
    );
  }
}
