import 'general.dart';
import 'two_needle.dart';

final codes = dualNeedle.values.map((e) => e.padRight(0, '|'),).toList();

List<List<String>> getTwoKeyOptions(String cypher, {List<String>? leading}) {
  final options = <List<String>>[];
  for (var e in codes) {
    if (cypher.substring(0, e.length) == e) {
      if (cypher.length == e.length) {
        options.add([...leading ?? [], e]);
        continue;
      }
      final furtherOptions = getTwoKeyOptions(cypher.substring(e.length), leading: [...leading ?? [], e]);
      options.addAll(furtherOptions);
    }
  }
  return options;
}

void main() {
  final cypher = inputCypher();
  final options = getTwoKeyOptions(cypher);
  final reverseConverter = dualNeedle.map((key, value) => MapEntry(value, key,));
  for (var e in options) {
    print(e.map((e) => reverseConverter[e]));
  }
}