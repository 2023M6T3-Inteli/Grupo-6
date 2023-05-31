import 'package:flutter/material.dart';
import 'package:src/screens/home/components/post_tag.dart';
import '../../submit_project/submit_project.dart';

Padding projectCardBuilder(String title, String name, String time,
    BuildContext context, int projectId) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectInfo(projectId: projectId),
            ),
          );
        },
        child: SizedBox(
          height: 139,
          width: 337,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 242, 242, 242),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                     const Padding(
                      padding:  EdgeInsets.only(left: 12, top: 12, right: 6),
                      child: CircleAvatar(
                        backgroundImage:
                             AssetImage("assets/images/Avatar.jpeg"),
                        radius: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Column(
                        children: [
                          Text(
                            name,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            time.toString(),
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 42, 88),
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: PostTag(text: "Automation"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ));
}
