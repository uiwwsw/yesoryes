import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

import 'tapxa.dart';

void main() {
  final game = Tapxa();
  runApp(GameWidget(game: game));
}



// import 'package:flame/game.dart';
// import 'package:flame_splash_screen/flame_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/tapxa.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const SplashScreenGame(),
//       theme: ThemeData.dark(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class GameScreen extends StatelessWidget {
//   const GameScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final game = Tapxa();
//     return GameWidget(game: game);
//   }
// }

// class SplashScreenGame extends StatefulWidget {
//   const SplashScreenGame({super.key});

//   @override
//   createState() => _SplashScreenGameState();
// }

// class _SplashScreenGameState extends State<SplashScreenGame> {
//   late FlameSplashController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FlameSplashScreen(
//         showBefore: (BuildContext context) {
//           return const Text('Before logo');
//         },
//         showAfter: (BuildContext context) {
//           return const Text('After logo');
//         },
//         theme: FlameSplashTheme.dark,
//         onFinish: (context) => Navigator.pushReplacement<void, void>(
//           context,
//           MaterialPageRoute(builder: (context) => const GameScreen()),
//         ),
//       ),
//     );
//   }
// }
