import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:3000";

void main() {
  getAllPosts().then((data) {
    print(data);
  }).catchError((error) {
    print('Erro: $error');
  });
}

getAllPosts() async {
  var response = await http.get(Uri.parse("$baseUrl/post"));
  var json = jsonDecode(response.body);
  return json;
}
