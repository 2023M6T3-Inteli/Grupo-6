import 'package:flutter/material.dart';
import 'components/attribute.dart';
import 'components/info_attribute.dart';
import 'components/tags.dart';
import '../../services/service_project.dart';
import '../../services/service_login.dart';

class ProjectInfo extends StatefulWidget {
  final int projectId;
  const ProjectInfo({required this.projectId, Key? key}) : super(key: key);

  @override
  _ProjectInfoState createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfo> {
  TextEditingController _answerController = TextEditingController();
  String _answer = '';

  @override
  Widget build(BuildContext context) {
    int projectId = widget.projectId;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 99, 99, 99),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getProject(projectId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading post'),
            );
          } else if (snapshot.hasData) {
            var projectData = snapshot.data!;
            String title = projectData["title"];
            String description = projectData["description"];
            String status = projectData["stt"];
            String dateInitial = projectData["date_initial"];
            String dateEnd = projectData["date_end"];
            String area = projectData["area"];
            String role = projectData["role"];
            List<String> technologies = List<String>.from(projectData["technologies"]
            .map((technology) => technology["technology"] as String));
            print(technologies);

            return SingleChildScrollView(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                              right: 80.0,
                            ),
                            child: Text(
                              title,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 70, 139),
                                fontSize: 24.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          color: const Color.fromARGB(255, 229, 230, 236),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              status,
                              textDirection: TextDirection.ltr,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 8, 150, 202),
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),  
                          ),
                        ),
                    )],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, right: 10, bottom: 10),
                            child: Text(
                              description,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 99, 99, 99),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const AtributteWidget(atributte: 'Area: '),
                        InfoWidget(info: area),
                      ],
                    ),
                    Row(
                      children: [
                        const AtributteWidget(atributte: 'Positions: '),
                        InfoWidget(info: role),
                      ],
                    ),
                    Row(
                      children: [
                        const AtributteWidget(atributte: 'Duration: '),
                        InfoWidget(info: '$dateInitial - $dateEnd'),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     const AtributteWidget(atributte: 'Team: '),
                    //     Padding(
                    //       padding: const EdgeInsets.only(bottom: 3.0, right: 5.0),
                    //       child: Container(
                    //         height: 30,
                    //         width: 30,
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: Colors.white,
                    //           border: Border.all(color: Colors.blue, width: 2),
                    //         ),
                    //         child: const Text(
                    //           "A",
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             color: Colors.blue,
                    //             fontSize: 16.0,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(bottom: 3.0, right: 5.0),
                    //       child: Container(
                    //         height: 30,
                    //         width: 30,
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: Colors.white,
                    //           border: Border.all(color: Colors.blue, width: 2),
                    //         ),
                    //         child: const Text(
                    //           "G",
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             color: Colors.blue,
                    //             fontSize: 16.0,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(bottom: 3.0, right: 5.0),
                    //       child: Container(
                    //         height: 30,
                    //         width: 30,
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: Colors.white,
                    //           border: Border.all(color: Colors.blue, width: 2),
                    //         ),
                    //         child: const Text(
                    //           "M",
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             color: Colors.blue,
                    //             fontSize: 16.0,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const Row(
                      children: [
                        AtributteWidget(atributte: 'Attachments: '),
                        InfoWidget(info: 'None'),
                      ],
                    ),
                     Row(
                      children: [
                        const Padding(
                          padding:  EdgeInsets.only(bottom: 5.0, right: 5.0),
                          child: Text(
                            'Tags:',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Color.fromARGB(255, 99, 99, 99),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        for (var i = 0; i < technologies.length; i++)
                          TagsWidget(tag: technologies[i]),
                      ],
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 30.0),
                        ),
                        AtributteWidget(atributte: 'Questions:'),
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.only(top: 0),
                            child: Text(
                              "Why would you like to participate in the project?",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Color.fromARGB(255, 99, 99, 99),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                     Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:  const EdgeInsets.only(top: 5.0, right: 10.0),
                            child: TextFormField(
                              controller: _answerController,
                              onChanged: (answer){
                                _answer = answer;
                              },
                              maxLines: 5,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Type your answer here',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            elevation: 0,
                          ),
                          onPressed: () {
                            getData("userId").then((value){
                              
                            });
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(); 
          }
        },
      ),
    );
  }
}
