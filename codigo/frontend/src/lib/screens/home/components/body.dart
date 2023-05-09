import "package:flutter/material.dart";
import "package:src/screens/home/components/post_card.dart";

import "circles.dart";

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            width: 325,
            height: 24,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 228, 225, 225),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x33000000),
                    offset: Offset(4, 2),
                    blurRadius: 4,
                    spreadRadius: 0,
                  )
                ]),
            child: const TextField(
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  border: InputBorder.none, prefixIcon: Icon(Icons.search)),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Circle(), Circle(), Circle()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Circle(), Circle(), Circle()],
        ),
        SizedBox(
          width: 328,
          height: 47,
          child: DecoratedBox(
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Color.fromARGB(255, 0, 195, 255)],
                )),
            child: ElevatedButton(
                onPressed: null,
                child: Row(
                  children: const [
                    Text(
                      'Recommended for you',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: 70),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                )),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            "Trending Now",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        for (int i = 0; i < 3; i++)
          // ESSE AQUI É O CARD QUE ESTÁ SENDO PUXADO DO COMPONENTE post_card.dart
          // PARA USÁ-LO, É SÓ IMPORTAR NA LINHA 1 O ARQUIVO post_card.dart
          postCardBuilder(),
      ]),
    );
  }
}
