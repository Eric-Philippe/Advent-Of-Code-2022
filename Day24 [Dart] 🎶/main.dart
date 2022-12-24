import 'PartOneTwo.dart';

void main(List<String> arguments) {
  File file = File('input.txt');
  map = file.readAsLinesSync();
  m = map.length;
  n = map[0].length;
  for (int i = 0; i < m; ++i) {
    for (int j = 0; j < n; ++j) {
      if (dirId.containsKey(map[i][j])) {
        pos.add(Tuple(i, j, dirId[map[i][j]]!));
      }
    }
  }

  int partOne = bfs(0, 1, 0, m - 1, n - 2);
  print(partOne);

  int partTwo = bfs(m - 1, n - 2, partOne, 0, 1);
  partTwoResult = bfs(0, 1, partTwo, m - 1, n - 2);
  print(partTwo);
}