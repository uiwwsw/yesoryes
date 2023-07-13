import 'package:flame/components.dart';
import 'package:flame_lottie/flame_lottie.dart';

final assets = [
  Lottie.asset('assets/lottie/1.json'),
  Lottie.asset('assets/lottie/2.json'),
  Lottie.asset('assets/lottie/3.json'),
  Lottie.asset('assets/lottie/4.json'),
  Lottie.asset('assets/lottie/5.json'),
];

class Emoji extends PositionComponent {
  final double cellSize;
  final int value;
  @override
  final double x;
  @override
  final double y;
  Emoji({
    required this.value,
    required this.cellSize,
    required this.x,
    required this.y,
  });
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
    // print(super.x);
    final asset = assets[value];
    final animation = await loadLottie(asset);
    add(
      LottieComponent(animation,
          repeating: true, // Continuously loop the animation.
          size: Vector2.all(cellSize),
          position: Vector2(x, y)),
    );
  }
}
