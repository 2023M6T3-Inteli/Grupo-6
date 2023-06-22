import 'package:flutter/material.dart';
import 'package:src/screens/profile/components/badge.dart';
import 'package:src/screens/rewards/components/gift_cards.dart';
import 'package:src/services/service_badge.dart';
import 'package:src/widgets/faq_card.dart';
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
          List<dynamic>? badges = userData["badges"];
          List<dynamic>? posts = userData["posts"];

          if (posts!.isNotEmpty && badges!.isEmpty) {
            badgeToUserById("da385511-2eb7-4358-9e60-edf2a89a23c8", userId);
          }

          if (posts.length >= 10 && badges!.length == 1) {
            badgeToUserById("77ea6424-8ab9-4e5e-b45a-774f736eede9", userId);
          }

          return Center(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => FaqBottomSheet(),
                      );
                    },
                    iconSize: 30,
                    icon: const Icon(
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
            FutureBuilder(
              future: getUserById(userId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var userData = snapshot.data as Map<String, dynamic>;
                  List<dynamic>? badges = userData["badges"];
                  List<String> pictureUrls = [];

                  if (badges != null) {
                    for (var badge in badges) {
                      if (badge is Map<String, dynamic> &&
                          badge.containsKey("picture")) {
                        String pictureUrl = badge["picture"];
                        pictureUrls.add(pictureUrl);
                      }
                    }
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (var pictureUrl in pictureUrls)
                        ProfileBadge(
                          backgroundImage: NetworkImage(pictureUrl),
                        ),
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
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
                    points: '200 points'),
                GiftCard(
                    image: 'assets/images/BK.png',
                    title: 'BK - RS 100,00        ',
                    points: '200 points'),
                GiftCard(
                    image: 'assets/images/Americanas.png',
                    title: 'Americanas - 50,00',
                    points: '200 points'),
                GiftCard(
                    image: 'assets/images/Steam.png',
                    title: 'Steam - RS 30,00    ',
                    points: '100 points'),
                GiftCard(
                    image: 'assets/images/Estapar.png',
                    title: 'Estapar - RS 200,00',
                    points: '500 points'),
              ],
            ),
          ]));
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
