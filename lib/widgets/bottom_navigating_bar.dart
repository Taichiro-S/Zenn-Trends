import 'package:flutter/material.dart';

class BottomNavigatingBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigatingBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<BottomNavigatingBar> createState() => _BottomNavigatingBarState();
}

class _BottomNavigatingBarState extends State<BottomNavigatingBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.query_stats),
          label: 'Chart',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.star),
        //   label: 'Favorites',
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
    );
  }
}
