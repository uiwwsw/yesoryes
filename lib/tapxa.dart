import 'package:flame/game.dart';
import 'package:flutter_application_1/components/stage.dart';

class Tapxa extends FlameGame {
  final double cellSize = 100.0;
  int level = 0;
  int animation = 0;
  Vector2 origin = Vector2(0, 0);
  Vector2 target = Vector2(0, 0);
  @override
  Future<void> onLoad() async {
    addAll([Stage()]);
  }
}

// /// This component is the pink-ish rectangle in the center of the game window.
// /// It uses the [DragCallbacks] mixin in order to receive drag events.
// class DragTarget extends PositionComponent with DragCallbacks {
//   DragTarget() : super(anchor: Anchor.center);

//   final _rectPaint = Paint()..color = const Color(0x88AC54BF);

//   /// We will store all current circles into this map, keyed by the `pointerId`
//   /// of the event that created the circle.
//   final Map<int, Trail> _trails = {};

//   @override
//   void onGameResize(Vector2 size) {
//     super.onGameResize(size);
//     this.size = size - Vector2(100, 75);
//     if (this.size.x < 100 || this.size.y < 100) {
//       this.size = size * 0.9;
//     }
//     position = size / 2;
//   }

//   @override
//   void render(Canvas canvas) {
//     canvas.drawRect(size.toRect(), _rectPaint);
//   }

//   @override
//   void onDragStart(DragStartEvent event) {
//     super.onDragStart(event);
//     final trail = Trail(event.localPosition);
//     _trails[event.pointerId] = trail;
//     add(trail);
//   }

//   @override
//   void onDragUpdate(DragUpdateEvent event) {
//     _trails[event.pointerId]!.addPoint(event.localPosition);
//   }

//   @override
//   void onDragEnd(DragEndEvent event) {
//     super.onDragEnd(event);
//     _trails.remove(event.pointerId)!.end();
//   }

//   @override
//   void onDragCancel(DragCancelEvent event) {
//     super.onDragCancel(event);
//     _trails.remove(event.pointerId)!.cancel();
//   }
// }

// class Trail extends Component {
//   Trail(Vector2 origin)
//       : _paths = [Path()..moveTo(origin.x, origin.y)],
//         _opacities = [1],
//         _lastPoint = origin.clone(),
//         _color =
//             HSLColor.fromAHSL(1, random.nextDouble() * 360, 1, 0.8).toColor();

//   final List<Path> _paths;
//   final List<double> _opacities;
//   Color _color;
//   late final _linePaint = Paint()..style = PaintingStyle.stroke;
//   late final _circlePaint = Paint()..color = _color;
//   bool _released = false;
//   double _timer = 0;
//   final _vanishInterval = 0.03;
//   final Vector2 _lastPoint;

//   static final random = Random();
//   static const lineWidth = 15.0;

//   @override
//   void render(Canvas canvas) {
//     assert(_paths.length == _opacities.length);
//     for (var i = 0; i < _paths.length; i++) {
//       final path = _paths[i];
//       final opacity = _opacities[i];
//       if (opacity > 0) {
//         _linePaint.color = _color.withOpacity(opacity);
//         _linePaint.strokeWidth = lineWidth * opacity;
//         canvas.drawPath(path, _linePaint);
//       }
//     }
//     canvas.drawCircle(
//       _lastPoint.toOffset(),
//       (lineWidth - 2) * _opacities.last + 2,
//       _circlePaint,
//     );
//   }

//   @override
//   void update(double dt) {
//     assert(_paths.length == _opacities.length);
//     _timer += dt;
//     while (_timer > _vanishInterval) {
//       _timer -= _vanishInterval;
//       for (var i = 0; i < _paths.length; i++) {
//         _opacities[i] -= 0.01;
//         if (_opacities[i] <= 0) {
//           _paths[i].reset();
//         }
//       }
//       if (!_released) {
//         _paths.add(Path()..moveTo(_lastPoint.x, _lastPoint.y));
//         _opacities.add(1);
//       }
//     }
//     if (_opacities.last < 0) {
//       removeFromParent();
//     }
//   }

