import 'package:flutter/material.dart';

class AtributteWidget extends StatelessWidget {
  const AtributteWidget({Key? key, required this.atributte}) : super(key: key);
  final String atributte;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 5.0, top: 5.0, right: 3.0),
      child: (Text(
        atributte,
        textDirection: TextDirection.ltr,
        style: const TextStyle(
          color: Color.fromARGB(255, 99, 99, 99),
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      )),
    ));
  }
}
