import 'package:flutter/material.dart';
import 'package:src/services/service_user.dart';
import './score_card.dart';


class Score{
  final String name;
  final int? score;

  Score(
    {
      required this.name,
      required this.score
    }
  );
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllUsers(),
      builder: (context, snapshot){
        if (snapshot.hasData){
          var jsonData = snapshot.data;
          List<Score> scores = [];

          for (int i = jsonData!.length - 1; i >= 0; i--){
            var score = jsonData[i];
            if (score != null){
              String name = score["name"];
              int? currentscore = score["score"];

              scores.add(Score(
                name: name,
                score: currentscore
              ));
            }
            scores.removeWhere((score) => score.score == null);
          }
          for (int i = 0; i < scores.length - 1; i++) {
            for (int j = 0; j < scores.length - i - 1; j++) {
              if (scores[j].score != null && scores[j + 1].score != null) {
                if (scores[j].score! < scores[j + 1].score!) {
                  Score temp = scores[j];
                  scores[j] = scores[j + 1];
                  scores[j + 1] = temp;
                }
              }
            }
          }
          List<String> items = [
            '1º',
            '2º',
            '3º',
            '4º',
            '5º',
            '6º',
            '7º',
            '8º',
            '9º',
            '10º',
          ];
          return Column(
          children: [
              for(int i = 0; i < scores.length && i < 10; i++)
              scoreCardBuilder(items[i], scores[i].name, scores[i].score)
          ],
        );
        }
        return const CircularProgressIndicator();
      }
    );
  }
}