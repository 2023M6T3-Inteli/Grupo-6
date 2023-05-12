import 'package:flutter/material.dart';
import 'package:src/screens/interest/interest.dart';
import 'package:src/screens/home/recommendation.dart';
import 'package:src/screens/post_visu/post_visu.dart';
import 'package:src/screens/profile/profile.dart';
import 'package:src/screens/recommendation/recommendation.dart';
import 'package:src/screens/login/login.dart';
import 'package:src/screens/post/post.dart';
import 'package:src/screens/submitProject/project_info.dart';
import 'package:src/screens/feed/feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColorLight: Colors.white,
        ),
        home: const PostView(),
        initialRoute: '/post_view',
        routes: {
          '/login': (context) => const Login(),
          '/home': (context) => const Home(),
          '/feed': (context) => const Feed(),
          '/post': (context) => const Post(),
          '/interest': (context) => Interest(),
          '/recommendation': (context) => Recommendation(),
          '/project_info': (context) => const ProjectInfo(),
          '/profile': (context) => const Profile(),
          '/post_view': (context) => const PostView(),
        });
  }
}
