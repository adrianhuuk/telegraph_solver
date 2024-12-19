import 'dart:io';

import 'package:telegraph_solver/general.dart';

void main() {
  print(getPeriodOptionsFromInput());
  stdin.readLineSync();
}

List<int> getPeriodOptionsFromInput([String? cypher]) {
  cypher ??= inputCypher();
  final maxPeriod = inputMaxPeriod();
  List<int> options = getPeriodOptions(cypher, maxPeriod);
  return options;
}

List<int> getPeriodOptions(String cypher, int maxKey) {
  final trimCypher = cypher.replaceAll(RegExp(r'\s+'), '');
  final options = <int>[];
  keyLoop:
  for (var i = 1; i < maxKey; i++) {
    if (trimCypher.length % i == 0) {
      // final blockCount = trimCypher.length ~/ i;
      for (var j = 0; j < trimCypher.length; j += i) {
        final substr = trimCypher.substring(j, j + i);
        if (!isOneMatch(substr, r'\') || !isOneMatch(substr, r'/')) {
          continue keyLoop;
        }
      }
      options.add(i);
    }
  }
  return options;
}
