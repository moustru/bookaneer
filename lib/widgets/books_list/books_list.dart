import 'package:bookaneer/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../../types/Book.dart';

class BooksList extends StatefulWidget {

  BooksList({Key? key}) : super(key: key);

  @override
  State<BooksList> createState() => BooksListState();
}

class BooksListState extends State<BooksList> {
  void buyBook(String id) {
    // Book relatedBook = books.firstWhere((book) => book.id == id);

    // setState(() {
    //   relatedBook.isBought = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: ValueListenableBuilder(
        valueListenable: Hive.box('books').listenable(),
        builder: (BuildContext context, Box box, widget) {
          return ListView.separated(
            itemCount: box.length,
            itemBuilder: (BuildContext context, int index) {
              Book book = box.getAt(index);
              return BookItem(data: book, callback: buyBook,);
            },
            separatorBuilder: (BuildContext context, int index) => const Divider()
          );
        },
      ),
    );
  }
}