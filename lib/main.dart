import 'dart:io';

import 'package:telegraph_solver/auto_key_length.dart';
import 'package:telegraph_solver/decryption.dart';
import 'package:telegraph_solver/general.dart';

final inputMap = <String, void Function()>{
  '1': decryptAndPrintOptions,
  '2': decryptFromInput,
  '3': () => print(getPeriodOptionsFromInput()),
};
void main() {
  print(
    '''Choose an option:
    1. Decrypt cypher and print options (all features)
    2. Decrypt from a known period and key
    3. Give automatic options for period''',
  );
  final choice = stdin.readLineSync()!;
  inputMap[choice]!();
  stdin.readLineSync();
}

void decryptAndPrintOptions() {
  final cypher = inputCypher();
  final periods = getPeriodOptionsFromInput(cypher);
  final key = inputKey();
  for (var period in periods) {
    print(decryptCypher(key, period, cypher));
  }
}
