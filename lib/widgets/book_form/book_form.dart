import 'package:bookaneer/types/Book.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class BookForm extends StatefulWidget {
  final Function() callback;
  BookForm({Key? key, required this.callback}) : super(key: key);

  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  final _key = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    final String text = _controller.text;

    super.initState();
    _controller.value = _controller.value.copyWith(text: text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future addBook(Book book) async {
    await Hive.box('books').add(book);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Название *'
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Не введено название книги';
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await addBook(Book(title: _controller.text, isBought: false));
                  Navigator.of(context).pop();
                  widget.callback();
                }
              },
              child: const Text('Добавить')
            )
          ],
        )
    );
  }
}