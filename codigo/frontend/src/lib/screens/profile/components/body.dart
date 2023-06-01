import 'package:flutter/material.dart';
import 'package:src/screens/home/components/post_card.dart';
import 'package:src/screens/recommendation/recommendation.dart';
import 'package:src/screens/profile/components/badge.dart';
import 'package:src/screens/profile/components/profile_tag.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../services/service_login.dart';
import '../../../services/service_user.dart';

String userId = '';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData("userId"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading data'),
          );
        } else {
          userId = snapshot.data as String;
          return _buildProfileScreen(context);
        }
      },
    );
  }

  Widget _buildProfileScreen(BuildContext context) {
    if (userId == "") {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return FutureBuilder(
      future: getUserById(userId),
      builder: (context, snapshot) {
        // print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading post'),
          );
        } else if (snapshot.hasData) {
          var userData = snapshot.data as Map<String, dynamic>;
          String name = userData["name"];
          String role = userData["role"];
          String photoUrl = userData["photo_url"];
          String aboutMe = userData["about_me"];

          return Center(
            child: Column(
              children: [
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 0, 42, 88),
                        radius: 53,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(photoUrl),
                          radius: 50,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                              right: 20,
                            ),
                            child: Text(
                              name,
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
                              bottom: 10,
                              right: 20,
                            ),
                            child: Text(
                              role,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 14,
                                color: Color.fromARGB(255, 126, 126, 126),
                              ),
                            ),
                          ),
                        ],
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
                      padding: EdgeInsets.only(
                        top: 25,
                        bottom: 10,
                        left: 20,
                      ),
                      child: Text(
                        'Badges',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
                          color: Color.fromARGB(255, 99, 99, 99),
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileBadge(
                      backgroundImage: AssetImage('assets/images/Badge.jpeg'),
                    ),
                    ProfileBadge(
                      backgroundImage: AssetImage('assets/images/Badge.jpeg'),
                    ),
                    ProfileBadge(
                      backgroundImage: AssetImage('assets/images/Badge.jpeg'),
                    ),
                    ProfileBadge(
                      backgroundImage: AssetImage('assets/images/Badge.jpeg'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 25,
                            bottom: 10,
                            left: 20,
                          ),
                          child: Text(
                            'About me',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 14,
                              color: Color.fromARGB(255, 99, 99, 99),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        aboutMe,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 12,
                          color: Color.fromARGB(255, 126, 126, 126),
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 25,
                        bottom: 10,
                        left: 20,
                      ),
                      child: Text(
                        'Softskills',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
                          color: Color.fromARGB(255, 99, 99, 99),
                        ),
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
                      padding: EdgeInsets.only(
                        top: 25,
                        bottom: 10,
                        left: 20,
                      ),
                      child: Text(
                        'Hardskills',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
                          color: Color.fromARGB(255, 99, 99, 99),
                        ),
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
                            padding: const EdgeInsets.symmetric(
                              vertical: 30,
                            ),
                            child: SizedBox(
                              width: 193,
                              height: 47,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 18, 130, 214),
                                      Color.fromARGB(255, 123, 199, 255),
                                    ],
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isEditing = false;
                                      String name_updated =
                                          nameController.text;
                                      String role_updated =
                                          roleController.text;
                                      String aboutMe =
                                          aboutMeController.text;

                                      updateUser(
                                        "d56f9ba4-a2fd-4be7-8a9a-22ee7b89c390",
                                        "",
                                        name_updated,
                                        role_updated,
                                        aboutMe,
                                      );
                                    });
                                  },
                                  child: const Row(
                                    children: [
                                      Text(
                                        'Save Changes',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
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
                      padding: EdgeInsets.only(
                        top: 25,
                        bottom: 10,
                        left: 20,
                      ),
                      child: Text(
                        'Activities',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
                          color: Color.fromARGB(255, 99, 99, 99),
                        ),
                      ),
                    ),
                  ],
                ),
                // postCardBuilder(),
                // postCardBuilder(),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
