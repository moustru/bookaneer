import '../utils/generate_id.dart';

class Book {
  final String id = generateId();
  final String title;
  bool isBought;

  Book({ required this.title, required this.isBought });
}