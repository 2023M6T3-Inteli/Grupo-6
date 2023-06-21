import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> giftCardImages = [
      'codigo/frontend/src/assets/images/image (1).png',
      'codigo/frontend/src/assets/images/image (2).png',
      'codigo/frontend/src/assets/images/image (3).png',
      'codigo/frontend/src/assets/images/image (4).png',
      'codigo/frontend/src/assets/images/image (5).png',
    ];

    List<String> giftCardTitles = [
      'Ifood - 50',
      'Bk - 100',
      'Americanas - 150',
      'Steam - 200',
      'Espatar - 250',
    ];

    List<String> giftCardPoints = [
      '200 points',
      '400 points',
      '600 points',
      '800 points',
      '1000 points',
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://link-to-profile-pic.com'),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          'Name',
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          'Developer Junior',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.lightBlue, // Text color
                            side: BorderSide(color: Colors.lightBlue), // Border color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {},
                          child: Text('300 points', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Badges',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                for (var i = 0; i < 4; i++)
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey,
                  ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Giftcard',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            for (var i = 0; i < 5; i++)
              Card(
                color: Colors.grey[300], // set card color to light grey
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  leading: Image.network(giftCardImages[i], height: 80),
                  title: Text(giftCardTitles[i], style: TextStyle(fontSize: 20)),
                  subtitle: Text(giftCardPoints[i], style: TextStyle(fontSize: 18)),
                  trailing: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.lightBlue, // Text color
                      side: BorderSide(color: Colors.lightBlue), // Border color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Rescue', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
