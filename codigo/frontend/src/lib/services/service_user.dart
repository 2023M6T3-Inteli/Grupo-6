import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:3000";

void main() {
  getUserById("d56f9ba4-a2fd-4be7-8a9a-22ee7b89c390").then((value){
    print(value);
  });
  // updateUser(
  //     "04db46af-6058-4d42-9aac-a0b97d0e4068",
  //     "https://github.com/vict0rcarvalh0.png",
  //     "vitin",
  //     "dev",
  //     "oi sou o vitinho");
}

Future<List<dynamic>> getAllUsers() async {
  var response = await http.get(Uri.parse("$baseUrl/user"));
  var jsonData = jsonDecode(response.body);
  // print(response.body);
  // print(jsonData);
  return List<dynamic>.from(jsonData);
}

Future<Map<String, dynamic>> getUserById(String id) async {
  print(id);
  try {
    var response = await http.get(Uri.parse("$baseUrl/user/$id"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData as Map<String, dynamic>;
    } else {
      throw Exception(
          "Failed to load post. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load post: $e");
  }
}

Future<dynamic> updateUser(String id, String photoUrl, String name, String role,
    String aboutMe) async {
  var jsonData = jsonEncode({
    "name": name,
    "role": role,
    "photo_url": photoUrl,
    "about_me": aboutMe,
  });

  var response = await http.patch(
    Uri.parse("$baseUrl/user/$id"),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonData,
  );

  // print(jsonData);
  // print(response.body);
  return response.body;
}
