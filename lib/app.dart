import 'package:bookaneer/widgets/book_form/book_form.dart';
import 'package:bookaneer/widgets/books_list/books_list.dart';
import 'package:bookaneer/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _key = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _key,
      title: 'Bookaneer',
      home: Scaffold(
        appBar: AppBar(title: const Text('Bookaneer!'),),
        body: BooksList(),
        bottomNavigationBar: const BottomBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            void callback() {
              _key.currentState?.showSnackBar(
                const SnackBar(
                  content: Text('Книга добавлена в вишлист!'),
                  duration: Duration(milliseconds: 3000),
                )
              );
            }

            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Добавление книги'),
                content: BookForm(callback: callback),
              );
            });
          },
          child: const Icon(Icons.add),
        ),
      )
    );
  }
}