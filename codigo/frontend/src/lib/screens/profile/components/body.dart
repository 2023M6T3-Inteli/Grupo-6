import "package:flutter/material.dart";
import "package:src/screens/home/components/post_card.dart";
import "package:src/screens/recommendation/recommendation.dart";
import "package:src/screens/profile/components/badge.dart";
import "package:src/screens/profile/components/profile_tag.dart";

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
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
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 0, 42, 88),
                radius: 53,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/margot.png'),
                  radius: 50,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, right: 20),
                    child: Text(
                      'Sofia Pimazzoni',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 20,
                          color: Color.fromARGB(255, 99, 99, 99)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, right: 20),
                    child: Text(
                      'Developer Junior',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
                          color: Color.fromARGB(255, 126, 126, 126)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10, left: 20),
              child: Text(
                'Badges',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    color: Color.fromARGB(255, 99, 99, 99)),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            ProfileBadge(
                backgroundImage: AssetImage('assets/images/badge.jpeg')),
            ProfileBadge(
                backgroundImage: AssetImage('assets/images/badge.jpeg')),
            ProfileBadge(
                backgroundImage: AssetImage('assets/images/badge.jpeg')),
            ProfileBadge(
                backgroundImage: AssetImage('assets/images/badge.jpeg')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10, left: 20),
              child: Text(
                'About me',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    color: Color.fromARGB(255, 99, 99, 99)),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco. ',
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 12,
                color: Color.fromARGB(255, 126, 126, 126)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10, left: 20),
              child: Text(
                'Softskills',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    color: Color.fromARGB(255, 99, 99, 99)),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            ProfileTag(text: "Communication"),
            ProfileTag(text: "Adaptability"),
            ProfileTag(text: "Team Work"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            ProfileTag(text: "Leadership"),
            ProfileTag(text: "Colaboration"),
            ProfileTag(text: "Cooperation"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10, left: 20),
              child: Text(
                'Hardskills',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    color: Color.fromARGB(255, 99, 99, 99)),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            ProfileTag(text: "Python"),
            ProfileTag(text: "React"),
            ProfileTag(text: "Java Script"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            ProfileTag(text: "Automation"),
            ProfileTag(text: "AI"),
            ProfileTag(text: "Node JS"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10, left: 20),
              child: Text(
                'Activities',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    color: Color.fromARGB(255, 99, 99, 99)),
              ),
            ),
          ],
        ),
        postCardBuilder(),
        postCardBuilder(),
      ]),
    );
  }
}
