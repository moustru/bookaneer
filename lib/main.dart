import 'package:bookaneer/types/Book.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());
  await Hive.openBox('books');
  runApp(MaterialApp(home: App()));
}

