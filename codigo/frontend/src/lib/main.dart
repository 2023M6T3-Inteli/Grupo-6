import 'package:flutter/material.dart';
import 'package:src/screens/interest/interest.dart';
import 'package:src/screens/home/recommendation.dart';
import 'package:src/screens/recommendation/recommendation.dart';
import 'package:src/screens/login/login.dart';
import 'package:src/screens/post/post.dart';
import 'package:src/sreens/submitProject/info_project.dart';
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
        //home: const Login(),
        initialRoute: '/feed',
        routes: {
          '/login': (context) => const Login(),
          '/home': (context) => const Home(),
          '/feed': (context) => const Feed(),
          '/post': (context) => const Post(),
          '/interest': (context) => Interest(),
          '/recommendation': (context) => Recommendation(),
        });
  }
}