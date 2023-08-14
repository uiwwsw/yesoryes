import 'package:flutter/material.dart';
import 'package:flutter_application_1/map.dart';
import 'package:flutter_application_1/test.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NaverMapSdk.instance.initialize(
      clientId: 'd6n0qgp3um',
      onAuthFailed: (error) {
        print('Auth failed: $error');
      });

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FNMapPage(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return const test();
                },
              ));
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'fdgggfd',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
