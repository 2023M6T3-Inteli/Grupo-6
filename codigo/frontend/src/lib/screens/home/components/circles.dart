import "package:flutter/material.dart";

// ignore: camel_case_types
class circledIcons {
  final Icon myIcon;

  circledIcons({required this.myIcon});
}

List<circledIcons> circleIcons = [
  circledIcons(myIcon: myIcon(icon: Icons.insert_drive_file_outlined)),
  circledIcons(myIcon: myIcon(icon: Icons.volume_up_outlined)),
  circledIcons(myIcon: myIcon(icon: Icons.wifi_outlined)),
  circledIcons(myIcon: myIcon(icon: Icons.play_circle_outline_outlined)),
  circledIcons(myIcon: myIcon(icon: Icons.folder_open_outlined)),
  circledIcons(myIcon: myIcon(icon: Icons.add_circle_outline_outlined))
];

myIcon({required IconData icon}) {}

class Circle extends StatelessWidget {
  const Circle({super.key, required IconData icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.blue, width: 2)),
      ),
    );
    ;
  }
}
