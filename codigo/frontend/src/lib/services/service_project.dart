import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:3001";

void main() {
  // getProject("projeto Priscila 2",);
  getAllProjectsByCreator("d56f9ba4-a2fd-4be7-8a9a-22ee7b89c390");
}

Future<List<dynamic>> getAllProjects() async {
  try {
    var response = await http.get(Uri.parse("$baseUrl/project"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      //  print(jsonData);
      return List<dynamic>.from(jsonData);
    } else {
      throw Exception(
          "Failed to load posts. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load posts: $e");
  }
}

Future<Map<String, dynamic>> getProject(int id) async {
  try {
    var response = await http.get(Uri.parse("$baseUrl/project/$id"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      // print(jsonData);
      return jsonData as Map<String, dynamic>;
    } else {
      throw Exception(
          "Failed to load post. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load post: $e");
  }
}


Future<void> sendProject(
  String title, String description, String stt, DateTime dateInitial, 
  DateTime dateEnd, String creator, String area, String role, int technologies) async {
  try {
    var url = Uri.parse("$baseUrl/project");
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      "title": title,
      "description": description,
      "stt": stt,
      "submission_date": "2020-12-19",
      "date_initial": dateInitial.toIso8601String(),
      "date_end": dateEnd.toIso8601String(),
      "creator": {
        "id_profile": creator
      },
      "area": area,
      "role": role,
      "auth": true,
      "technologies": [
        {
          "id_technology": technologies
        }
      ]
    });

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Projeto enviado com sucesso!");
    } else {
      throw Exception(
          "Failed to send project. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to send project: $e");
  }
}

Future<List<dynamic>> getAllProjectsByCreator(String creator) async {
  try {
    var response = await http.get(Uri.parse("$baseUrl/project/creator/$creator"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      //  print(jsonData);
      return List<dynamic>.from(jsonData);
    } else {
      throw Exception(
          "Failed to load project. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load project: $e");
  }
}