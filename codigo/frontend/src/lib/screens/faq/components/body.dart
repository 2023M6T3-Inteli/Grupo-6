import 'package:flutter/material.dart';
import 'card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back, color: Colors.black),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'FAQ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ],
            )
          ],
        ),
      ),

      body: Center(
        child: Column(
          children: [
            FaqCard(
              title: Text('How do I change my profile?'),
              children: <Widget>[
                Text('You can claim your NFTs using Metamask Account, after that, all you need is just to click the “Claim NFT” button'),
              ],
            ),
            SizedBox(height: 40,),
            FaqCard(
              title: Text('How can I claim my NFTs?'),
              children: <Widget>[
                Text('Resposta'),
              ],
            ),
            SizedBox(height: 40,),
            FaqCard(
              title: Text('How can I claim my NFTs?'),
              children: <Widget>[
                Text('Resposta'),
              ],
            ),
            SizedBox(height: 40,),
            FaqCard(
              title: Text('How can I claim my NFTs?'),
              children: <Widget>[
                Text('Resposta'),
              ],
            ),
            SizedBox(height: 40,),
            FaqCard(
              title: Text('How can I claim my NFTs?'),
              children: <Widget>[
                Text('Resposta'),
              ],
            ),// adicione quantos FaqCard você precisar aqui
          ],
        ),
),

    );
  }
}
