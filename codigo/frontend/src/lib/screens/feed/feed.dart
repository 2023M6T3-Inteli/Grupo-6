import 'package:flutter/material.dart';
import '../../services/service_post.dart';
import "package:src/screens/home/components/post_card.dart";
import 'components/dropDown_card.dart';

class Posts {
  final String title;
  final String authorName;
  final String date;
  final String postId;
  final String image;

  Posts({required this.title, required this.authorName, required this.date, required this.postId, required this.image});
}

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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 99, 99, 99)),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/home");
                  },
                ),
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
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
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
                    color: const Color.fromARGB(255, 18, 130, 214),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      dropdownColor: const Color.fromARGB(255, 18, 130, 214),
                      value: _selectedOption,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.white, fontSize: 40),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue!;
                        });
                      },
                      items: <String>[
                        'Filter',
                        'projects',
                        'podcasts',
                        'posts',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: const TextStyle(fontSize: 20)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                if (_selectedOption != "Filter") DropDownCard(key: UniqueKey(), value: _selectedOption),
              ],
            ),
            const SizedBox(height: 40),
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: getAllPosts(),
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
                          String image = post["author"]["photo_url"];

                          posts.add(
                            Posts(
                              title: title,
                              authorName: authorName,
                              date: date,
                              postId: id,
                              image: image,
                            ),
                          );
                        }
                      }
                      return Center(
                        child: Column(
                        children: [
                          for (var post in posts)
                            postCardBuilder(
                              post.title,
                              post.authorName,
                              post.date,
                              context,
                              post.postId,
                              post.image,
                            ),
                        ],
                      ));
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
