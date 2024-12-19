import 'dart:io';
import 'dart:math';
import 'package:telegraph_solver/general.dart';

class Coord {
  final int x;
  final int y;
  Coord(this.x, this.y);

  int get sum => x + y;
}

class Grid {
  final String key;
  final int size; // Max x/y coord
  int get gridCount => size * (size + 1);

  Grid({
    required String key,
    required this.size,
  }) : key = key.padRight(size * (size + 1), r'$');

  Grid.fromCypher({
    required List<String> cypher,
    required this.key,
  }) : size = cypher[0].length - 1;

  String decrypt(List<Coord> cypher) {
    var result = '';
    for (var e in cypher) {
      final isTopHalf = e.sum <= size;
      if (e.sum == size) {
        print('invalid');
      }
      final temp = isTopHalf ? e : Coord(size - e.x, size - e.y);
      // if (e.sum > 4) {
      //   result += r'$';
      //   continue;
      // }

      var index = 0;
      var lasti = 0;
      for (lasti = 0; lasti < temp.sum; lasti++) {
        index += lasti + 1;
      }
      index += temp.x;
      result += isTopHalf ? key[index] : key[gridCount - index - 1];
    }
    return result;
  }
}

int indexOrError(String input, String pattern) {
  final result = input.indexOf(pattern);
  if (result == -1) {
    print('There was a missing $pattern in section $input');
    // return 0;
    throw Exception('There was a missing $pattern in section $input');
  }
  return result;
}

List<Coord> formatCypher(int period, String input) {
  input = input.replaceAll(RegExp(r'\s+'), '');
  var splitCypher = <String>[];
  for (var i = 0; i < input.length; i += period) {
    final sub = input.substring(i, min(i + period, input.length));
    if (sub.length < period) {
      print('Cypher length not divisible by $period. Truncating...');
      continue;
    }
    splitCypher.add(sub);
  }
  final result = <Coord>[];
  for (var e in splitCypher) {
    result
        .add(Coord(indexOrError(e, r'/'), period - indexOrError(e, r'\') - 1));
  }
  return result;
}

void main() {
  decryptFromInput();
  stdin.readLineSync();
}

void decryptFromInput({String? cypher, String? key, int? period}) {
  final cyphertext = inputCypher();
  int period = inputPeriod();
  String key = inputKey();
  
  String plaintext = decryptCypher(key, period, cyphertext);
  print(plaintext);
}

String decryptCypher(String key, int period, String cyphertext) {
  final grid = Grid(
    key: key,
    size: period - 1,
  );

  final formattedcypher = formatCypher(period, cyphertext);
  final plaintext = grid.decrypt(formattedcypher);
  return plaintext;
}