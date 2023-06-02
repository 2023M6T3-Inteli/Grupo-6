import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("1º"),
              SizedBox(width: 10),
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
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Mateus Neves',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text(
                        '1000',
                        style: TextStyle(
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
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("2º"),
                SizedBox(width: 10),
                Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Kinho',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          '900',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("3º"),
                SizedBox(width: 10),
                Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Sofia Pimazzoni',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          '900',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("4º"),
                SizedBox(width: 10),
                Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Sofia Pimazzoni',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          '900',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("5º"),
            SizedBox(width: 10),
            Container(
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Sofia Pimazzoni',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text(
                      '900',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ])),
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("6º"),
                SizedBox(width: 10),
                Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Sofia Pimazzoni',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          '900',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("7º"),
                SizedBox(width: 10),
                Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Sofia Pimazzoni',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          '900',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("8º"),
                SizedBox(width: 10),
                Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Sofia Pimazzoni',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          '900',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("9º"),
              SizedBox(width: 10),
              Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Sofia Pimazzoni',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text(
                        '900',
                        style: TextStyle(
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
          SizedBox(height: 20),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("10º"),
              SizedBox(width: 10),
              Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Sofia Pimazzoni',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text(
                        '900',
                        style: TextStyle(
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
        ],
      ),
    ));
  }
}
