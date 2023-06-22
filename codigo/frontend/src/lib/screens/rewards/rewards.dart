import 'package:flutter/material.dart';
import 'package:src/screens/rewards/components/body.dart';

class Rewards extends StatelessWidget {
  const Rewards({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
