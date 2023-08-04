import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame_lottie/flame_lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/tapxa.dart';

final assets = [
  Lottie.asset('assets/lottie/1.json'),
  Lottie.asset('assets/lottie/2.json'),
  Lottie.asset('assets/lottie/3.json'),
  Lottie.asset('assets/lottie/4.json'),
  Lottie.asset('assets/lottie/5.json'),
];

class Cell extends PositionComponent
    with DragCallbacks, CollisionCallbacks, HasGameRef<Tapxa> {
  // EffectController effectController = EffectController();
  late final ShapeHitbox hitbox;
  late Vector2 _position;
  final int value;
  late LottieComponent Component;
  String direction = '';
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
    // final effect = MoveEffect.by(
    //     Vector2(position.x + 100, position.y + 100),
    //     EffectController(duration: 3));
    Component = LottieComponent(
      animation,
      repeating: true, // Continuously loop the animation.
      size: size,
    );
    add(Component);

    final defaultPaint = Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.stroke;
    hitbox = RectangleHitbox(size: size)
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
  }

  move(String direction) async {
    double horizon = 0;
    double vertical = 0;
    switch (direction) {
      case '오른쪽':
        horizon = 100;
        break;
      case '왼쪽':
        horizon = -100;
        break;
      case '아래쪽':
        vertical = 100;
        break;
      case '위쪽':
        vertical = -100;
        break;
    }
    if (gameRef.animation == 0) {
      var target = Vector2(horizon, vertical);
      final effect = MoveEffect.by(
        target,
        EffectController(duration: .3),
        onComplete: () {
          gameRef.animation = 2;
        },
      );
      gameRef.animation = 1;
      gameRef.target = _position + target;
      Component.add(effect);
    }
    await Future.delayed(const Duration(seconds: 300));

    // position += Vector2(x, y);
    // effect();
    // position = Vector2(_position.x + horizon, _position.y + vertical);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) async {
    super.onDragUpdate(event);
    if (event.delta.x.abs() > event.delta.y.abs()) {
      if (event.delta.x > 0) {
        await move('오른쪽');
      } else if (event.delta.x < 0) {
        await move('왼쪽');
      }
    } else if (event.delta.x.abs() < event.delta.y.abs()) {
      if (event.delta.y > 0) {
        await move('아래쪽');
      } else if (event.delta.y < 0) {
        await move('위쪽');
      }
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
    _position = Vector2(position.x, position.y);
    print(position);
    priority = 10;
    gameRef.target = _position;
  }
}
