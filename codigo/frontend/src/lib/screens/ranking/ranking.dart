import "package:flutter/material.dart";
import 'package:src/screens/ranking/components/body.dart';

class Ranking extends StatelessWidget {
  const Ranking({super.key});
  // const Ranking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(child: Body());
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        title: Expanded(
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.end, // alinha no final da linha
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),

                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'Ranking',
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
      body: const SingleChildScrollView(child: Body()),
    );
  }
}
