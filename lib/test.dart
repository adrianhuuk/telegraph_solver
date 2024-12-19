import 'package:telegraph_solver/cypher.dart';
import 'package:telegraph_solver/two_needle.dart';

void main () {
  String text = q10b.replaceAll(RegExp(r'\s+'), '');
  print(text.length);
  for (var e in dualNeedle.values) {
    text = text.replaceAll(e, '');
  }
  print(text.length);
  print(text);
}