import 'package:flutter/material.dart';
import '../types/Book.dart';

class BookItem extends StatelessWidget {
  final Book data;
  final Function(String) callback;

  const BookItem({
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