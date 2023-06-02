import 'package:flutter/material.dart';
import 'package:src/screens/profile/components/badge.dart';
import 'package:src/screens/profile/components/profile_tag.dart';
import '../../../services/service_tags.dart';
import '../../../services/service_login.dart';
import '../../../services/service_user.dart';
import '../../../services/service_softSkills.dart';
import '../../../services/service_post.dart';
import '../../home/components/post_card.dart';
import '../../../services/service_project.dart';
import '../../home/components/project_card.dart';

String userId = '';
var soft = [];
var hard = [];

class Posts {
  final String title;
  final String authorName;
  final String date;
  final String postId;
  final String image;

  Posts(
      {required this.title,
      required this.authorName,
      required this.date,
      required this.postId,
      required this.image});
}

class Projects {
  final String title;
  final String authorName;
  final String date;
  final int projectId;

  Projects({
    required this.title,
    required this.authorName,
    required this.date,
    required this.projectId,
  });
}


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
          String softskills = userData["soft_skills"];
          String hardskills = userData["hard_skills"];

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
                FutureBuilder(
                  future: getAllSoftSkills(),
                  builder: (context, snapshot) {
                    soft = [];
                    if (snapshot.hasData){
                      for (var i = 0; i < snapshot.data!.length; i++) {
                        if (softskills.contains(snapshot.data![i]["idSkill"].toString())) {
                          soft.add(snapshot.data![i]["skill"]);
                        }
                      }
                      print(soft);
                      if(soft.length < 4){
                        return  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (var i = 0; i < soft.length; i++)
                              ProfileTag(text: soft[i]),
                          ],
                        );
                      }
                      else{
                        return  Column(
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
                    if (snapshot.hasData){
                      for (var i = 0; i < snapshot.data!.length; i++) {
                        if (hardskills.contains(snapshot.data![i]["id_technology"].toString())) {
                          hard.add(snapshot.data![i]["technology"]);
                        }
                      }
                      print(hard);
                      if(hard.length < 4){
                        return  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (var i = 0; i < hard.length; i++)
                              ProfileTag(text: hard[i]),
                          ],
                        );
                      }
                      else{
                        return  Column(
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

                      posts.add(Posts(
                          title: title,
                          authorName: authorName,
                          date: date,
                          postId: id,
                          image: imageUrl));
                    }
                  }
                  return Column(
                    children: [
                      for (var post in posts)
                        postCardBuilder(post.title, post.authorName, post.date,
                            context, post.postId, post.image),
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

                        projects.add(Projects(
                            title: title,
                            authorName: authorName,
                            date: date,
                            projectId: id));
                      }
                    }
                    return Column(
                      children: [
                        for (var project in projects)
                          projectCardBuilder(project.title, project.authorName,
                              project.date, context, project.projectId),
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
