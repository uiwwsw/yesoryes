List<String> icons = [
  '😀',
  '🤣',
  '😍',
  '😜',
  '🤢',
  '🥵',
  '🥶',
  '😈',
  '💀',
  '💩',
  '🤡'
];
void main() {
  Controller a = Controller('1,1,2,1,1/2,2,1,2,2');
  a.toTop(2, 1);
  print(a.stage);
}

class Controller {
  late int width;
  late int height;
  late List<List<String>> stage;
  Controller(String map) {
    stage = map
        .split('/')
        .map((row) =>
            row.split(',').map((coll) => icons[int.parse(coll)]).toList())
        .toList();
    width = stage[0].length;
    height = stage.length;
  }
  get saveWidth => width - 1;
  get saveHeight => height - 1;
  void action({required int x, required int y, int? addX, int? addY}) {
    String target = stage[y][x];
    int positionX = x + (addX ?? 0);
    int positionY = y + (addY ?? 0);
    stage[y][x] = stage[positionY][positionX];
    stage[positionY][positionX] = target;
  }

  void toTop(int x, int y) {
    action(x: x, y: y, addY: -1);
  }

  void toBottom(int x, int y) {
    action(x: x, y: y, addY: 1);
  }

  void toLeft(int x, int y) {
    action(x: x, y: y, addX: -1);
  }

  void toRight(int x, int y) {
    action(x: x, y: y, addX: 1);
  }
}
