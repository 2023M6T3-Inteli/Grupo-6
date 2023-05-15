import "package:flutter/material.dart";
import 'package:src/screens/profile/components/body.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: Body()),
    );
  }
}
