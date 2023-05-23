import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:3000";

void main() {
  getAllPosts();
}

getAllPosts() async {
  var response = await http.get(Uri.parse("$baseUrl/post"));
  // var json = jsonDecode(response.body);
  print(response.body);
  return response.body;
}
