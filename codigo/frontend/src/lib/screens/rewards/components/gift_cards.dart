import "package:flutter/material.dart";

// ignore: must_be_immutable
class GiftCard extends StatelessWidget {
  GiftCard({super.key});

  List<String> giftCardImages = [
    'codigo/frontend/src/assets/images/image (1).png',
    'codigo/frontend/src/assets/images/image (2).png',
    'codigo/frontend/src/assets/images/image (3).png',
    'codigo/frontend/src/assets/images/image (4).png',
    'codigo/frontend/src/assets/images/image (5).png',
  ];

  List<String> giftCardTitles = [
    'Ifood - 50',
    'Bk - 100',
    'Americanas - 150',
    'Steam - 200',
    'Espatar - 250',
  ];

  List<String> giftCardPoints = [
    '200 points',
    '400 points',
    '600 points',
    '800 points',
    '1000 points',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 15),
          const Text(
            'Giftcard',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 10),
          // for (var i = 0; i < 5; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 400,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(245, 246, 247, 245),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.75),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset:
                              const Offset(4, 4), // define a posição da sombra
                        ),
                      ],
                    ),
                    child: Column(
                      
                    )
                  ),
                ),
              ),
            ],
          )
          // Card(
          //   color: Colors.grey[300], // set card color to light grey
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10.0),
          //   ),
          //   child: ListTile(
          //     contentPadding:
          //         EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          //     leading: Image.asset(
          //         "codigo/frontend/src/assets/images/iFood.png"),
          //     title:
          //         Text(giftCardTitles[i], style: TextStyle(fontSize: 20)),
          //     subtitle:
          //         Text(giftCardPoints[i], style: TextStyle(fontSize: 18)),
          //     trailing: OutlinedButton(
          //       style: OutlinedButton.styleFrom(
          //         primary: Colors.lightBlue, // Text color
          //         side: BorderSide(color: Colors.lightBlue), // Border color
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10.0),
          //         ),
          //       ),
          //       onPressed: () {},
          //       child: Text('Rescue', style: TextStyle(fontSize: 16)),
          //     ),
          //   ),
          // ),
        ]));
  }
}
