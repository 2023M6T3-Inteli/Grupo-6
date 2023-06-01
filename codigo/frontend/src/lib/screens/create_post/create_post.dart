import 'package:flutter/material.dart';
import '../../services/service_post.dart';
import '../../services/service_login.dart';
import '../../services/service_tags.dart';

class Tags{
  final String technologys;
  final int id;

  Tags({required this.id, required this.technologys});
}

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  List<Tags> category = [];
  String?  dropdownValue = '';
  String title = "";
  String description = "";
  String tags = "";
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllTags(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var jsonData = snapshot.data;
          category = [];

          for (int i = jsonData!.length -1; i >= 0; i--) {
            var json = jsonData[i];
            if ( json != null){
              String technology = json['technology'];
              int id = json['id_technology'];
              category.add(Tags(id: id, technologys: technology));
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
        title: const Text(
          'POST',
          style: TextStyle(
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
            const Text('Tags'),
            const SizedBox(height: 10),
            TextFormField(
              onChanged: (text){
                tags = text;
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
            const Text('Category'),
            const SizedBox(height: 10),
            Container(
              height: 60,
              child: DropdownButtonFormField<String>(
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
                  });
                },
                items: category.map<DropdownMenuItem<String>>((Tags tag) {
                  return DropdownMenuItem<String>(
                    value: tag.technologys,
                    child: Text(tag.technologys),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    getData("userId").then((value){
                      sendPost(title, description, dropdownValue!, value!).then((data){
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
                    'CREATE POST',
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
    );
  });
  }}