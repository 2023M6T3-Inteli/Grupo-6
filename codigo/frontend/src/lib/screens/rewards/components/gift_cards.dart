import "package:flutter/material.dart";

// ignore: must_be_immutable
class GiftCard extends StatelessWidget {
  String image;
  String title;
  String points;
  GiftCard({
    super.key,
    required this.image,
    required this.title,
    required this.points,
  });

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
        child: 
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
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              image,
                              width: 60,
                              height: 60,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 42, 88)),
                              ),
                              Text(
                                points,
                                style: const TextStyle(
                                    fontSize: 10,
                                    color: Color.fromARGB(255, 99, 99, 99)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 0, 42, 88),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text('Rescue'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        );
  }
}
