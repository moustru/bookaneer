import 'package:hive/hive.dart';

class Store {
  static Future<Box> openBox(String name) async {
    return Hive.openBox(name);
  }

  static void closeBox(Box box) async {
    box.close();
  }
}