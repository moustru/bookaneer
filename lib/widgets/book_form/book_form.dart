import 'package:flutter/material.dart';

class BookForm extends StatelessWidget {
  const BookForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.amber,
      child: Center(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
          ),
          child: const Text(
            'hi!',
            style: TextStyle(
              color: Colors.white
            )
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}