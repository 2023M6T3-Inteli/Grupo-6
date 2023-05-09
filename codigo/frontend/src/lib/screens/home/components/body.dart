import "package:flutter/material.dart";

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
        GridView.count(
          crossAxisCount: 3,
          scrollDirection: Axis.vertical,
          children: List.generate(2, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2)),
              ),
            );
          }),
        ),
        //         for (int i = 0; i < 2; i++)
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 15),
        //   child: Container(
        //     // margin: const EdgeInsets.all(100),
        //     height: 90,
        //     width: 90,
        //     decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: Colors.white,
        //         border: Border.all(color: Colors.blue, width: 2)),
        //   ),
        // ),
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
          Padding(
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
                          backgroundImage:
                              AssetImage("../assets/images/Avatar.jpeg"),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
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
          ),
      ]),
    );
  }
}
