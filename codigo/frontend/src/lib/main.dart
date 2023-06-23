import 'package:flutter/material.dart';
import 'package:src/screens/create_project/create_project.dart';
import 'package:src/screens/faq/faq.dart';
import 'package:src/widgets/navbar.dart';
import 'package:src/screens/interest/interest.dart';
import 'package:src/screens/home/home.dart';
import 'package:src/screens/profile/profile.dart';
import 'package:src/screens/ranking/ranking.dart';
import 'package:src/screens/recommendation/recommendation.dart';
import 'package:src/screens/login/login.dart';
import 'package:src/screens/create_post/create_post.dart';
import 'package:src/screens/feed/feed.dart';
import 'package:src/screens/rewards/rewards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColorLight: Colors.white,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const Login(),
          '/home': (context) => buildScaffoldWithNavBar(const Home()),
          '/faq':(context) => buildScaffoldWithNavBar(const Faq()),
          '/feed': (context) => buildScaffoldWithNavBar(const Feed()),
          '/post': (context) => buildScaffoldWithNavBar(const Post()),
          '/interest': (context) => buildScaffoldWithNavBar(Interest()),
          '/recommendation': (context) =>
              buildScaffoldWithNavBar(Recommendation()),
          
          '/profile': (context) => buildScaffoldWithNavBar(Profile()),

          '/ranking': (context) => buildScaffoldWithNavBar(Ranking()),

          '/rewards' : (context) => buildScaffoldWithNavBar(Rewards()),

          '/project': (context) =>
              buildScaffoldWithNavBar(const CreateProject()),
        });
  }

  buildScaffoldWithNavBar(Widget page) {
    return Scaffold(
      body: IndexedStack(
        index: 0,
        children: <Widget>[page],
      ),
      bottomNavigationBar: const NavBarRouter(),
    );
  }
}
  