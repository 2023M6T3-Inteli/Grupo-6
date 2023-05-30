import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:3001";

void main() {
  getAllProjects();
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