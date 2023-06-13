import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  // sendPost("kinho3","teste do post","teste","675fb91e-eaf3-4611-8395-786ab81abdb0");
  // getAllPosts();
  getAllPostByCreator("d56f9ba4-a2fd-4be7-8a9a-22ee7b89c390");
}

const String baseUrl = "http://localhost:3000";

Future<List<dynamic>> getAllPosts() async {
  try {
    var response = await http.get(Uri.parse("$baseUrl/post"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
       //print(jsonData);
      return List<dynamic>.from(jsonData);
    } else {
      throw Exception(
          "Failed to load posts. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load posts: $e");
  }
}

Future<Map<String, dynamic>> getPost(String id) async {
  try {
    var response = await http.get(Uri.parse("$baseUrl/post/$id"));
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

Future<void> sendPost(
    String title, String description, String category, String creator) async {
  try {
    var url = Uri.parse("$baseUrl/post");
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      "title": title,
      "description": description,
      "category": category,
      "creator": creator,
    });

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Post enviado com sucesso!");
    } else {
      throw Exception(
          "Failed to send post. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to send post: $e");
  }
}


Future<void> deletePost(String id) async {
  try {
    var url = Uri.parse("$baseUrl/post/$id");
    var headers = {'Content-Type': 'application/json'};

    var response = await http.delete(url, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Post deletado com sucesso!");
    } else {
      throw Exception("Failed to delete post. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to delete post: $e");
  }
}

Future<List<dynamic>> getAllPostByCreator(String creator) async {
  try {
    var response = await http.get(Uri.parse("$baseUrl/post/creator/$creator"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      //  print(jsonData);
      return List<dynamic>.from(jsonData);
    } else {
      throw Exception(
          "Failed to load post. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load post: $e");
  }
}



