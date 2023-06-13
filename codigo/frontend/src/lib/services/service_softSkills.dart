import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  getAllSoftSkills();
}

const String baseUrl = "http://localhost:3001";

Future<List<dynamic>> getAllSoftSkills() async {
  try {
    var response = await http.get(Uri.parse("$baseUrl/skills"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      // print(jsonData);
      return List<dynamic>.from(jsonData);
    } else {
      throw Exception(
          "Failed to load posts. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load posts: $e");
  }
}