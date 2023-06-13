import 'package:flutter/material.dart';

class ProfileTag extends StatelessWidget {
  const ProfileTag({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        height: 30,
        width: 107,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 217, 245, 253),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                width: 2.0, color: const Color.fromARGB(255, 49, 162, 227)),
            // borderColor: Color.fromARGB(255, 3, 52, 92),
          ),
          child: Center(
            child: Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromARGB(255, 49, 162, 227), fontSize: 13)),
          ),
        ),
      ),
    );
  }
}
