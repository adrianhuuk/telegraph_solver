import 'dart:math';

import 'package:telegraph_solver/cypher.dart';

void main() {
  String text = q10b.replaceAll(RegExp(r'\s+'), '');
  int len = 6;
  double expectedFreq = text.length / (pow(3, len) * len);
  checkOptions(text, expectedFreq, 10);
}

const chars = [r'\', '/', '|'];

void checkOptions(
  String cypher,
  double expectedFreq,
  int maxDepth, {
  int currentDepth = 0,
  String? prev,
}) {
  if (maxDepth < currentDepth) return;
  for (var e in chars) {
    final newStr = (prev ?? '') + e;
    final count = RegExp.escape(newStr).allMatches(cypher).length;
    final percentDiff = (count - expectedFreq).abs() / expectedFreq;
    if (count != 0 && percentDiff > 0.01) {
      print(newStr);
    }
    checkOptions(
      cypher,
      expectedFreq,
      maxDepth,
      currentDepth: currentDepth + 1,
      prev: newStr,
    );
  }
}
