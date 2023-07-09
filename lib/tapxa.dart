import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter_application_1/components/cell.dart';
import 'package:flutter_application_1/components/stage.dart';

class Tapxa extends FlameGame {
  static const double cellGap = 15.0;
  static const double cellWidth = 2000.0;
  static const double cellHeight = 2000.0;
  static const double cellRadius = 20.0;
  static final Vector2 cellSize = Vector2(cellWidth, cellHeight);

  @override
  Future<void> onLoad() async {
    final cell = [
      Cell(value: 1, x: 100, y: 100),
      Cell(value: 2, x: 200, y: 100)
    ];
    final stage = Stage();
    final world = World()
      ..add(stage)
      ..addAll(cell);
    // print(cell);
    add(world);
    // await Flame.images.load('klondike-sprites.png');

    // final stock = Stock()
    //   ..size = cardSize
    //   ..position = Vector2(cardGap, cardGap);
    // final waste = Waste()
    //   ..size = cardSize
    //   ..position = Vector2(cardWidth + 2 * cardGap, cardGap);
    // final foundations = List.generate(
    //   4,
    //   (i) => Foundation()
    //     ..size = cardSize
    //     ..position =
    //         Vector2((i + 3) * (cardWidth + cardGap) + cardGap, cardGap),
    // );
    // final piles = List.generate(
    //   7,
    //   (i) => Pile()
    //     ..size = cardSize
    //     ..position = Vector2(
    //       cardGap + i * (cardWidth + cardGap),
    //       cardHeight + 2 * cardGap,
    //     ),
    // );

    // final world = World()
    //   ..add(stock)
    //   ..add(waste)
    //   ..addAll(foundations)
    //   ..addAll(piles);
    // add(world);

    // final camera = CameraComponent(world: world)
    //   ..viewfinder.visibleGameSize = Vector2(2000, 2000)
    //   ..viewfinder.position = Vector2(0, 0)
    //   ..viewfinder.anchor = Anchor.topCenter;
    // add(camera);

    // final random = Random();
    // for (var i = 0; i < 7; i++) {
    //   for (var j = 0; j < 4; j++) {
    //     final card = Card(random.nextInt(13) + 1, random.nextInt(4))
    //       ..position = Vector2(100 + i * 1150, 100 + j * 1500)
    //       ..addToParent(world);
    //     // flip the card face-up with 90% probability
    //     if (random.nextDouble() < 0.9) {
    //       card.flip();
    //     }
    //   }
    // }
  }

  static Sprite tabxaSprite(double x, double y, double width, double height) {
    return Sprite(
      Flame.images.fromCache('klondike-sprites.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height),
    );
  }
}
