import 'package:hive/hive.dart';

class Store {
  Future<Box> openBox(String name) async {
    return Hive.openBox(name);
  }

  void _compact(Box box) {
    box.compact();
  }

  void closeBox(Box box) async {
    _compact(box);
    box.close();
  }
}