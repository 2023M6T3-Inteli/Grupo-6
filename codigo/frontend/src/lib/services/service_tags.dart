import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  getAllTags();
}

const String baseUrl = "http://load-legado-289789458.us-east-1.elb.amazonaws.com";

Future<List<dynamic>> getAllTags() async {
  try {
    var response = await http.get(Uri.parse("$baseUrl/technologie"));
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