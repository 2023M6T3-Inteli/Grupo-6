import 'package:flutter/material.dart';
import 'package:src/screens/post_visu/components/tag.dart';
import '../../../services/service_post.dart';

class Body extends StatelessWidget {
  final String postId;

  const Body({required this.postId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
            color:  Color.fromARGB(255, 99, 99, 99)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: getPost(postId),
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
            var postData = snapshot.data as Map<String, dynamic>;
            String title = postData["title"];
            String description = postData["description"];
            String category = postData["category"];
            String date = postData["createdAt"];
            String author = postData["author"]["name"];

            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 100, bottom: 60),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 24,
                        color: Color.fromARGB(255, 0, 42, 88),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 18,
                        color: Color.fromARGB(255, 99, 99, 99),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Tag(text: category),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 100),
                        child: Text(
                          'Made by $author',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 15,
                            color: Color.fromARGB(255, 99, 99, 99),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30, top: 100),
                        child: Text(
                          date,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 15,
                            color: Color.fromARGB(255, 99, 99, 99),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
