import "package:flutter/material.dart";

class Circle extends StatelessWidget {
  const Circle({Key? key, required this.icon}) : super(key: key);
  // const Circle({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(3, 3), // Define a posição da sombra (x, y)
                ),
              ],
              border: Border.all(
                  color: const Color.fromARGB(255, 49, 162, 227), width: 2)),
          child: Icon(icon,
              size: 40, color: const Color.fromARGB(255, 49, 162, 227))),
    );
  }
}
