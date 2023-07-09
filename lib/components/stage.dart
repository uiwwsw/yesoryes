import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class Stage extends PositionComponent with DragCallbacks {
  final _rectPaint = Paint()..color = const Color(0x88AC54BF);

  // Stage({required int value, required double x, required double y})
  //     : _value = _cell[value],
  //       _x = x,
  //       _y = y;
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
    // var x = const RRect.fromLTRBXY(0, 0, 100, 100, 10, 10);
    // var y = Paint()
    //   ..color = const Color(0x5CEF971B)
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 35;
    canvas.drawRect(size.toRect(), _rectPaint);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    this.size = size - Vector2(100, 75);
    if (this.size.x < 100 || this.size.y < 100) {
      this.size = size * 0.9;
    }
    position = size / 2;
  }
}
