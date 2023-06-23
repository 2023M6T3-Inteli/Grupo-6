import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = "http://load-novo-336193150.us-east-1.elb.amazonaws.com";

void main() {
  // getUserById("d56f9ba4-a2fd-4be7-8a9a-22ee7b89c390").then((value){
  //   print(value);
  // });
  updateUser(
      "d56f9ba4-a2fd-4be7-8a9a-22ee7b89c390",
      "mateus neves",
      "backend",
      "prisioneiro do flutter",
      "1,2",
      "1,2,3");
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

Future<dynamic> updateUser(String id, String name, String role, String aboutMe, String hardSkills, String softSkills) async {
  var jsonData = jsonEncode({
    "name": name,
    "role": role,
    "about_me": aboutMe,
    "hard_skills": hardSkills,
    "soft_skills": softSkills,
  });

  var response = await http.patch(
    Uri.parse("$baseUrl/user/$id"),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonData,
  );
  return response.body;
}
