import 'package:hive_flutter/hive_flutter.dart';

class AppModel {
  AppModel() {
    init();
  }

  void init() async {
    await Hive.initFlutter();
  }
}