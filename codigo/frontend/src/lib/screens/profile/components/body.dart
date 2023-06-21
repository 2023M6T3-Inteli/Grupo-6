import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:src/constants.dart';
import 'package:src/screens/profile/components/badge.dart';
import 'package:src/screens/profile/components/profile_tag.dart';
import 'package:src/widgets/faq_card.dart';
import 'package:web3dart/web3dart.dart';
import '../../../services/service_blockchain.dart';
import '../../../services/service_tags.dart';
import '../../../services/service_login.dart';
import '../../../services/service_user.dart';
import '../../../services/service_softSkills.dart';
import '../../../services/service_post.dart';
import '../../home/components/post_card.dart';
import '../../../services/service_project.dart';
import '../../home/components/project_card.dart';
import '../../update_profile/update_profile.dart';

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
  Client? httpClient;
  Web3Client? ethClient;
  // final myContractAddress = '0x123456789';

  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(infuraApiKey, httpClient!);
    super.initState();
  }

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
          String aboutMe = userData["about_me"];
          String? softskills = userData["soft_skills"];
          String? hardskills = userData["hard_skills"];

          return Center(
            child: Column(
              children: [
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
                    IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UpdateProfile(userId: userId),
                            ),
                          );
                        }),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
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
                              mintAchievement(privateKey, ethClient!);
                            },
                            child: const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Mynt Badges',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Icon(Icons.workspace_premium_outlined,
                                    color: Colors.white),
                              ],
                            )),
                      ),
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
                FutureBuilder(
                  future: getAllSoftSkills(),
                  builder: (context, snapshot) {
                    soft = [];
                    if (snapshot.hasData) {
                      for (var i = 0; i < snapshot.data!.length; i++) {
                        if (softskills?.contains(
                                snapshot.data![i]["idSkill"].toString()) ==
                            true) {
                          soft.add(snapshot.data![i]["skill"]);
                        }
                      }
                      if (soft.length < 4) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (var i = 0; i < soft.length; i++)
                              ProfileTag(text: soft[i]),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (var i = 0; i < 3; i++)
                                  ProfileTag(text: soft[i]),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (var i = 3; i < soft.length; i++)
                                  ProfileTag(text: soft[i]),
                              ],
                            ),
                          ],
                        );
                      }
                    }
                    return const CircularProgressIndicator();
                  },
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
                FutureBuilder(
                  future: getAllTags(),
                  builder: (context, snapshot) {
                    hard = [];
                    if (snapshot.hasData) {
                      for (var i = 0; i < snapshot.data!.length; i++) {
                        if (hardskills?.contains(snapshot.data![i]
                                    ["id_technology"]
                                .toString()) ==
                            true) {
                          hard.add(snapshot.data![i]["technology"]);
                        }
                      }
                      if (hard.length < 4) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (var i = 0; i < hard.length; i++)
                              ProfileTag(text: hard[i]),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (var i = 0; i < 3; i++)
                                  ProfileTag(text: hard[i]),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (var i = 3; i < soft.length; i++)
                                  ProfileTag(text: hard[i]),
                              ],
                            ),
                          ],
                        );
                      }
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                Container(
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
                FutureBuilder(
                  future: getAllPostByCreator(userId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var jsonData = snapshot.data;
                      List<Posts> posts = [];

                      for (int i = jsonData!.length - 1; i >= 0; i--) {
                        var post = jsonData[i];
                        if (post != null) {
                          String title = post["title"];
                          String authorName = post["author"]["name"];
                          String date = post["createdAt"];
                          String id = post["id"];
                          String imageUrl = post["author"]["photo_url"];
                          String category = post["category"];

                          posts.add(Posts(
                              title: title,
                              authorName: authorName,
                              date: date,
                              postId: id,
                              image: imageUrl,
                              category: category));
                        }
                      }
                      return Column(
                        children: [
                          for (var post in posts)
                            postCardBuilder(
                                post.title,
                                post.authorName,
                                post.date,
                                context,
                                post.postId,
                                post.image,
                                post.category),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder(
                    future: getAllProjectsByCreator(userId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var jsonData = snapshot.data;
                        List<Projects> projects = [];

                        for (int i = jsonData!.length - 1; i >= 0; i--) {
                          var project = jsonData[i];
                          if (project != null) {
                            String title = project["title"];
                            String authorName = project["creator"]["name"];
                            String date = project["created_at"];
                            int id = project["idProject"];
                            String category =
                                project["technologies"][0]["technology"];
                            String creator = project["creator"]["id_profile"];

                            projects.add(Projects(
                                title: title,
                                authorName: authorName,
                                date: date,
                                projectId: id,
                                category: category,
                                creator: creator));
                          }
                        }
                        return Column(
                          children: [
                            for (var project in projects)
                              projectCardBuilder(
                                  project.title,
                                  project.authorName,
                                  project.date,
                                  context,
                                  project.projectId,
                                  project.category,
                                  project.creator),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else {
                        return const CircularProgressIndicator();
                      }
                    })
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
