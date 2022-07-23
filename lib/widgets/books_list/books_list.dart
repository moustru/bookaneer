import 'package:bookaneer/widgets/book_item.dart';
import 'package:flutter/material.dart';
import '../../types/Book.dart';

class BooksList extends StatefulWidget {

  BooksList({Key? key}) : super(key: key);

  @override
  State<BooksList> createState() => BooksListState();
}

class BooksListState extends State<BooksList> {
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
          return BookItem(data: books[index], callback: buyBook,);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider()
      ),
    );
  }
}