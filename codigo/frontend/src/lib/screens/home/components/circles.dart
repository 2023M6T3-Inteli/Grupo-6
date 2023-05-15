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
              border: Border.all(color: Colors.blue, width: 2)),
          child: Icon(icon, size: 40, color: Colors.blue)),
    );
    ;
  }
}
