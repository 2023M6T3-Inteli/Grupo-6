import 'package:flutter/material.dart';

Padding scoreCardBuilder(String position, String name, int? score){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(position),
              const SizedBox(width: 10),
              Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8.0),
                      child:  Text(
                        name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child:  Text(
                        score.toString(),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ]
      )
    );
}