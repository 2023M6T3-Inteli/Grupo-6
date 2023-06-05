import "package:flutter/material.dart";

class FaqBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            title: Text('Dark mode'),
            // onTap: () {
            //   Navigator.pop(context);
            //   Navigator.of(context).pushReplacementNamed("/project");
            // },
          ),
          ListTile(
            // leading: Icon(Icons.videocam),
            title: const Text('FAQ'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed("/faq");
            },
          ),
        ],
      ),
    );
  }
}
