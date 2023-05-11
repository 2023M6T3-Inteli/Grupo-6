import 'package:flutter/material.dart';
import "package:src/screens/home/components/post_card.dart";
import 'package:src/screens/popup/popup.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  String _selectedOption = "Filter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back,
                    color: Color.fromARGB(255, 99, 99, 99)),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 325,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 245, 246, 247),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x33000000),
                        offset: Offset(4, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: const [
                        Icon(Icons.search, size: 16, color: Colors.black),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(fontSize: 17),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 45),
                  width: 111,
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 18, 130, 214)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      dropdownColor: const Color.fromARGB(255, 18, 130, 214),
                      value: _selectedOption,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined,
                          color: Colors.white),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.white, fontSize: 40),
                      // underline: Container(
                      //   height: 2,
                      //   color: const Color.fromARGB(255, 18, 130, 214),
                      // ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue!;
                        });
                      },
                      items: <String>[
                        'Filter',
                        'Filter 1',
                        'Filter 2',
                        'Filter 3'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:
                              Text(value, style: const TextStyle(fontSize: 20)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 120),
                  width: 93,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 245, 246, 247),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 49, 162, 227),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children:const[
                        Icon(
                          Icons.close_rounded,
                          color: Colors.blue,
                          size: 20,
                        ),
                        Text(
                          "Python",
                          style: TextStyle(
                            color: Color.fromARGB(255, 49, 162, 227),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
                child: Column(
              children: [
                postCardBuilder(),
                postCardBuilder(),
                postCardBuilder()
              ],
            )),
            Expanded(child: Container()),
            popUp(),
            buildNavigationBar(),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar buildNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up_alt_outlined),
          label: "Like",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
          label: "Add",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.workspace_premium_outlined),
          label: "Ranking",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: "User",
        ),
      ],
    );
  }
}
