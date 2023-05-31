import "package:flutter/material.dart";

class ModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            // leading: Icon(Icons.music_note),
            title: Text('Add project'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed("/project");
            },
          ),
          ListTile(
            // leading: Icon(Icons.videocam),
            title: Text('Add post'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed("/post");
            },
          ),
        ],
      ),
    );
  }
}
