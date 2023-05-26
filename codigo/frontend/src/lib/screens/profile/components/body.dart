import "package:flutter/material.dart";
import "package:src/screens/home/components/post_card.dart";
import "package:src/screens/recommendation/recommendation.dart";
import "package:src/screens/profile/components/badge.dart";
import "package:src/screens/profile/components/profile_tag.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import "../../../services/service_user.dart";

class User {
  final String id;
  final String name;
  final String role;

  User({required this.id, required this.name, required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      role: json['role'],
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<dynamic> getUserById() async {
    var response = await http
        .get(Uri.parse("$baseUrl/user/675fb91e-eaf3-4611-8395-786ab81abdb0"));
    var jsonData = jsonDecode(response.body);
    var user = User.fromJson(jsonData);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.only(right: 20, top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: null,
                iconSize: 30,
                icon: Icon(
                  Icons.menu,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 0, 42, 88),
                radius: 53,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Avatar2.png'),
                  radius: 50,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: getUserById(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print(snapshot.hasData);
                    print(snapshot.data);
                    return const Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Text("Carregando..."),
                        ),
                        CircularProgressIndicator()
                      ],
                    ));
                  } else if (snapshot.hasError) {
                    return Text('Erro: ${snapshot.error}');
                  } else {
                    User user = snapshot.data;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10, right: 20),
                          child: Text(
                            user != null
                                ? user.name
                                : 'Nenhum usuário encontrado',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 20,
                              color: Color.fromARGB(255, 1, 0, 0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10, right: 20),
                          child: Text(
                            user != null ? user.role : '',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 14,
                              color: Color.fromARGB(255, 126, 126, 126),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(bottom: 10, right: 20),
              //       child: Text(
              //         // 'Sofia Pimazzoni',
              //         user.name,
              //         textAlign: TextAlign.right,
              //         style: const TextStyle(
              //             fontFamily: "Roboto",
              //             fontSize: 20,
              //             color: Color.fromARGB(255, 99, 99, 99)),
              //       ),
              //     ),
              //     const Padding(
              //       padding: EdgeInsets.only(bottom: 10, right: 20),
              //       child: Text(
              //         'Developer Junior',
              //         textAlign: TextAlign.right,
              //         style: TextStyle(
              //             fontFamily: "Roboto",
              //             fontSize: 14,
              //             color: Color.fromARGB(255, 126, 126, 126)),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10, left: 20),
              child: Text(
                'Badges',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    color: Color.fromARGB(255, 99, 99, 99)),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileBadge(
                backgroundImage: AssetImage('assets/images/Badge.jpeg')),
            ProfileBadge(
                backgroundImage: AssetImage('assets/images/Badge.jpeg')),
            ProfileBadge(
                backgroundImage: AssetImage('assets/images/Badge.jpeg')),
            ProfileBadge(
                backgroundImage: AssetImage('assets/images/Badge.jpeg')),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10, left: 20),
              child: Text(
                'About me',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    color: Color.fromARGB(255, 99, 99, 99)),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco. ',
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 12,
                color: Color.fromARGB(255, 126, 126, 126)),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10, left: 20),
              child: Text(
                'Softskills',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    color: Color.fromARGB(255, 99, 99, 99)),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProfileTag(text: "Communication"),
            ProfileTag(text: "Adaptability"),
            ProfileTag(text: "Team Work"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProfileTag(text: "Leadership"),
            ProfileTag(text: "Colaboration"),
            ProfileTag(text: "Cooperation"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10, left: 20),
              child: Text(
                'Hardskills',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    color: Color.fromARGB(255, 99, 99, 99)),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProfileTag(text: "Python"),
            ProfileTag(text: "React"),
            ProfileTag(text: "Java Script"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProfileTag(text: "Automation"),
            ProfileTag(text: "AI"),
            ProfileTag(text: "Node JS"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10, left: 20),
              child: Text(
                'Activities',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    color: Color.fromARGB(255, 99, 99, 99)),
              ),
            ),
          ],
        ),
        // postCardBuilder(),
        // postCardBuilder(),
      ]),
    );
  }
}
