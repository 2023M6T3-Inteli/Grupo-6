import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:src/screens/submit_project/submit_project.dart';

const String baseUrl = "http://10.128.65.225:3001";

void main() {
  // getAllProjects();
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
      print(jsonData);
      return jsonData as Map<String, dynamic>;
    } else {
      throw Exception(
          "Failed to load post. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load post: $e");
  }
}