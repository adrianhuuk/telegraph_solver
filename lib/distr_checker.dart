import 'cypher.dart';

void main () {
  String text = q10b.replaceAll(RegExp(r'\s+'), '');

  final step = 24;
  var count = 0;

  for (var i = 0; i < text.length; i += step) {
    final a = RegExp(r'\\').allMatches(text.substring(i, i + step)).length;
    final b = RegExp(r'|').allMatches(text.substring(i, i + step)).length;
    final c = RegExp(r'/').allMatches(text.substring(i, i + step)).length;
    if (!(a == b && b == c)) {
      // print(text.substring(i, i + step));
      // print(i);
      count++;
    }
  }
  print(count);
}