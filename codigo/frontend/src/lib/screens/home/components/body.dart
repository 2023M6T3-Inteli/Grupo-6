import "package:flutter/material.dart";
import "package:src/screens/home/components/post_card.dart";

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
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
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2)),
                child: const Icon(Icons.insert_drive_file_outlined,
                    size: 40, color: Colors.blue),
              ),
            ),
            // Text("Projects"),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.blue, width: 2)),
                  child: const Icon(Icons.volume_up_outlined,
                      size: 40, color: Colors.blue)),
            ),
            // Text("Podcasts"),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2)),
                child: const Icon(Icons.wifi_outlined,
                    size: 40, color: Colors.blue),
              ),
            ),
            // Text("Posts")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2)),
                child: const Icon(Icons.play_circle_outline_outlined,
                    size: 40, color: Colors.blue),
              ),
            ),
            // Text("Videos"),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2)),
                child: const Icon(Icons.folder_open_outlined,
                    size: 40, color: Colors.blue),
              ),
            ),
            // Text("Repository"),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2)),
                child: const Icon(Icons.add_circle_outline_outlined,
                    size: 40, color: Colors.blue),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
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
                      SizedBox(width: 68),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  )),
            ),
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
        for (int i = 0; i < 2; i++)
          // ESSE AQUI É O CARD QUE ESTÁ SENDO PUXADO DO COMPONENTE post_card.dart
          // PARA USÁ-LO, É SÓ IMPORTAR NA LINHA 1 O ARQUIVO post_card.dart
          postCardBuilder(),
      ]),
    );
  }
}
