import 'package:flame/components.dart';
import 'package:flutter/material.dart';

var textPaint = TextPaint(
  style: const TextStyle(
      fontSize: 100.0,
      fontFamily: 'Awesome Font',
      color: Color.fromARGB(255, 255, 255, 255)),
);

class Cell extends PositionComponent {
  final String _value;
  final double _x;
  final double _y;
  static final List<String> _cell = ['😀', '🤣', '🥰', '🤩', '😜', '🤭'];
  Cell({required int value, required double x, required double y})
      : _value = _cell[value],
        _x = x,
        _y = y;
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
  void render(Canvas canvas) {
    textPaint.render(canvas, _value, Vector2(_x, _y));
  }
}
