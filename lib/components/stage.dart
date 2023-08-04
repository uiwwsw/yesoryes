import 'dart:js_interop';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter_application_1/tapxa.dart';

import 'cell.dart';

class Stage extends PositionComponent with HasGameRef<Tapxa> {
  final cellSize = NotifyingVector2(100, 100);
  Stage() : super();
  final int level = 0;
  // List<List<Cell>> map;
  static final mapsArr = [
    [
      [0, 0, 0, 0, 0],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 0]
    ],
    [
      [1, 2, 3, 4, 5],
      [1, 2, 3, 4, 5],
      [1, 2, 3, 4, 5],
      [1, 2, 3, 4, 5],
    ]
  ];
  get map => Stage.mapsArr[level]
      .asMap()
      .entries
      .map((rowEntry) => rowEntry.value.asMap().entries.map(
            (cellEntry) => Cell(
                value: cellEntry.value,
                position:
                    NotifyingVector2(cellEntry.key * 100, rowEntry.key * 100),
                size: cellSize),
          ));

  // Stage.fromLevel({required this.level, required this.maps}) {

  // }

  @override
  void onMount() {
    super.onMount();
    gameRef.level = 1;

    for (var row in map) {
      addAll(row);
    }
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    print(gameRef.target);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // registerExtension();
    // fromLevel();
    // componentss
    // components
    // componentsAtPoint(Tapxa)
    // components.register<Tapxa>();
  }

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
