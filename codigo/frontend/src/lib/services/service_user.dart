import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:3000";

void main() {
  getUserById();
}

Future<List<dynamic>> getAllUsers() async {
  var response = await http.get(Uri.parse("$baseUrl/user"));
  var jsonData = jsonDecode(response.body);
  // print(response.body);
  // print(jsonData);
  return List<dynamic>.from(jsonData);
}

Future<dynamic> getUserById() async {
  var response = await http
      .get(Uri.parse("$baseUrl/user/675fb91e-eaf3-4611-8395-786ab81abdb0"));
  var jsonData = jsonDecode(response.body);
  print(response.body);
  print(jsonData);
  return jsonData;
}
