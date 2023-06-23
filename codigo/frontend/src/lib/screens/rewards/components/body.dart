import 'package:flutter/material.dart';
import 'package:src/screens/rewards/components/gift_cards.dart';
import 'package:src/services/service_badge.dart';
import '../../../services/service_login.dart';
import '../../../services/service_user.dart';

String userId = '';
var soft = [];
var hard = [];

class Posts {
  final String title;
  final String authorName;
  final String date;
  final String postId;
  final String image;
  final String category;

  Posts(
      {required this.title,
      required this.authorName,
      required this.date,
      required this.postId,
      required this.image,
      required this.category});
}

class Projects {
  final String title;
  final String authorName;
  final String date;
  final int projectId;
  final String category;
  final String creator;

  Projects({
    required this.title,
    required this.authorName,
    required this.date,
    required this.projectId,
    required this.category,
    required this.creator,
  });
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  @override
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
          String? score = userData["score"].toString();


          return Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 10, top: 20),
                      child: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 0, 42, 88),
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
                                color: Color.fromARGB(255, 21, 96, 119),
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
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                              right: 20,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 80,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(
                                    color: const Color.fromARGB(255, 88, 88, 88),
                                    width: 1.0,
                                  ),
                                ),
                                child: Text(
                                  '$score  points',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 92, 193, 238),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(left: 70.0),
                      child: Text(
                        'Giftcard',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromARGB(255, 68, 68, 68)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GiftCard(
                      image: 'assets/images/iFood.png',
                      title: 'Ifood - RS 50,00      ',
                      points: '200 points',
                    ),
                    GiftCard(
                      image: 'assets/images/BK.png',
                      title: 'BK - RS 100,00        ',
                      points: '200 points',
                    ),
                    GiftCard(
                      image: 'assets/images/Americanas.png',
                      title: 'Americanas - 50,00',
                      points: '200 points',
                    ),
                    GiftCard(
                      image: 'assets/images/Steam.png',
                      title: 'Steam - RS 30,00    ',
                      points: '100 points',
                    ),
                    GiftCard(
                      image: 'assets/images/Estapar.png',
                      title: 'Estapar - RS 200,00',
                      points: '500 points',
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
