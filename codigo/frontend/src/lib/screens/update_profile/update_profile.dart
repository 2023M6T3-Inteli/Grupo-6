import 'package:flutter/material.dart';
import 'package:src/screens/profile/components/body.dart';
import '../../services/service_tags.dart';
import '../../../services/service_user.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../services/service_softSkills.dart';

class Tags{
  final String technologys;
  final int id;

  Tags({required this.id, required this.technologys});
}

class Soft{
  final String softSkills;
  final int id;

  Soft({required this.id, required this.softSkills});
}

class UpdateProfile extends StatefulWidget {
  final String userId;
  const UpdateProfile({required this.userId, Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<Tags> tags = [];
  List<Soft> soft = [];
  String title = "";
  String role = "";
  String name = "";
  String aboutMe = "";
  String hardskills = "";
  String softskills = "";
  List<String> selectedHardSkills = [];
  List<String> selectedSfotSkills = [];
  List<int> hardSkillIds = [];
  List<int> softSkillIds = [];
  int count = 0;
  String newName = "";
  String newRole = "";
  String newAboutMe = "";
  
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

  List<String> getHardSkillNames(List<Tags> tags, String hardSkills) {
    List<String> hardSkillNames = [];

    List<int> hardSkillIds = hardSkills.split(',').map(int.parse).toList();

    for (int id in hardSkillIds) {
      Tags? tag = tags.firstWhere((tag) => tag.id == id);
        hardSkillNames.add(tag.technologys);
    }

    return hardSkillNames;
  }

  List<String> getSoftSkillNames(List<Soft> softSkills, String softSkillsIds) {
    List<String> softSkillNames = [];

    List<int> ids = softSkillsIds.split(',').map(int.parse).toList();

    for (int id in ids) {
      Soft? skill = softSkills.firstWhere((skill) => skill.id == id);
        softSkillNames.add(skill.softSkills);
    }

    return softSkillNames;
  }

  void hardSkillsId(){
    hardSkillIds = [];
    for (String hardSkill in selectedHardSkills) {
      Tags? tag = tags.firstWhere((tag) => tag.technologys == hardSkill);
      hardSkillIds.add(tag.id);
    }
    hardskills = hardSkillIds.join(',');
  }

  void softSkillsId(){
    softSkillIds = [];
    for (String softSkill in selectedSfotSkills) {
      Soft? skill = soft.firstWhere((skill) => skill.softSkills == softSkill);
      softSkillIds.add(skill.id);
    }
    softskills = softSkillIds.join(',');
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserById(userId),
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
          var userData = snapshot.data as Map<String, dynamic>;
          name = userData["name"] ?? "";
          role = userData["role"] ?? "";
          aboutMe = userData["about_me"] ?? "";
          hardskills = userData["hard_skills"] ?? "";
          softskills = userData["soft_skills"] ?? "";
        }  
      if (count == 0){
        newName = name;
        newRole = role;
        newAboutMe = aboutMe;
        count++;
      }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/profile");
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
              const Text('Name'),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: name,
                onChanged: (text){
                newName = text;
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
              const Text('Role'),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: role,
                onChanged: (text){
                newRole = text;
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
              const Text('About me'),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: aboutMe,
                onChanged: (text){
                newAboutMe = text;
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
              FutureBuilder(
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
                      }
                    }
                      if (hardskills != "") {
                     selectedHardSkills = getHardSkillNames(tags, hardskills);
                      }

                } return
               MultiSelectDialogField(
                items: tags.map((e) => MultiSelectItem(e.technologys, e.technologys)).toList(),
                initialValue: selectedHardSkills,
                title: const Text("Hardskills"),
                selectedColor: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                buttonText: const Text(
                  "Hardskills",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                onConfirm: (results) {
                  selectedHardSkills = results;
                },
              );
              }
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: getAllSoftSkills(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var jsonData = snapshot.data;
                    soft = [];

                    for (int i = jsonData!.length -1; i >= 0; i--) {
                      var json = jsonData[i];
                      if ( json != null){
                        String softSkills = json['skill'];
                        int id = json['idSkill'];
                        soft.add(Soft(id: id, softSkills: softSkills));
                      }
                    }
                    if (softskills != "") {
                    selectedSfotSkills = getSoftSkillNames(soft, softskills);
                    }
                } return
               MultiSelectDialogField(
                items: soft.map((e) => MultiSelectItem(e.softSkills, e.softSkills)).toList(),
                initialValue: selectedSfotSkills,
                title: const Text("Softskills"),
                selectedColor: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                buttonText: const Text(
                  "Softskills",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                onConfirm: (results) {
                  selectedSfotSkills = results;
                },
              );
              }
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      hardSkillsId();
                      softSkillsId();
                      updateUser(userId, newName, newRole, newAboutMe, hardskills, softskills).then((data){
                        Navigator.of(context).pushReplacementNamed("/profile");
                    });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: const Text(
                      'UPDATE PROFILE',
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
}
}

