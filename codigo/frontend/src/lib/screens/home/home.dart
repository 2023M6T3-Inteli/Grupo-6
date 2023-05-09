import "package:flutter/material.dart";
import "../home/components/body.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: buildNavigationBar(), body: const Body());
  }

  BottomNavigationBar buildNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up_alt_outlined), label: 'Like'),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined), label: 'Add'),
        BottomNavigationBarItem(
            icon: Icon(Icons.workspace_premium_outlined), label: 'Ranking'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined), label: 'User')
      ],
    );
  }
}
