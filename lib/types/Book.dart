import 'package:hive/hive.dart';
import '../utils/generate_id.dart';
part 'book.g.dart';

@HiveType(typeId: 0)
class Book extends HiveObject {
  @HiveField(0)
  final String id = generateId();

  @HiveField(1)
  final String title;

  @HiveField(2)
  bool isBought;

  Book({ required this.title, required this.isBought });
}