import 'dart:async';

import 'package:flutter/material.dart';

import 'mainscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 10),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (content) => const MainScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash.png'),
                    fit: BoxFit.cover))),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SizedBox(height: 200),
              CircularProgressIndicator(
                color: Colors.black,
              ),
              SizedBox(height: 50),
              Text("Salinity and pH",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
              Text("Monitoring System",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
              SizedBox(height: 50),
              Text("Version 1.0.0",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ]),
    );
  }
}
