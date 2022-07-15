import 'dart:math';

import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookaneer',
      home: Scaffold(
        appBar: AppBar(title: const Text('Bookaneer!'),),
        body: _BooksList()
      )
    );
  }
}

String generateId() {
  Random rand = Random();
  String result = '';
  const List<String> symbols = [ 'a', 'b', 'c', 'd', 'e', 'f', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ];

  for (int i = 0; i < 10; i++) {
    result += symbols[rand.nextInt(symbols.length)];
  }

  return result;
}

class _BooksList extends StatefulWidget {

  _BooksList({Key? key}) : super(key: key);

  @override
  State<_BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<_BooksList> {
  final List<Book> books = [
    Book(title: 'Платон - Государство', isBought: true),
    Book(title: 'Дж.Оруэлл - 1984', isBought: false),
    Book(title: 'А.Энгельгардт - Письма из деревни', isBought: true),
    Book(title: 'Р.Мартин - Чистая архитектура', isBought: false),
    Book(title: 'И.Ефремов - Таис Афинская', isBought: true)
  ];

  void buyBook(String id) {
    Book relatedBook = books.firstWhere((book) => book.id == id);

    setState(() {
      relatedBook.isBought = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: ListView.separated(
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return _BookItem(data: books[index], callback: buyBook,);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider()
      ),
    );
  }
}

class _BookItem extends StatelessWidget {
  final Book data;
  final Function(String) callback;

  const _BookItem({
    Key? key,
    required this.data,
    required this.callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          ElevatedButton(
            onPressed: () => callback(data.id),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                data.isBought ? Colors.grey : Colors.green
              )
            ),
            child: Text(data.isBought ? 'В библиотеке' : 'Куплено')
          )
        ]
      ),
    );
  }
}

class Book {
  final String id = generateId();
  final String title;
  bool isBought;

  Book({ required this.title, required this.isBought });
}