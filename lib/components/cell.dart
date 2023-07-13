import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'emoji.dart';

class Cell extends PositionComponent {
  late final ShapeHitbox hitbox;
  final int value;
  @override
  final NotifyingVector2 position;
  @override
  final NotifyingVector2 size;
  Cell({required this.value, required this.position, required this.size});
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
  @override
  Future<void> onLoad() async {
    add(Emoji(value: value, size: size, position: position));
    final defaultPaint = Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.stroke;
    hitbox = RectangleHitbox(position: position, size: size)
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
  }
}
