import 'package:flutter/material.dart';

class DropDownCard extends StatefulWidget {
  final String value;

  const DropDownCard({Key? key,required this.value }) : super(key: key);

  @override
  _DropDownCardState createState() => _DropDownCardState();
}

class _DropDownCardState extends State<DropDownCard> {
  bool _isVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) {
      return Container(); 
    }

    return Container(
      margin: const EdgeInsets.only(left: 93),
      width: 110,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 245, 246, 247),
      ),
      child: InkWell(
        onTap: _toggleVisibility, 
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color.fromARGB(255, 49, 162, 227),
              width: 2,
            ),
          ),
          child:  Row(
            children: [
              const Icon(
                Icons.close_rounded,
                color: Colors.blue,
                size: 20,
              ),
               const SizedBox(width: 4),
              Text(
                widget.value,
                style: const TextStyle(
                  color: Color.fromARGB(255, 49, 162, 227),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
