import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  sendSubmision("sei la sei la sei la",2,"d56f9ba4-a2fd-4be7-8a9a-22ee7b89c390");
}

const String baseUrl = "http://localhost:3001";

Future<void> sendSubmision(
    String reason, int idProject, String idProfile) async {
  try {
    var url = Uri.parse("$baseUrl/submission");
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
  "reason": reason,
  "stt": "analise",
  "idProject": {
    "idProject": idProject
  },
  "id_profile": {
    "id_profile": idProfile
  }
});
    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Submission enviado com sucesso!");
    } else {
      throw Exception(
          "Failed to send Submission. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to send Submission: $e");
  }
}