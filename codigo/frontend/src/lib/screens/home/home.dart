import "package:flutter/material.dart";
import "../home/components/body.dart";
import "components/navbar.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: buildNavigationBar(), body: const Body());
  }
}
