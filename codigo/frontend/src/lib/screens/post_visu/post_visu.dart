import "package:flutter/material.dart";
import 'package:src/screens/post_visu/components/body.dart';

class PostView extends StatelessWidget {
  final String postId;
  const PostView({required this.postId, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Body(postId: postId),
    );
  }

  // BottomNavigationBar buildNavigationBar() {
  //   return BottomNavigationBar(
  //     items: const [
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.home),
  //         label: "Home",
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.search),
  //         label: "Search",
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.person),
  //         label: "Profile",
  //       ),
  //     ],
  //   );
  // }
}
