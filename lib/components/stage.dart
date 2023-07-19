import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'cell.dart';

class Stage extends PositionComponent with HasCollisionDetection {
  final cellSize = NotifyingVector2(100, 100);
  final int level;
  final List<Cell> maps = [];
  static final _maps = [
    [
      [0, 0, 0, 0, 0],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 0]
    ],
  ];
  Stage({required this.level}) {
    print('djwkladjalw');
    for (var map in _maps) {
      // maps.addAll(map.map((e) => null))
    }
  }

  @override
  void onMount() {
    super.onMount();
    if (level == 0) {
      add(
        Cell(value: 0, position: NotifyingVector2(0, 0), size: cellSize),
      );
    } else {
      add(
        Cell(value: 2, position: NotifyingVector2(300, 0), size: cellSize),
      );
    }
  }

  // @override
  // onLoad() {
  //   if (state == 0) {
  //     add(
  //       Cell(value: 0, position: NotifyingVector2(0, 0), size: cellSize),
  //     );
  //   } else {
  //     add(
  //       Cell(value: 1, position: NotifyingVector2(100, 0), size: cellSize),
  //     );
  //   }
  //  Cell(value: 0, position: NotifyingVector2(0, 0), size: cellSize),
  //   Cell(value: 2, position: NotifyingVector2(200, 0), size: cellSize),
  //   Cell(value: 3, position: NotifyingVector2(0, 100), size: cellSize),
  //   Cell(value: 4, position: NotifyingVector2(100, 100), size: cellSize),
  //   Cell(value: 0, position: NotifyingVector2(0, 200), size: cellSize),
  //   Cell(value: 1, position: NotifyingVector2(100, 200), size: cellSize),
  //   Cell(value: 2, position: NotifyingVector2(200, 200), size: cellSize),
  //   Cell(value: 3, position: NotifyingVector2(0, 300), size: cellSize),
  //   Cell(value: 4, position: NotifyingVector2(100, 300), size: cellSize),
  // }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    this.size = size;
    if (this.size.x < 100 || this.size.y < 100) {
      this.size = size * 0.9;
    }
    position = size / 2;
  }
}
