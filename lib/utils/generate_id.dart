import 'dart:math';

String generateId() {
  Random rand = Random();
  String result = '';
  const List<String> symbols = [ 'a', 'b', 'c', 'd', 'e', 'f', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ];

  for (int i = 0; i < 10; i++) {
    result += symbols[rand.nextInt(symbols.length)];
  }

  return result;
}