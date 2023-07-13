import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'emoji.dart';

class Cell extends PositionComponent {
  late ShapeHitbox hitbox;
  final double cellSize;
  final int value;
  @override
  final double x;
  @override
  final double y;
  Cell(
      {required this.value,
      required this.x,
      required this.y,
      required this.cellSize});
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
    add(Emoji(cellSize: cellSize, value: value, x: x, y: y));
    final defaultPaint = Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.stroke;
    hitbox = RectangleHitbox(
        position: Vector2(x, y), size: Vector2(cellSize, cellSize))
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
  }
}
