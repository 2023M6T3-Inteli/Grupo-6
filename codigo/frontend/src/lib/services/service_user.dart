import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:3000";

void main() {
  getUserById("d56f9ba4-a2fd-4be7-8a9a-22ee7b89c390");
}

Future<List<dynamic>> getAllUsers() async {
  var response = await http.get(Uri.parse("$baseUrl/user"));
  var jsonData = jsonDecode(response.body);
  // print(response.body);
  // print(jsonData);
  return List<dynamic>.from(jsonData);
}

Future<dynamic> getUserById(String id) async {
   var response = await http.get(Uri.parse("$baseUrl/user/$id"));
   var jsonData = jsonDecode(response.body);
   return jsonData;

}
