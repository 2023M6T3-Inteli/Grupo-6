import 'package:flutter/material.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({Key? key, required this.tag}) : super(key: key);
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Container(
                height: 20,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.blue, width: 1.5)),
                child: Text(tag,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    )))));
  }
}
