import 'package:flutter/material.dart';

import '../shared/main_menu_widget.dart';
import '../shared/water.dart';

class UserGuidelinesScreen extends StatefulWidget {
  const UserGuidelinesScreen({super.key});

  @override
  State<UserGuidelinesScreen> createState() => _UserGuidelinesScreenState();
}

class _UserGuidelinesScreenState extends State<UserGuidelinesScreen> {
  final List<WaterClass> waterClasses = [
    WaterClass(
      name: 'Class I Water',
      description:
          'This water is suitable for drinking and cooking purposes. The pH should be between 6.5 and 8.5, and the salinity should not exceed 0.5 ms/cm.',
    ),
    WaterClass(
      name: 'Class II Water',
      description:
          'This water is suitable for irrigation purposes. The pH should be between 6.0 and 8.5, and the salinity should not exceed 1 ms/cm.',
    ),
    WaterClass(
      name: 'Class III Water',
      description:
          'This water is suitable for industrial and recreational purposes. The pH should be between 6.0 and 8.5, and the salinity should not exceed 4 ms/cm.',
    ),
    WaterClass(
      name: 'Class IV Water',
      description:
          'This water is suitable for aquaculture purposes. The pH should be between 6.0 and 9.0, and the salinity should not exceed 5 ms/cm.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: const Text(
            'User Guidelines',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "The Malaysian government classifies water based on pH and salinity values according to the following categories:",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: waterClasses.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              waterClasses[index].name,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8.0),
                            Text(waterClasses[index].description,
                                style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        drawer: const MainMenuWidget(),
      ),
    );
  }
}
