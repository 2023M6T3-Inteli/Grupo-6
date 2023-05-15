import 'package:flutter/material.dart';

Padding postCardBuilder() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: SizedBox(
      height: 139,
      width: 337,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 228, 225, 225),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12, top: 12, right: 6),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/Avatar.jpeg"),
                  radius: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  children: const [
                    Text(
                      "Victor Carvalho",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "2 hours ago",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Machine learning for medicine",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 52, 92),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 20,
                  width: 55,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 231, 231, 231),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      // borderColor: Color.fromARGB(255, 3, 52, 92),
                    ),
                    child: Text("Automation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 120, 190, 247),
                            fontSize: 7)),
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    ),
  );
}
