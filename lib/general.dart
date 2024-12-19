import 'dart:io';

import 'package:telegraph_solver/cypher.dart';


String inputOrFallback(String fallback) {
  final main = stdin.readLineSync();
  return main?.isEmpty ?? true ? fallback : main!;
}

bool isOneMatch(String text, Pattern pattern) {
  if (text.contains(pattern) && text.indexOf(pattern) == text.lastIndexOf(pattern)) {
    return true;
  }
  return false;
}

int count(String text, Pattern pattern) {
  int count = 0;
  for (var i = 0; i < text.length; i++) {
    if (text[i] == pattern) {
      count++;
    }
  }
  return count;
}

String inputKey() {
  print(r'Enter the cypher key. Trailing gaps are filled with "$". (default alphabet)');
  final key = inputOrFallback('abcdefghijklmnopqrstuvwxyz');
  return key;
}

int inputPeriod() {
  print('Enter the cypher characters per plain character (default 6)');
  final period = int.parse(inputOrFallback('6'));
  return period;
}

int inputMaxPeriod() {
  print('Enter the maximum period you wish to check (default 10)');
  final maxKey = int.parse(inputOrFallback('10'));
  return maxKey;
}

String inputCypher() {
  print('Enter the cyphertext (default q9b)');
  return inputOrFallback(q10b);
}
