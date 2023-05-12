import 'package:flutter/material.dart';
import 'components/attribute.dart';
import 'components/info_attribute.dart';
import 'components/tags.dart';

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
            child: SizedBox(
      width: 320.0,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(top: 40.0, bottom: 5.0),
          child: Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 91, 91, 91), size: 24.0),
        ),

//First row
        Row(
          children: const [
            Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0, right: 80.0),
                child: Text(
                  'Python project',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 70, 139),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  color: Color.fromARGB(255, 229, 230, 236),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'in progress',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Color.fromARGB(255, 8, 150, 202),
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
          ],
        ),
//Second row
        Row(
          children: const [
            Padding(padding: EdgeInsets.only(top: 80.0)),
            Expanded(
                child: Text(
              'Creation of a personal finance management program. With  this application, it is possible to record all the users income and expenses, generating graphs and reports that allow a better visualization of the budget. The development of this project requires knowledge in python, manipulation of databases and creation of graphical interfaces.',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Color.fromARGB(255, 99, 99, 99),
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            )),
          ],
        ),
//Third row
        Row(children: const [
          AtributteWidget(atributte: 'Area: '),
          InfoWidget(info: 'Automation')
        ]),
//Forth row
        Row(
          children: const [
            AtributteWidget(atributte: 'Positions: '),
            InfoWidget(info: 'Back-end')
          ],
        ),
//Fifth row
        Row(
          children: const [
            AtributteWidget(atributte: 'Duration: '),
            InfoWidget(info: '14/02/23 - 25/03/23')
          ],
        ),
        //Sixth row
        Row(children: [
          const AtributteWidget(atributte: 'Team: '),
          Padding(
              padding: const EdgeInsets.only(bottom: 3.0, right: 5.0),
              child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.blue, width: 2)),
                  child: const Text(
                    "A",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
          Padding(
              padding: const EdgeInsets.only(bottom: 3.0, right: 5.0),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2)),
                child: const Text(
                  "G",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(bottom: 3.0, right: 5.0),
              child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.blue, width: 2)),
                  child: const Text(
                    "M",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
        ]),
//Seventh row
        Row(
          children: const [
            AtributteWidget(atributte: 'Attachments: '),
            InfoWidget(info: 'None'),
          ],
        ),
//Eighth row
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 5.0, right: 5.0),
              child: (Text(
                'Tags:',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Color.fromARGB(255, 99, 99, 99),
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            TagsWidget(tag: 'Python'),
            TagsWidget(tag: 'AI'),
            TagsWidget(tag: 'Database'),
          ],
        ),
//Ninth row

        Row(
          children: const [
            Padding(padding: EdgeInsets.only(top: 30.0)),
            AtributteWidget(atributte: 'Questions:'),
            Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Expanded(
                    child: Text(
                  "Why would you like to participate in the project?",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color.fromARGB(255, 99, 99, 99),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ))),
          ], //children
        ),
//Tenth row
        Row(
          children: const [
            Padding(padding: EdgeInsets.only(top: 5.0)),
            Expanded(
              child: TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type your answer here',
                ),
              ),
            ),
          ],
        ),
//Eleventh row
        Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, elevation: 0),
                onPressed: () {},
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        )
      ]),
    )));
  }
}
