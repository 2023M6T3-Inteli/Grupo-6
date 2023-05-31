import "package:flutter/material.dart";
import "package:src/screens/home/components/post_card.dart";
import "package:src/screens/recommendation/recommendation.dart";
import "package:src/screens/profile/components/badge.dart";
import "package:src/screens/profile/components/profile_tag.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../services/service_login.dart';
import "../../../services/service_user.dart";

String userId = "";

// class User {
//   final String id;
//   final String name;
//   final String role;

//   User({required this.id, required this.name, required this.role});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       role: json['role'],
//     );
//   }
// }

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData("userId").then((value) {
      userId = value!;
      print(value);
    });
  }

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
                future: getUserById("d56f9ba4-a2fd-4be7-8a9a-22ee7b89c390"),
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
                    var user = snapshot.data;

                    return _isEditing
                        ? Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: TextField(
                                controller: nameController,
                                style: const TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 1, 0, 0),
                                ),
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: TextField(
                                controller: roleController,
                                style: const TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 1, 0, 0),
                                ),
                                decoration: const InputDecoration(
                                  labelText: 'Role',
                                  labelStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ])
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 20),
                                child: Text(
                                  user != null
                                      ? user["name"]
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
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 20),
                                child: Text(
                                  user != null
                                      ? user["role"]
                                      : 'Nenhum usuário encontrado',
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
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: _isEditing
                  ? null
                  : () {
                      setState(() {
                        _isEditing = true;
                      });
                    },
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
        _isEditing
            ? Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: aboutMeController,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'About Me',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  minLines: 3,
                  maxLines: 5,
                ),
              )
            : const Column(
                children: [
                  Row(
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
                  Padding(
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
                ],
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
        _isEditing
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: SizedBox(
                      width: 180,
                      height: 47,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 18, 130, 214),
                                Color.fromARGB(255, 123, 199, 255)
                              ],
                            )),
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isEditing = false;
                                String name = nameController.text;
                                String role = roleController.text;
                                String aboutMe = aboutMeController.text;

                                updateUser(
                                    "d56f9ba4-a2fd-4be7-8a9a-22ee7b89c390",
                                    "",
                                    name,
                                    role,
                                    aboutMe);
                              });
                            },
                            child: const Row(
                              children: [
                                Text(
                                  'Save Changes',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(width: 15),
                                Icon(Icons.check, color: Colors.white),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                height: 5,
                color: Colors.transparent,
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
