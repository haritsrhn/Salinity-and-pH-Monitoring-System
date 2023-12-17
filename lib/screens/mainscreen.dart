import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../shared/main_menu_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _salinity = 0.0, _pH = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: const Text(
            'Home',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Card(
                      margin: const EdgeInsets.all(16),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.opacity,
                              size: 40,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Salinity',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${_salinity.toStringAsFixed(2)} ms/cm",
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.all(8),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.local_drink,
                              size: 40,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'pH',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              _pH.toStringAsFixed(2),
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                    ),
                    onPressed: () {
                      _getValues();
                    },
                    child: const Text(
                      'Get Values',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: const MainMenuWidget(),
      ),
    );
  }

  void _getValues() async {
    DatabaseReference dbref = FirebaseDatabase.instance.ref().child('data');
    final ph = await dbref.child('ph').get();
    final salinity = await dbref.child('conductivity').get();
    setState(() {
      _salinity = double.parse(salinity.value.toString());
      _pH = double.parse(ph.value.toString());
    });
    //Determine the pH and salinity values by Malaysia's Government Water Classifications
    if (_pH >= 6.5 && _pH <= 8.5) {
      if (_salinity <= 0.5) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Water Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              content: const Text(
                'Class I Water: Safe for Drinking, Cooking, and Bathing.',
                style: TextStyle(fontSize: 16),
              ),
              actions: <Widget>[
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else if (_salinity <= 1) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Water Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              content: const Text(
                'Class II Water: This water is suitable for irrigation purposes.',
                style: TextStyle(fontSize: 16),
              ),
              actions: <Widget>[
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else if (_salinity <= 4) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Water Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              content: const Text(
                'Class III Water: This water is suitable for industrial and reacreational purposes.',
                style: TextStyle(fontSize: 16),
              ),
              actions: <Widget>[
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else if (_salinity <= 5) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Water Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              content: const Text(
                'Class IV Water: This water is suitable for aquaculture purposes.',
                style: TextStyle(fontSize: 16),
              ),
              actions: <Widget>[
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Water Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              content: const Text(
                'Not classified.',
                style: TextStyle(fontSize: 16),
              ),
              actions: <Widget>[
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Water Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            content: const Text(
              'Not classified.',
              style: TextStyle(fontSize: 16),
            ),
            actions: <Widget>[
              CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
