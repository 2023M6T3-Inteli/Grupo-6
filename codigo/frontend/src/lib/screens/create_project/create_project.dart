import 'package:flutter/material.dart';
import '../../services/service_tags.dart';
import '../../services/service_project.dart';
import '../../services/service_login.dart';

class Tags{
  final String technologys;
  final int id;

  Tags({required this.id, required this.technologys});
}

class CreateProject extends StatefulWidget {
  const CreateProject({super.key});

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  String? dropdownValue = 'Aberto';
  String? dropdownValue2 = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<Tags> tags = [];
  String title = "";
  String description = "";
  String stt = "";
  DateTime dateInitial = DateTime.now();
  DateTime dateEnd  = DateTime.now();
  String area = "";
  String role = "";
  int technologies = 0;

  @override
  void initState() {
    super.initState();
    _startDateController.text = formatDate(startDate);
    _endDateController.text = formatDate(endDate);
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

    String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void getTagId(){
    for (var i in tags) {
      if (i.technologys == dropdownValue2){
        technologies = i.id;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllTags(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var jsonData = snapshot.data;
          tags = [];

          for (int i = jsonData!.length -1; i >= 0; i--) {
            var json = jsonData[i];
            if ( json != null){
              String technology = json['technology'];
              int id = json['id_technology'];
              tags.add(Tags(id: id, technologys: technology));
              for (var i in tags) {
                dropdownValue2 = i.technologys;
              }
            }
          }
        }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/home");
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Title'),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: (text){
                title = text;
              },
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Description'),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: (text){
                description = text;
              },
                maxLines: 5,
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Duration'),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      controller: _startDateController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Start date',
                      ),
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: startDate,
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2030),
                        );
                        if (picked != null && picked != startDate) {
                          setState(() {
                            startDate = picked;
                            dateInitial = picked;
                            _startDateController.text = formatDate(startDate);
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      controller: _endDateController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'End date',
                      ),
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: endDate,
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2030),
                        );
                        if (picked != null && picked != endDate) {
                          setState(() {
                            endDate = picked;
                            dateEnd = picked;
                            print(dateEnd);
                            _endDateController.text = formatDate(endDate);
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Area'),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: (value){
                area = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Position'),
              const SizedBox(height: 10),
              TextFormField(  
                onChanged: (value){
                  role = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Tags'),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                value: dropdownValue2,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue2 = newValue;
                  });
                },
                items: tags.map<DropdownMenuItem<String>>((Tags tag) {
                  return DropdownMenuItem<String>(
                    value: tag.technologys,
                    child: Text(tag.technologys),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text('Status'),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    stt = newValue!;
                  });
                },
                items: const <String>['Aberto', 'Fechado', 'em andamento',"encerado"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      getTagId();
                      getData("userId").then((creator){
                      sendProject(title, description, stt, dateInitial, dateEnd, creator!, area, role, technologies).then((data){
                        Navigator.of(context).pushReplacementNamed("/home");
                      }).catchError((error) {
                        print('Erro: $error');
                      });
                    });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: const Text(
                      'CREATE PROJECT',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });
}}
