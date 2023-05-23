import "package:flutter/material.dart";
import 'package:src/screens/ranking/components/body.dart';
import '../../widgets/navbar.dart';

class Ranking extends StatelessWidget {
  const Ranking({super.key});
  // const Ranking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Body());
  }
}
