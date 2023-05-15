import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key, required this.info}) : super(key: key);
  final String info;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
      child: (Text(
        info,
        textDirection: TextDirection.ltr,
        style: const TextStyle(
          color: Color.fromARGB(255, 99, 99, 99),
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
        ),
      )),
    ));
  }
}
