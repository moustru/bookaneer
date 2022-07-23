import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedItem = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Вишлист'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Библиотека'
        )
      ],
      currentIndex: selectedItem,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: _onItemTapped,
    );
  }
}