//   void addPoint(Vector2 point) {
//     if (!point.x.isNaN) {
//       for (final path in _paths) {
//         path.lineTo(point.x, point.y);
//       }
//       _lastPoint.setFrom(point);
//     }
//   }

//   void end() => _released = true;

//   void cancel() {
//     _released = true;
//     _color = const Color(0xFFFFFFFF);
//   }
// }

// class Star extends PositionComponent with DragCallbacks, CollisionCallbacks {
//   final int n;
//   late ShapeHitbox hitbox;

//   Star({
//     required this.n,
//     required double radius1,
//     required double radius2,
//     required double sharpness,
//     required this.color,
//     super.position,
//   }) {
//     // _path = Path()..moveTo(radius1, 0);
//     // for (var i = 0; i < n; i++) {
//     //   final p1 = Vector2(radius2, 0)..rotate(tau / n * (i + sharpness));
//     //   final p2 = Vector2(radius2, 0)..rotate(tau / n * (i + 1 - sharpness));
//     //   final p3 = Vector2(radius1, 0)..rotate(tau / n * (i + 1));
//     //   _path.cubicTo(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
//     // }
//     // _path.close();
//   }
//   final Color color;
//   final Paint _paint = Paint();
//   final Paint _borderPaint = Paint()
//     ..color = const Color(0xFFffffff)
//     ..style = PaintingStyle.stroke
//     ..strokeWidth = 3;
//   final _shadowPaint = Paint()
//     ..color = const Color(0xFF000000)
//     ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4.0);
//   late final Path _path;

//   @override
//   bool containsLocalPoint(Vector2 point) {
//     return _path.contains(point.toOffset());
//   }

//   @override
//   Future<void> onLoad() async {
//     final defaultPaint = Paint()
//       ..color = Colors.cyan
//       ..style = PaintingStyle.stroke;
//     hitbox = RectangleHitbox(size: Vector2(100, 100))
//       ..paint = defaultPaint
//       ..renderShape = true;
//     add(hitbox);
//   }

//   @override
//   void render(Canvas canvas) {
//     var textPaint = TextPaint(
//       style: const TextStyle(
//           fontSize: 100.0,
//           fontFamily: 'Awesome Font',
//           color: Color.fromARGB(255, 255, 255, 255)),
//     );
//     textPaint.render(canvas, '_value', Vector2(0, 0));

//     // if (isDragged) {
//     //   _paint.color = color.withOpacity(0.5);
//     //   canvas.drawPath(_path, _paint);
//     //   canvas.drawPath(_path, _borderPaint);
//     // } else {
//     //   _paint.color = color.withOpacity(1);
//     //   canvas.drawPath(_path, _shadowPaint);
//     //   canvas.drawPath(_path, _paint);
//     // }
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);

//     if (n == 5) {
//       position += Vector2(0, position.y - dt);
//     }
//   }

//   @override
//   void onDragStart(DragStartEvent event) {
//     super.onDragStart(event);
//     priority = 10;
//   }

//   @override
//   void onDragEnd(DragEndEvent event) {
//     super.onDragEnd(event);
//     priority = 0;
//   }

//   @override
//   void onDragUpdate(DragUpdateEvent event) {
//     position += event.delta;
//   }

//   // @override
//   // void onMount() {
//   //   super.onMount();
//   //   final defaultPaint = Paint()
//   //     ..color = Colors.red
//   //     ..style = PaintingStyle.stroke;
//   //   final shape = CircleHitbox.relative(3,
//   //       parentSize: size, position: size / 2, anchor: Anchor.center)
//   //     ..paint = defaultPaint
//   //     ..renderShape = true;
//   //   add(shape);
//   // }

//   @override
//   void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
//     super.onCollision(intersectionPoints, other);

//     print('dddd');
//     // // Bullet과 충돌시
//     // if (other is Bullet) {
//     //   // hp 감소처리
//     //   _hitPoints -= gameRef.gameManager.bulletPowerPoint;
//     //   current = 2;
//     // }
//     // // 플레이어와 충돌시 게임오버
//     // else if (other is Player) {
//     //   destroy(isGameOver: true);
//     //   gameRef.gameOver();
//     // }
//   }
// }

// const tau = 2 * pi;
