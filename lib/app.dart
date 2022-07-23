import 'package:bookaneer/widgets/book_form/book_form.dart';
import 'package:bookaneer/widgets/books_list/books_list.dart';
import 'package:bookaneer/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookaneer',
      home: Scaffold(
        appBar: AppBar(title: const Text('Bookaneer!'),),
        body: BooksList(),
        bottomNavigationBar: const BottomBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) => const BookForm()
            );
          },
          child: const Icon(Icons.add),
        ),
      )
    );
  }
}