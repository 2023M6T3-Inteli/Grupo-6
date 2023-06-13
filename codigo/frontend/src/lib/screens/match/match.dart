import 'package:flutter/material.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
            alignment: Alignment.topRight,
            child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
              image: AssetImage('../assets/images/Match.jpg'),
              fit: BoxFit.cover,
            )))),
        Column(children: [
          SizedBox(
            height: 800,
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: SizedBox(
                width: 137,
                height: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'See project',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ])
      ],
    );
  }
}
