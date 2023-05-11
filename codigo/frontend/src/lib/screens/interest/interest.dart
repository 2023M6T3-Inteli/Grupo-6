import 'package:flutter/material.dart';

void main() {
  runApp(Interest());
}

class Interest extends StatelessWidget {
  final List<String> buttonLabels = [
    "Python",
    "NodeJS",
    "Go",
    "JavaScript",
    "Java",
    "C#",
    "React",
    "Python",
    "CSS",
    "C++",
  ];
  final int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Image.asset('/Users/alanrozensztajnschipper/Documents/GitHub/Grupo-6/codigo/frontend/src/assets/images/Background.png'),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 80.0),
                      child: Text(
                        "Let's Start!",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                    Text(
                      "Select your interest:",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 5, // decrease height
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          children: List<Widget>.generate(
                            10,
                            (int index) {
                              return ElevatedButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  primary: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.blue),
                                  ),
                                  minimumSize: Size(double.infinity, 50), // make buttons bigger
                                ),
                                child: Text(buttonLabels[index]),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  child: Text('Finish'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.arrow_back, color: Colors.blue, size: 30),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    4,
                    (int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: index == currentPage ? Colors.blue : Colors.lightBlue,
                          shape: BoxShape.circle,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
