import "package:flutter/material.dart";
import '../screens/profile/profile.dart';
import '../screens/ranking/ranking.dart';
import '../screens/submitProject/project_info.dart';
import "package:src/screens/home/home.dart";

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
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up_alt_outlined), label: 'Like'),
      BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Add'),
      BottomNavigationBarItem(
          icon: Icon(Icons.workspace_premium_outlined), label: 'Ranking'),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined), label: 'User')
    ];

    List<Widget> widgetOptions = const [
      Home(),
      Center(child: Text("404 - Not Found")),
      ProjectInfo(),
      Ranking(),
      Profile()
    ];

    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: items,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
