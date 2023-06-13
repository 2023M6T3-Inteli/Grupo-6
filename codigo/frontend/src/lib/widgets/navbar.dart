import "package:flutter/material.dart";
import 'add_post.dart';

class NavBarRouter extends StatefulWidget {
  const NavBarRouter({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavBarRouterState createState() => _NavBarRouterState();
}

class _NavBarRouterState extends State<NavBarRouter> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/feed');
        break;
      case 2:
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => ModalBottomSheet(),
        );
        break;
      case 3:
        Navigator.pushNamed(context, '/ranking');
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(
          icon: Icon(Icons.search), label: 'Feed'),
      BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Add'),
      BottomNavigationBarItem(
          icon: Icon(Icons.workspace_premium_outlined), label: 'Ranking'),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined), label: 'User')
    ];

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: items,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}
