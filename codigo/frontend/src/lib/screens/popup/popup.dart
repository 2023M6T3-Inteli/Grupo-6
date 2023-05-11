import 'package:flutter/material.dart';

Padding popUp() {
  return const Padding(
    padding:  EdgeInsets.symmetric(vertical: 10),
    child: SizedBox(
      height: 165,
      width: 390,
      child: DecoratedBox
      (decoration: BoxDecoration(
        color: Color.fromARGB(255, 228, 225, 225),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    )
    );
}