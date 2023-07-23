import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_lottie/flame_lottie.dart';
import 'package:flutter/material.dart';

final assets = [
  Lottie.asset('assets/lottie/1.json'),
  Lottie.asset('assets/lottie/2.json'),
  Lottie.asset('assets/lottie/3.json'),
  Lottie.asset('assets/lottie/4.json'),
  Lottie.asset('assets/lottie/5.json'),
];

class Cell extends PositionComponent with DragCallbacks, CollisionCallbacks {
  late final ShapeHitbox hitbox;
  final int value;
  Cell({required this.value, super.size, super.position}) : super();
  // Cell({required this.value, required this.position, required this.size});

  // @override
  // Future<void> onLoad() async {
  //   // final gameOverText =
  //   //     GameOverText(spriteImage); // GameOverText is a Component
  //   // final gameOverButton =
  //   //     GameOverButton(spriteImage); // GameOverRestart is a SpriteComponent
  //   // add(gameOverText);
  //   // add(gameOverButton);
  // }
  // @override
  // bool containsLocalPoint(Vector2 point) {
  //   return _path.contains(point.toOffset());
  // }

  @override
  Future<void> onLoad() async {
    // components.register();
    final asset = assets[value];
    final animation = await loadLottie(asset);
    add(
      LottieComponent(
        animation,
        repeating: true, // Continuously loop the animation.
        size: size,
      ),
    );
    final defaultPaint = Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.stroke;
    hitbox = RectangleHitbox(size: size)
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    if (event.delta.x.abs() > event.delta.y.abs()) {
      int plusMinus = event.delta.x > 0 ? 1 : -1;
      print(super.position);
      double amount = 0;
      if (plusMinus == 1) {
        amount = max(event.delta.x, event.localPosition.x + 100);
      } else {
        amount = min(event.delta.x, event.localPosition.x - 100);
      }
      position += Vector2(amount, 0);
    } else {
      //   int plusMinus = event.delta.y > 0 ? 1 : -1;
      //   double amount = max(event.delta.y.abs(), 100);
      //   position += Vector2(0, plusMinus * amount);
    }
    // priority = 10;
    // position += event.delta;
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);

    priority = 0;
  }

  @override
  void onDragStart(DragStartEvent event) {
    super.onDragStart(event);
    priority = 10;
  }
}
