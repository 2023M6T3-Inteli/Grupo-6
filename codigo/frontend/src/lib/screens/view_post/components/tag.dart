import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  // final String text;
  const Tag({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5),
      child: SizedBox(
        height: 33,
        width: 91,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 246, 247),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(width: 2.0, color: const Color.fromARGB(255, 49, 162, 227)),
            // borderColor: Color.fromARGB(255, 3, 52, 92),
          ),
          child: Center(
            child: Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromARGB(255, 49, 162, 227),
                    fontSize: 13)),
          ),
        ),
      ),
    );
  }
}