import 'package:flutter/material.dart';

class ProfileBadge extends StatelessWidget {
  const ProfileBadge({super.key, required this.backgroundImage});
  final ImageProvider backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 49, 162, 227),
            radius: 32,
            child: CircleAvatar(
              backgroundImage: backgroundImage,
              radius: 30,
            ),
          ),
      // ),
    );
  }
}