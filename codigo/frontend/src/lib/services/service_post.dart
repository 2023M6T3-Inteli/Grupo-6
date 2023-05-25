import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:3000";

Future<List<dynamic>> getAllPosts() async {
  try {
    var response = await http.get(Uri.parse("$baseUrl/post"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return List<dynamic>.from(jsonData);
    } else {
      throw Exception("Failed to load posts. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load posts: $e");
  }
}
